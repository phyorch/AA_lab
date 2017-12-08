clear;
% scale = 15;
% W = 30;
% method = 4;
% ratio_para = 6;
% weight_para = 5;
scale = 50;
W = 100;
method = 2;
ratio_para = 1.2;
weight_para = 5;
[a, asort] = initialize(scale, weight_para, ratio_para);
[we_greedy, value_greedy, greedy_solution] = greedy(a, asort, scale, W);
greedy_solution = [we_greedy,value_greedy,greedy_solution];
[value_lin, we_lin, solution_lin] = lin_prog(a, asort, W);
%  [all_solution] = explore(a, greedy_solution, scale, method);
%  [feasible_solution] = prune(all_solution, W);
%  [value_lin, we_lin, solution_lin] = lin_prog(a, asort, W);
%  solution = [[we_lin,value_lin,solution_lin]', feasible_solution']';



%simulated anneal
T = 50;
we = 0;
value = 0;
list = 1:scale;
itm = 1;
list= list(randperm(length(list)));
choose = zeros(scale, 1);
while true
        we1 = we +a(list(itm),3);
        if we1>W
            break;
        else
            we = we +a(list(itm),3);
            value = value + a(list(itm),2);
            choose(list(itm)) = 1;
            itm = itm + 1;
        end
end   

solution = [we,value,choose'];
solutionpath = solution;
for k=1:20
    [all_solution] = explore(a, solution, scale, method);
    [feasible_solution] = prune(all_solution, W);
    [value_lin, we_lin, solution_lin] = lin_prog(a, asort, W);
    solution_sort = [[we_lin,value_lin,solution_lin]', feasible_solution']';
    solution_sort(1:2,:) = [];
    solution_sort = sortrows(solution_sort, -2);
    quasi_offspring = solution_sort(1,:);
    T = T/(k+1);
    %T = T*0.99;
    if quasi_offspring(2)>solution(2)
        solution = quasi_offspring;
    else
        P = exp((quasi_offspring(2) - solution(2))/T);
        p = rand(1);
        if P<=p
            solution = quasi_offspring;
        end
    end
    solutionpath = [solutionpath',solution']';
    iteration = 'haha'
end
err1 = value_lin - value_greedy;
err2 = value_lin - solutionpath(size(solutionpath,1),2);
err = err2/err1

