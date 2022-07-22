//===-- ExecutionState.cpp ------------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "ExecutionState.h"

#include "Memory.h"

#include "klee/Expr/Expr.h"
#include "klee/Module/Cell.h"
#include "klee/Module/InstructionInfoTable.h"
#include "klee/Module/KInstruction.h"
#include "klee/Module/KModule.h"
#include "klee/Support/Casting.h"
#include "klee/Support/OptionCategories.h"

#include "llvm/IR/Function.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"

#include <cassert>
#include <iomanip>
#include <map>
#include <set>
#include <sstream>
#include <stdarg.h>
#include "graphviz.h"


using namespace llvm;
using namespace klee;
using namespace graphvizpp;

namespace {
cl::opt<bool> DebugLogStateMerge(
    "debug-log-state-merge", cl::init(false),
    cl::desc("Debug information for underlying state merging (default=false)"),
    cl::cat(MergeCat));
}

/***/

std::uint32_t ExecutionState::nextID = 1;

 //Modify By Jorge Calvo Soria
 
 // I think here should go the maps creation

 std::map<const MemoryObject*, Node*> pointerNodeMap;
 std::map<Node*,const MemoryObject*> pointerNodeReverseMap;
 unsigned int num_test;
 int repeated;
 int times_repeated;
 std::string assembly_line;
 std::string source_line;
 std::map<std::string,std::string > nodeassemblyMap;
 std::map<std::string,std::string > nodesourceMap;
 std::multimap<std::string,std::string > edgeassemblyMap;
 std::multimap<std::string,std::string > edgesourceMap;
 std::map<std::string,bool > isGlobalMap;
 std::map<unsigned,std::string > assemblyMap;
 std::vector <std::string> repeated_edge;
 std::map<std::string,size_t > edgeRepeatedcount;
 std::map<std::string,size_t > edgeTimeEntered; 

 //End of modification by Jorge Calvo Soria
/***/

StackFrame::StackFrame(KInstIterator _caller, KFunction *_kf)
  : caller(_caller), kf(_kf), callPathNode(0), 
    minDistToUncoveredOnReturn(0), varargs(0) {
  locals = new Cell[kf->numRegisters];
}

StackFrame::StackFrame(const StackFrame &s) 
  : caller(s.caller),
    kf(s.kf),
    callPathNode(s.callPathNode),
    allocas(s.allocas),
    minDistToUncoveredOnReturn(s.minDistToUncoveredOnReturn),
    varargs(s.varargs) {
  locals = new Cell[s.kf->numRegisters];
  for (unsigned i=0; i<s.kf->numRegisters; i++)
    locals[i] = s.locals[i];
}

StackFrame::~StackFrame() { 
  delete[] locals; 
}

/***/

ExecutionState::ExecutionState(KFunction *kf) :
    g(true,false,"g"),
    pc(kf->instructions),
    prevPC(pc),
    depth(0),
    ptreeNode(nullptr),
    steppedInstructions(0),
    instsSinceCovNew(0),
    coveredNew(false),
    forkDisabled(false) {
  pushFrame(nullptr, kf);
  setID();

}

ExecutionState::~ExecutionState() {
  for (const auto &cur_mergehandler: openMergeStack){
    cur_mergehandler->removeOpenState(this);
  }

  while (!stack.empty()) popFrame();
}

ExecutionState::ExecutionState(const ExecutionState& state):
    g(state.g),
    vec_graphs(state.vec_graphs),
    pc(state.pc),
    prevPC(state.prevPC),
    stack(state.stack),
    incomingBBIndex(state.incomingBBIndex),
    depth(state.depth),
    addressSpace(state.addressSpace),
    constraints(state.constraints),
    pathOS(state.pathOS),
    symPathOS(state.symPathOS),
    coveredLines(state.coveredLines),
    symbolics(state.symbolics),
    arrayNames(state.arrayNames),
    openMergeStack(state.openMergeStack),
    steppedInstructions(state.steppedInstructions),
    instsSinceCovNew(state.instsSinceCovNew),
    unwindingInformation(state.unwindingInformation
                             ? state.unwindingInformation->clone()
                             : nullptr),
    coveredNew(state.coveredNew),
    forkDisabled(state.forkDisabled) {
  for (const auto &cur_mergehandler: openMergeStack)
    cur_mergehandler->addOpenState(this);
    
}

