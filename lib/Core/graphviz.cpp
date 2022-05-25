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

std::string Graph::to_string() {
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
    out << '}';
    return out.str();
}
void Graph::getTestName(std::string test_name){
    name = test_name.substr(0, test_name.find_last_of("."));
    name = name.substr((name.find_last_of("/"))+1,name.length())+".dot";
}

void Graph::to_file(const std::string &path) {
    std::ofstream file(name,std::ios_base::out);
    file << to_string();
}

void Graph::fileGraph(Graph g)
{	
	
	std::string path = g.to_string();
    llvm::errs() <<"GRAFICO:"<< path <<"\n";
	g.to_file(path);
	
}