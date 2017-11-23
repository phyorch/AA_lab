# Greedy disjoint paths
import networkx as nx


class Path(object):
    def __init__(self, start, end, path, length):
        self.start = start
        self.end = end
        self.path = path
        self.length = length

def path_finding(Graph, choosing_node, result_path, method):
    if method == 'greedy':
        threshold = 100
    if method == 'pricing':
        threshold = 10000
    while True:
        choosing_path = []
        for elem in choosing_node:
            fea_path = Path(elem[0], elem[1], nx.shortest_path(Graph, elem[0], elem[1] ),\
             nx.shortest_path_length(Graph, elem[0], elem[1], weight='weight'))
            # every feasible node pair trslated to class path
            choosing_path.append(fea_path)

        # choosing the best/shortest path and delete it
        idx = 0
        min = float('Inf')
        for i in range(len(choosing_path)):
            if choosing_path[i].length < min:
                idx = i
                min = choosing_path[i].length
        if min < threshold:
            result_path.append(choosing_path[idx])  # add this path into our solution
            path = choosing_path[idx].path
            for i in range(len(path) - 1):
                Graph[path[i]][path[i + 1]][
                    'weight'] *= 100  # once an edge is choosen, its cost/length become very high
                # remove all the edge the path pass
        else:
            break
    return result_path

def Draw(pathlist):
    disjoint_path = nx.DiGraph()
    for elem in pathlist:
        disjoint_path.add_path(elem.path)
    nx.draw(disjoint_path,with_labels=True,node_color='yellow',
            edge_color='red', node_size=400, alpha=1)

if __name__ == "__main__":
    # Graph structure using for greedy method
    G_greedy = nx.DiGraph()
    G_greedy.add_path(['s1', 1, 2, 3, 4, 5, 't1'], weight=1)
    G_greedy.add_weighted_edges_from([('s1', 1, 1), ('s2', 2, 1), ('s3', 3, 1), ('s4', 4, 1) \
                                         , (3, 't2', 1), (4, 't3', 1), (5, 't4', 1), (5, 't1', 1)])

    # Graph structure using for pricing method
    G_pricing = nx.DiGraph()
    G_pricing.add_path(['s3', 3, 4, 5, 6, 7, 8, 9, 't4'], weight=1)
    G_pricing.add_path(['s2', 2, 3, 4, 10, 11, 12, 13, 14, 't3'], weight=1)
    G_pricing.add_path(['s1', 1, 2, 3, 15, 16, 17, 18, 19, 20, 't2'], weight=1)
    G_pricing.add_weighted_edges_from([('s4', 4, 1), (5, 't1', 1), (6, 't2', 1)])

    # total expected path
    choosing_node = [('s1', 't1'), ('s2', 't2'), ('s3', 't3'), ('s4', 't4')]
    result_path = []
    result_path = path_finding(G_greedy, choosing_node, result_path, 'greedy')
    Draw(result_path)
    result_path = []
    result_path = path_finding(G_pricing, choosing_node, result_path, 'pricing')
    Draw(result_path)