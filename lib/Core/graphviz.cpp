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

#include <fstream>
#include <utility>
#include "/home/jorge/klee/lib/Core/graphviz.h"
#include "Memory.h"

using namespace graphvizpp;
std::string name;
std::string assembly_l;
std::string source_l;
std::string extra_label;
int final_graph_number=1;
std::string final_instruction;


Node *Graph::add_node(std::string id) {
    auto node = new Node(std::move(id));
    nodes.push_back(node);
    return node;
}

Edge *Graph::add_edge(std::string from, std::string to) {
    auto edge = new Edge(std::move(from), std::move(to));
    edges.push_back(edge);
    return edge;
}

std::stringstream Graph::to_string() {
    std::stringstream out;
    out << (strict ? "strict " : "")
        << (directed ? "digraph" : "graph")
        << "{\n";
    for(const auto &attribute : graph_attributes){
        out << '\t' << attribute.first << '=' << attribute.second << '\n';
    }
    out << '\t' << "node [ ";
    for(const auto &attribute : node_attributes){
        out << attribute.first << '=' << attribute.second << ' ';
    }
    out << "]\n"
        << '\t' << "edge [ ";
    for(const auto &attribute : edge_attributes){
        out << attribute.first << '=' << attribute.second << ' ';
    }
    out << "]\n";
    for(auto &node : nodes){
        out << '\t' << node->id << " [ ";
        for(const auto &attribute : node->attributes){
            out << attribute.first << '=' << attribute.second << ' ';
        }
        out << "]\n";
    }
    for(auto &edge : edges){
        out << '\t' << edge->from << (directed ? " -> " : " -- ") << edge->to << " [ ";
        for(const auto &attribute : edge->attributes){
            out << attribute.first << '=' << attribute.second << ' ';
        }
        out << "]\n";
    }
    return out;
}
void Graph::getTestName(std::string test_name)const{
    name = test_name.substr(0, test_name.find_last_of("."));
    name = name+".dot";
    llvm::errs()<<"NAME GRAPH"<<name<<"\n";
}

void Graph::to_file(const std::string &path,Graph g) {
    std::ofstream file(name,std::ios_base::out);
    file << path;
}
void Graph::getNodeLabel(std::string name_node)const
{
    extra_label=name_node;

}
void Graph::getEdgeLabel(std::string edge_from, std::string edge_to)const
{
    extra_label=edge_from + "->"+edge_to;

}

void Graph::setLabel(std::string assembly, std::string source)const
{
    assembly_l=assembly;
    source_l=source;

}

void Graph::getInstruction(std::string instruction)
{
    final_instruction = instruction;
}

void Graph::finalString(bool final_graph,bool global,Graph g)const
{
    std::stringstream final_out;
    final_out=g.to_string();

    if(global == false && final_graph==false)
    {
        final_out<< '\t'<< "label = "<<'"'<<extra_label<<": "<<"Instruction in Assembly Line "<< assembly_l<<" Source Line "<<source_l<<"\t" << final_instruction<<'"';
        final_out<< '\t'<< "fontsize = "<<'"'<<"12"<<'"'<<"\n";
        final_out << '}';
        std::string path = final_out.str();
        llvm::errs()<<"GRAFICO:"<<path<<"\n";
        g.to_file(path,g);
    }
    if(global == true && final_graph==false)
    {
        final_out << '}';
        std::string path = final_out.str();
        llvm::errs()<<"GRAFICO:"<<path<<"\n";
        g.to_file(path,g);
    }
    if(global == false && final_graph==true)
    {
        std::vector<graphvizpp::Node *> new_nodes;
        for(const auto &node : nodes){
            auto new_node =node;
          for(const auto &edge : edges){
            auto new_edge=edge;
            if(new_node->id==new_edge->from)
            {
                new_nodes.push_back(new_node);
            }

          }
        }
        std::stringstream out;
        out << (strict ? "strict " : "")
            << (directed ? "digraph" : "graph")
            << "{\n";
        for(const auto &attribute : graph_attributes){
            out << '\t' << attribute.first << '=' << attribute.second << '\n';
        }
        out << '\t' << "node [ ";
        for(const auto &attribute : node_attributes){
            out << attribute.first << '=' << attribute.second << ' ';
        }
        out << "]\n"
            << '\t' << "edge [ ";
        for(const auto &attribute : edge_attributes){
            out << attribute.first << '=' << attribute.second << ' ';
        }
        out << "]\n";
        for(auto &node : new_nodes){
            out << '\t' << node->id << " [ ";
            for(const auto &attribute : node->attributes){
                out << attribute.first << '=' << attribute.second << ' ';
            }
            out << "]\n";
        }
        for(auto &edge : edges){
            out << '\t' << edge->from << (directed ? " -> " : " -- ") << edge->to << " [ ";
            for(const auto &attribute : edge->attributes){
                out << attribute.first << '=' << attribute.second << ' ';
            }
            out << "]\n";
        }
        out<< '\t'<< "label = "<<'"'<<"Final Graph Number "<< final_graph_number <<'"' <<"\n";
        out << '}';
        std::string path = out.str();
        llvm::errs()<<"GRAFICO:"<<path<<"\n";
        g.to_file(path,g);
        final_graph_number++;
        
    }
}