ExecutionState *ExecutionState::branch() {
  depth++;

  auto *falseState = new ExecutionState(*this);
  falseState->setID();
  falseState->coveredNew = false;
  falseState->coveredLines.clear();

  return falseState;
}

void ExecutionState::pushFrame(KInstIterator caller, KFunction *kf) {
  stack.emplace_back(StackFrame(caller, kf));
}

void ExecutionState::popFrame() {
  const StackFrame &sf = stack.back();
  for (const auto * memoryObject : sf.allocas)
    addressSpace.unbindObject(memoryObject);
  stack.pop_back();
}

void ExecutionState::addSymbolic(const MemoryObject *mo, const Array *array) {
  symbolics.emplace_back(ref<const MemoryObject>(mo), array);
}
//Modify by Jorge Calvo Soria
void ExecutionState::printAddressSpace(){
  
  llvm::errs() << addressSpace.objects << "\n";
  llvm::errs() << "ID" << "\n";
  llvm::errs() << "-----" << "\n";
  
    MemoryMap mm = addressSpace.objects;
    size_t sizem = mm.size();
    
  MemoryMap::iterator it = mm.begin();
  MemoryMap::iterator ie = mm.end();
    if (it!=ie) {
    llvm::errs() << it->first->id << " ";
    llvm::errs() << " SIZE:" << it->first->size << " " ;
    llvm::errs() << " GLOBAL:" << it->first->isGlobal << " " ;
    llvm::errs() << "ADDRESS:" << it->first->address << "\n";
    
    for (++it; it!=ie; ++it)
    {
    
      llvm::errs() << it->first->id << " ";
      llvm::errs() << " SIZE:" << it->first->size << " " ;
      llvm::errs() << " GLOBAL:" << it->first->isGlobal << " " ;
      llvm::errs() << " ADDRESS:" << it->first->address << "\n";
      
    }
    llvm::errs() << " SIZE MemoryMap:" << sizem << " " << "\n" ;
  }
}
//End of modification made by Jorge Calvo Soria


//Modify by Jorge Calvo Soria
void ExecutionState::recordLineMap(std::map<unsigned, std::string>lineMap)
{
  assemblyMap=lineMap;

}


