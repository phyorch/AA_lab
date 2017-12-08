%% demo one
disp('demo one')
elems = 1 : 8;
sets = {{1, 1, 1}, {2, 1, 2}, {3, 1, [3 4]}, {4, 1, 5 : 8}, ...
    {5, 1.01, 1 : 2 : 7}, {6, 1.01, 2 : 2 : 8}};
[cover_set_indices, cover_set_costs] = greedy_set_cover(elems, sets);
disp(cover_set_indices)
disp(cover_set_costs)

%% demo two
disp('demo two')
elems = 1 : 16;
sets = {{1, 1, 1}, {2, 1, 2}, {3, 1, [3 4]}, {4, 1, 5 : 8}, ...
    {5, 1, 9 : 16}, {6, 1.01, 1 : 2 : 15}, {7, 1.01, 2 : 2 : 16}};
[cover_set_indices, cover_set_costs] = greedy_set_cover(elems, sets);
disp(cover_set_indices)
disp(cover_set_costs)

%% demo three (optional)
% create a large-scale instance to show the performance of the greedy_set_cover() method
disp('demo three')
elems = 1 : 100;
sets = {{1, 1, 1:32}, {2, 1, 6:16}, {3, 1, 5:25}, {4, 1, 70:90}, ...
    {5, 1, 9 : 32}, {6, 1.01, 1:3:66}, {7, 1.01, 2 : 2 : 64},{8, 1.45, 2:2:86},{9, 1.21, 16:47},{10, 1.28, 34:67},{11, 1.67, 28:89},{12, 1.43, 89:100}};
[cover_set_indices, cover_set_costs] = greedy_set_cover(elems, sets);
disp(cover_set_indices)
disp(cover_set_costs)
