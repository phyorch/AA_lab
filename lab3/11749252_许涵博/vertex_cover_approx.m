function [vertex_set_indices, prices] = vertex_cover_approx(graph_mat, w)
% *********************************************************************** %
% Vertex Cover Approximation Algorithm (Pricing Method).
% -------
% INPUT :
% -------
%   graph_mat : matrix(edge_num, 2), Integer :: each row denotes an edge
%       e.g., [1 2; 2 3; 3 4; 4 1; 2 4]
%   w : matrix(1, node_num), Double :: node w
%       e.g., [3 4 3 5]
% -------
% OUTPUT:
% -------
%   vertex_set_indices : matrix(1, ?), Integer :: vertex set indices generated sequentially
%       e.g., [1 2 3]
%   prices : matrix(1, ?), Double :: prices generated sequentially
%       e.g., [3 1 2]
% *********************************************************************** %

prices = zeros(1,length(graph_mat(:,1))); %set all edge 0
pay = zeros(1,length(w)); %every vertex has been paid for some value
vertex_set_indices = [];

    for i=1:length(pay)
        if pay(i)<w(i)
           for j=1:length(pay)
               [exist,pos] = ismember([i,j],graph_mat,'rows'); %this promise i~=j at the same time
               if pay(j)<w(j) && exist && prices(pos)==0%select edge(i,j),increase prices under w
                   if w(i)-pay(i)<w(j)-pay(j)
                       prices(pos) = w(i) - pay(i);
                   else
                       prices(pos) = w(j) - pay(j);
                   end
                   pay(i) = pay(i) + prices(pos);
                   pay(j) = pay(j) + prices(pos);
               end
           end
        end
    end

for i=1:length(w)
    if w(i) == pay(i)
        a = i;
        vertex_set_indices = [vertex_set_indices,a];
    end
end


end