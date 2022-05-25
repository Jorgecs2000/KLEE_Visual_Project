#ifndef GRAPHVIZPP_LIBRARY_H
#define GRAPHVIZPP_LIBRARY_H

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
#include "Memory.h"



#include <string>
#include <utility>
#include <vector>
#include <map>

namespace graphvizpp{
    class Node;
    class Graph;

    class Edge{
        friend class Graph;
        std::string from, to;
        std::map<std::string, std::string> attributes;

    public:
        Edge(std::string from, std::string to) :
                from(std::move(from)), to(std::move(to)) {}
    };


    class Node{
        friend class Graph;
        
        std::map<std::string, std::string> attributes;

    public:
        std::string id;
        explicit Node(std::string id) :
                id(std::move(id)) {}
    };


    class Graph{
        bool directed;
        bool strict;
        std::string id;
        std::vector<Node*> nodes;
        std::vector<Edge*> edges;

    public:
        std::map<std::string, std::string> graph_attributes;
        std::map<std::string, std::string> node_attributes;
        std::map<std::string, std::string> edge_attributes;

        explicit Graph(bool directed, bool strict = false, std::string id = "") :
                directed(directed), strict(strict), id(std::move(id)) {}

        Node* add_node(std::string id);

        Edge* add_edge(std::string from, std::string to);

        std::string to_string();

        void to_file(const std::string &path);
        void fileGraph(Graph g);
        void getTestName(std::string name);
    };

}


#endif