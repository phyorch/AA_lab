% delete infeasible solution
function [selected_solution] = prune(solutionlist, W)
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
    