void ExecutionState::recordMemoryObject(MemoryObject *mo, Node *node)
{
  pointerNodeMap.insert(std::pair<MemoryObject*,Node*>(mo,node));
  pointerNodeReverseMap.insert(std::pair<Node*,MemoryObject*>(node,mo));
  g.add_node(mo->name);
  vec_graphs.push_back(g);
  nodeassemblyMap.insert(std::pair<std::string,std::string>(mo->name,std::to_string(prevPC->info->assemblyLine)));
  nodesourceMap.insert(std::pair<std::string,std::string>(mo->name,std::to_string(prevPC->info->line)));
  isGlobalMap.insert(std::pair<std::string,bool>(mo->name,false));
  
}

  std::string ExecutionState::lookUpLocal(const MemoryObject *mo)
  {
    Node *p = pointerNodeMap.find(mo)->second;
    return (p->id);
  }

  void ExecutionState::recordGlobal(MemoryObject *global,Node *node)
  {
    pointerNodeMap.insert(std::pair<MemoryObject*,Node*>(global,node));
    pointerNodeReverseMap.insert(std::pair<Node*,MemoryObject*>(node,global));
    g.add_node(global->name);
    vec_graphs.push_back(g);
    nodeassemblyMap.insert(std::pair<std::string,std::string>(global->name,std::to_string(prevPC->info->assemblyLine)));
    nodesourceMap.insert(std::pair<std::string,std::string>(global->name,std::to_string(prevPC->info->line)));
    isGlobalMap.insert(std::pair<std::string,bool>(global->name,true));
  }
  void ExecutionState::getNumberofTest(unsigned int num_test_generated)const
  {
    num_test=num_test_generated;

  }
  void ExecutionState::evolutionGraphs(std::string test_name)const
  {

        std::string final_node;
        std::string last_node;
        std::string final_edge_from;
        std::string final_edge_to;
        std::string final_edge;
        std::string last_edge;
        bool final_global_node;
        for(size_t i=0;i<vec_graphs.size();i++)
        {
          std::string direction = test_name.substr(0, test_name.find_last_of("/")+1);
          graphvizpp::Graph g_evolution = vec_graphs[i];
          for(const auto &node : g_evolution.nodes){
            final_node=node->id;
          }
          for(const auto &edge : g_evolution.edges){
            final_edge_from=edge->from;
            final_edge_to=edge->to;
            final_edge=final_edge_from+final_edge_to;
          }
          if((final_node!=last_node) || (final_edge.empty()))
          {
            assembly_line=nodeassemblyMap.find(final_node)->second;
            source_line=nodesourceMap.find(final_node)->second;
            final_global_node=isGlobalMap.find(final_node)->second;
            g_evolution.getNodeLabel(final_node);
            last_node=final_node;
          }
          else
          {
            size_t times_entered;
            if(edgeassemblyMap.count(final_edge)==1)
            {
              assembly_line=edgeassemblyMap.find(final_edge)->second;
              source_line=edgesourceMap.find(final_edge)->second;
              g_evolution.getEdgeLabel(final_edge_from,final_edge_to);
              last_edge=final_edge;
              edgeTimeEntered.insert(std::pair<std::string,size_t>(final_edge,times_entered));
              edgeTimeEntered.find(final_edge)->second++;
            }
            else
            { 
              
              edgeRepeatedcount.insert(std::pair<std::string,size_t>(final_edge,edgeassemblyMap.count(final_edge)));
              edgeTimeEntered.insert(std::pair<std::string,size_t>(final_edge,times_entered));

              
              if(edgeTimeEntered.find(final_edge)->second==0)
              {
                
                auto it = edgeassemblyMap.equal_range(final_edge);
                auto it2 = edgesourceMap.equal_range(final_edge);
                auto itr = it.first;
                auto itr2 = it2.first;
                assembly_line=edgeassemblyMap.find(itr->first)->second;
                source_line=edgesourceMap.find(itr2->first)->second;
                g_evolution.getEdgeLabel(final_edge_from,final_edge_to);
                edgeTimeEntered.find(final_edge)->second++;

              }
              else
              {

                size_t numbertimes = 0;
                auto it = edgeassemblyMap.equal_range(final_edge);
                auto it2 = edgesourceMap.equal_range(final_edge);
                auto itr1 = it.first;
                auto itr2 = it2.first;
                std::string final_name;
                std::string final_assembly;
                std::string final_source;

               
                for(auto itr = it.first;numbertimes<=edgeTimeEntered.find(final_edge)->second;++itr)
                {

                  final_name = itr1->first;
                  final_assembly = itr1->second;
                  final_source = itr2->second;
                  numbertimes++;
                  itr2++;
                  itr1++;

                }
                g_evolution.getEdgeLabel(final_edge_from,final_edge_to);
                assembly_line=final_assembly;
                source_line=final_source;
              }
            }

          }
          std::string name_g ;
         if(i<10)
         {
          name_g = "g_0"+std::to_string(i)+"_t_"+std::to_string(num_test);
         }
         else
         {
          name_g = "g_"+std::to_string(i)+"_t_"+std::to_string(num_test);
         }
          direction=direction+name_g;
          g_evolution.setLabel(assembly_line,source_line);
          std::string inst_assembly = assemblyMap.find(std::stoul(assembly_line))->second;
          std::string inst_assembly_2 = inst_assembly.substr(19,inst_assembly.size());
          g_evolution.getInstruction(inst_assembly_2);
          g_evolution.getTestName(direction);
          if(final_global_node)
          {
            g_evolution.finalString(false,true,g_evolution);
            final_global_node=false;
          }
          else
          {
            g_evolution.finalString(false,false,g_evolution);
          }
          
        }
        g.setLabel(assembly_line,source_line);
        g.getTestName(test_name);
        g.finalString(true,false,g);
  }
  void ExecutionState::createEdge(std::string p, std::string a){
   
      g.add_edge(p,a);
      vec_graphs.push_back(g);
      edgeassemblyMap.insert(std::pair<std::string,std::string>(p+a,std::to_string(prevPC->info->assemblyLine)));
      edgesourceMap.insert(std::pair<std::string,std::string>(p+a,std::to_string(prevPC->info->line)));
  }


