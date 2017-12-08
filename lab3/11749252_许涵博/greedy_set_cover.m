function [cover_set_indices, cover_set_costs] = greedy_set_cover(elems, sets)
% *********************************************************************** %
% Greedy Algorithm for the Set Cover Problem.
% -------
% INPUT :
% -------
%   elems : matrix(1, ?), Integer :: each number denotes an element
%       e.g., 1 : 8
%   sets : cell(cell(1, 3)) :: all sets
%       {set_id : Integer, set_weight : Double, set_elements : Matrix(1, ?)}
%       e.g., {{1, 1, 1}, {2, 1, 2}, {3, 1, [3 4]}, {4, 1, 5 : 8}, ...
%              {5, 1.01, 1 : 2 : 7}, {6, 1.01, 2 : 2 : 8}};

    

% -------
% OUTPUT:
% -------
%   cover_set_indices : matrix(1, ?), Integer :: cover set indices generated sequentially
%       e.g., [4 3 1 2]
%   cover_set_costs : matrix(1, ?), Double :: cover set costs generated sequentially
%       e.g., [1/4 1/2 1 1]
% *********************************************************************** %

choosed_set = {};
choosing_sets = sets;
R = elems;
while R
    min = 10000;
    for i=1:length(choosing_sets)
        weight = choosing_sets{i}{2};
        cur_set = choosing_sets{i}{3};
        SR = intersect(R,cur_set);
        cost = weight/length(SR);
        if(cost<min)
            min = cost;
            pos = i;
            S_R = SR;
        end
    end
    choosed_set{length(choosed_set)+1} = choosing_sets{pos};
    choosing_sets(pos) = [];
    R = setdiff(R,S_R);
end
cover_set_indices = [];
cover_set_costs = 0;
for i=1:length(choosed_set)
    cover_set_indices = [cover_set_indices,choosed_set{i}{1}];
    cover_set_costs = cover_set_costs + choosed_set{i}{2};
end

end
