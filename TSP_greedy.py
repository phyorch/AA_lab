import matplotlib.pyplot as plt
import numpy as np
import scipy.spatial.distance as dist

class node(object):
    def __init__(self, order, pos, visit):
        self.order = order
        self.pos = pos
        self.visit = visit

G = []
g = [[0,0],[2,3],[0,6],[5,9],[10,6],[11,2.5],[10,0],[16,0],[15,4],[16,8]]
g = np.array(g)
g1 = 30*np.random.rand(50,2)
plt.plot(g1[:,0], g1[:,1], 'ro', markersize=16)
plt.show()
#Node = node(1, (1, 2), 0)


for i in range(len(g1)):
    Node = node(i, (g1[i,0], g1[i,1]), 0)
    G.append(Node)

path_max = 0
path_min = 0
for idx in range(len(G)):
    # idx = 9
    path_length = 0
    step = 0
    while step < len(G):
        min_len = float('inf')
        current = G[idx]
        for i in range(len(G)):
            if G[i].visit == 0:
                dis = ((G[i].pos[0] - current.pos[0]) ** 2 + (G[i].pos[1] - current.pos[1]) ** 2) ** 0.5
                if dis!=0:
                    if dis < min_len:
                        idx = G[i].order
                        min_len = dis
        G[idx].visit = 1
        path_length += min_len
        step += 1
        #print(G[idx].pos)
        #print(G[idx].order)
    print(path_length)
    for elem in G:
        elem.visit = 0
    if path_length>path_max:
        path_length = path_max
    if path_length<path_min:
        path_length = path_min
print(path_max)
print(path_min)