//End of modification made by Jorge Calvo Soria


/**/

llvm::raw_ostream &klee::operator<<(llvm::raw_ostream &os, const MemoryMap &mm) {
  os << "{";
  MemoryMap::iterator it = mm.begin();
  MemoryMap::iterator ie = mm.end();
  if (it!=ie) {
    os << "MO" << it->first->id << ":" << it->second.get();
    for (++it; it!=ie; ++it)
      os << ", MO" << it->first->id << ":" << it->second.get();
  }
  os << "}";
  return os;
}

bool ExecutionState::merge(const ExecutionState &b) {
  if (DebugLogStateMerge)
    llvm::errs() << "-- attempting merge of A:" << this << " with B:" << &b
                 << "--\n";
  if (pc != b.pc)
    return false;

  // XXX is it even possible for these to differ? does it matter? probably
  // implies difference in object states?

  if (symbolics != b.symbolics)
    return false;

  {
    std::vector<StackFrame>::const_iterator itA = stack.begin();
    std::vector<StackFrame>::const_iterator itB = b.stack.begin();
    while (itA!=stack.end() && itB!=b.stack.end()) {
      // XXX vaargs?
      if (itA->caller!=itB->caller || itA->kf!=itB->kf)
        return false;
      ++itA;
      ++itB;
    }
    if (itA!=stack.end() || itB!=b.stack.end())
      return false;
  }

  std::set< ref<Expr> > aConstraints(constraints.begin(), constraints.end());
  std::set< ref<Expr> > bConstraints(b.constraints.begin(), 
                                     b.constraints.end());
  std::set< ref<Expr> > commonConstraints, aSuffix, bSuffix;
  std::set_intersection(aConstraints.begin(), aConstraints.end(),
                        bConstraints.begin(), bConstraints.end(),
                        std::inserter(commonConstraints, commonConstraints.begin()));
  std::set_difference(aConstraints.begin(), aConstraints.end(),
                      commonConstraints.begin(), commonConstraints.end(),
                      std::inserter(aSuffix, aSuffix.end()));
  std::set_difference(bConstraints.begin(), bConstraints.end(),
                      commonConstraints.begin(), commonConstraints.end(),
                      std::inserter(bSuffix, bSuffix.end()));
  if (DebugLogStateMerge) {
    llvm::errs() << "\tconstraint prefix: [";
    for (std::set<ref<Expr> >::iterator it = commonConstraints.begin(),
                                        ie = commonConstraints.end();
         it != ie; ++it)
      llvm::errs() << *it << ", ";
    llvm::errs() << "]\n";
    llvm::errs() << "\tA suffix: [";
    for (std::set<ref<Expr> >::iterator it = aSuffix.begin(),
                                        ie = aSuffix.end();
         it != ie; ++it)
      llvm::errs() << *it << ", ";
    llvm::errs() << "]\n";
    llvm::errs() << "\tB suffix: [";
    for (std::set<ref<Expr> >::iterator it = bSuffix.begin(),
                                        ie = bSuffix.end();
         it != ie; ++it)
      llvm::errs() << *it << ", ";
    llvm::errs() << "]\n";
  }

  // We cannot merge if addresses would resolve differently in the
  // states. This means:
  // 
  // 1. Any objects created since the branch in either object must
  // have been free'd.
  //
  // 2. We cannot have free'd any pre-existing object in one state
  // and not the other

  if (DebugLogStateMerge) {
    llvm::errs() << "\tchecking object states\n";
    llvm::errs() << "A: " << addressSpace.objects << "\n";
    llvm::errs() << "B: " << b.addressSpace.objects << "\n";
  }
    
  std::set<const MemoryObject*> mutated;
  MemoryMap::iterator ai = addressSpace.objects.begin();
  MemoryMap::iterator bi = b.addressSpace.objects.begin();
  MemoryMap::iterator ae = addressSpace.objects.end();
  MemoryMap::iterator be = b.addressSpace.objects.end();
  for (; ai!=ae && bi!=be; ++ai, ++bi) {
    if (ai->first != bi->first) {
      if (DebugLogStateMerge) {
        if (ai->first < bi->first) {
          llvm::errs() << "\t\tB misses binding for: " << ai->first->id << "\n";
        } else {
          llvm::errs() << "\t\tA misses binding for: " << bi->first->id << "\n";
        }
      }
      return false;
    }
    if (ai->second.get() != bi->second.get()) {
      if (DebugLogStateMerge)
        llvm::errs() << "\t\tmutated: " << ai->first->id << "\n";
      mutated.insert(ai->first);
    }
  }
  if (ai!=ae || bi!=be) {
    if (DebugLogStateMerge)
      llvm::errs() << "\t\tmappings differ\n";
    return false;
  }
  
  // merge stack

  ref<Expr> inA = ConstantExpr::alloc(1, Expr::Bool);
  ref<Expr> inB = ConstantExpr::alloc(1, Expr::Bool);
  for (std::set< ref<Expr> >::iterator it = aSuffix.begin(), 
         ie = aSuffix.end(); it != ie; ++it)
    inA = AndExpr::create(inA, *it);
  for (std::set< ref<Expr> >::iterator it = bSuffix.begin(), 
         ie = bSuffix.end(); it != ie; ++it)
    inB = AndExpr::create(inB, *it);

  // XXX should we have a preference as to which predicate to use?
  // it seems like it can make a difference, even though logically
  // they must contradict each other and so inA => !inB

  std::vector<StackFrame>::iterator itA = stack.begin();
  std::vector<StackFrame>::const_iterator itB = b.stack.begin();
  for (; itA!=stack.end(); ++itA, ++itB) {
    StackFrame &af = *itA;
    const StackFrame &bf = *itB;
    for (unsigned i=0; i<af.kf->numRegisters; i++) {
      ref<Expr> &av = af.locals[i].value;
      const ref<Expr> &bv = bf.locals[i].value;
      if (!av || !bv) {
        // if one is null then by implication (we are at same pc)
        // we cannot reuse this local, so just ignore
      } else {
        av = SelectExpr::create(inA, av, bv);
      }
    }
  }

  for (std::set<const MemoryObject*>::iterator it = mutated.begin(), 
         ie = mutated.end(); it != ie; ++it) {
    const MemoryObject *mo = *it;
    const ObjectState *os = addressSpace.findObject(mo);
    const ObjectState *otherOS = b.addressSpace.findObject(mo);
    assert(os && !os->readOnly && 
           "objects mutated but not writable in merging state");
    assert(otherOS);

    ObjectState *wos = addressSpace.getWriteable(mo, os);
    for (unsigned i=0; i<mo->size; i++) {
      ref<Expr> av = wos->read8(i);
      ref<Expr> bv = otherOS->read8(i);
      wos->write(i, SelectExpr::create(inA, av, bv));
    }
  }

  constraints = ConstraintSet();

  ConstraintManager m(constraints);
  for (const auto &constraint : commonConstraints)
    m.addConstraint(constraint);
  m.addConstraint(OrExpr::create(inA, inB));

  return true;
}

