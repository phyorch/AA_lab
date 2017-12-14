% a: ord value weight ratio
% greedy method to gain a initial solution


% local search 1
% ini = choose_greedy
function [all_solution] = explore(a, solution, scale, method)
ini = solution(1,3:size(solution,2));
solutionlist = solution;
%solutionlist = [we_greedy,value_greedy,ini];
if method == 1
    for unit=1:scale
        sol = ini;
        if sol(unit)==0
           sol(unit)=1;
        else
           sol(unit)=0;
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
    %all_solution = solutionlist;
end

if method ==2
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
    %all_solution = solutionlist;

end

if method ==3
    for unit=1:scale-2
        sol = ini;
        for i=unit:unit+2
             if sol(i)==0
                 sol(i)=1;
             else
                 sol(i)=0;
             end
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
end


if method ==4
    scale2 = floor(scale/2);
   for unit=1:scale2-1
       for unit2=unit:scale2-1
           sol = ini;
           temp1 = sol(unit*2-1);
           sol(unit*2-1) = sol(2*unit2+1);
           sol(2*unit2+1) = temp1;
           temp2 = sol(unit*2);
           sol(unit*2) = sol(2*unit2+2);
           sol(2*unit2) = temp2;
           sol_value = 0;
           sol_weight = 0;
           for unit3=1:scale
               if sol(unit3)==1
                    sol_value = sol_value + a(unit3,2);
                    sol_weight = sol_weight + a(unit3,3);
               end
            end
        sol = [sol_weight,sol_value,sol];
        solutionlist = [solutionlist',sol']';
       end
    
   end
end

all_solution = solutionlist
end
