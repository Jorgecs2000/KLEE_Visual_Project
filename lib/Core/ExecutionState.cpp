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

 graphvizpp::Graph g(true,false,"g");

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
    //graph history = state.graph
    //vector of graphs
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

//Here is going to be the code where the array and the pointer are save in the map
void ExecutionState::recordMemoryObject(MemoryObject *mo, Node *node)
{
  pointerNodeMap.insert(std::pair<MemoryObject*,Node*>(mo,node));
  pointerNodeReverseMap.insert(std::pair<Node*,MemoryObject*>(node,mo));
  g.add_node(mo->name);
}

  std::string ExecutionState::lookUpLocal(const MemoryObject *mo)
  {
    Node *p = pointerNodeMap.find(mo)->second;
    //g.add_node(p->id);
    llvm::errs()<<"Look Up Local:"<< mo << "\n";
    return (p->id);
  }

  std::string ExecutionState::lookUpGlobal(const MemoryObject *global)
  {
    Node *gl = pointerNodeMap.find(global)->second;
    g.add_node(gl->id);
    return (gl->id);
    
  }
  
  void ExecutionState::getDirectionName(std::string test_name)
  {
    
    g.getTestName(test_name);
    g.fileGraph(g);


  }
  void ExecutionState::createEdge(std::string p, std::string a){
      g.add_edge(p,a);

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