void ExecutionState::dumpStack(llvm::raw_ostream &out) const {
  unsigned idx = 0;
  const KInstruction *target = prevPC;
  for (ExecutionState::stack_ty::const_reverse_iterator
         it = stack.rbegin(), ie = stack.rend();
       it != ie; ++it) {
    const StackFrame &sf = *it;
    Function *f = sf.kf->function;
    const InstructionInfo &ii = *target->info;
    out << "\t#" << idx++;
    std::stringstream AssStream;
    AssStream << std::setw(8) << std::setfill('0') << ii.assemblyLine;
    out << AssStream.str();
    out << " in " << f->getName().str() << " (";
    // Yawn, we could go up and print varargs if we wanted to.
    unsigned index = 0;
    for (Function::arg_iterator ai = f->arg_begin(), ae = f->arg_end();
         ai != ae; ++ai) {
      if (ai!=f->arg_begin()) out << ", ";

      out << ai->getName().str();
      // XXX should go through function
      ref<Expr> value = sf.locals[sf.kf->getArgRegister(index++)].value;
      if (isa_and_nonnull<ConstantExpr>(value))
        out << "=" << value;
    }
    out << ")";
    if (ii.file != "")
      out << " at " << ii.file << ":" << ii.line;
    out << "\n";
    target = sf.caller;
  }
}

void ExecutionState::addConstraint(ref<Expr> e) {
  ConstraintManager c(constraints);
  c.addConstraint(e);
}
