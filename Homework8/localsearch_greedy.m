% greedy method
function [we_greedy, value_greedy, greedy_solution] = greedy(a, asort, scale, W)
we_greedy = 0;
value = 0;
itm = 1;
while true
    if itm>scale
        break;
    else
        we1 = we_greedy +asort(itm,3);
        if (we1>W)
        break;
        else
            we_greedy = we_greedy +asort(itm,3);
            value = value + asort(itm,2);
            itm = itm + 1;
        end
    end
    
end
choose_greedy = zeros(scale, 1);
for i=1:itm-1
    choose_greedy(asort(i,1)) = 1;
end
greedy_solution = choose_greedy'
we_greedy
value_greedy = value
end