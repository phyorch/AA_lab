% a: ord value weight ratio
% greedy method to gain a initial solution

%initialization
function [a, asort] = initialize(scale)
ord = 1:scale;
a = rand(scale,2);
b = rand(scale,1);
a(:,1) = a(:,1) * 10;
a(:,2) = a(:,2) * 3;
for i=1:scale
    b(i) = a(i,1)/a(i,2);
end
a = [a,b];
a = [ord',a];
asort = sortrows(a,-4);
end


% greedy method
function [we_greedy, value_greedy, greedy_solution] = greedy(a, asort, scale, W)
we_greedy = 0;
value = 0;
itm = 1;
while true
    if itm>15
        break;
    else
        we1 = we_greedy +asort(itm,3);
        if (we1>W)
        break;
        else
            we_greedy = we_greedy +asort(itm,3);
            value = value + asort(itm,1);
            itm = itm + 1;
        end
    end
    
end
choose_greedy = zeros(scale, 1);
for i=1:itm
    choose_greedy(asort(i,1)) = 1;
end
greedy_solution = choose_greedy'
we_greedy
value_greedy = value
end


% local search 1
% ini = choose_greedy
function [all_solution] = local_search1(ini, we_greedy, value_greedy)
solutionlist = [we_greedy,value_greedy,ini];
for unit=1:scale
    sol = ini;
    if sol(unit)==0
        sol(unit)=1;
    else sol(unit)=0;
    end
    sol_value = 0;
    sol_weight = 0;
    for unit2=1:scale
        if sol(unit2)==1
            sol_value = sol_value + a(unit2,2);
            sol_weight = sol_weight + a(unit2,3);
        end
    end
    sol = [sol_weight,sol_value,sol];
    solutionlist = [solutionlist',sol']';
end
all_solution = solutionlist
end


% local search 2
% ini = choose_greedy
function [all_solution] = local_search1(ini, we_greedy, value_greedy, choose_greedy)
solutionlist = [we_greedy,value_greedy,choose_greedy];
for unit=1:scale-1
    for uni=unit+1:scale
        sol = ini;
        temp = sol(uni);
        sol(uni) = sol(unit);
        sol(unit) = temp;
        sol_value = 0;
        sol_weight = 0;
        for unit2=1:scale
           if sol(unit2)==1
             sol_value = sol_value + a(unit2,2);
             sol_weight = sol_weight + a(unit2,3);
           end
        end
        sol = [sol_weight,sol_value,sol];
        solutionlist = [solutionlist',sol']';
    end
end   
all_solution = solutionlist
end


% delete infeasible solution
function [selected_solution] = prune(solutionlist)
del = 0;
unit3 = 1;
for unit3=1:size(solutionlist,1)
    if solutionlist(unit3,1)>W
        del = del +1;
    end
end
while true
    if del==0
        break;
    else 
       if solutionlist(unit3,1)>W
           solutionlist(unit3,:) = [];
           del = del-1;
       end
    unit3 = unit3 + 1;
    if unit3>size(solutionlist,1)
        unit3 = 1;
    end
    end
end
selected_solution = solutionlist
end
    
