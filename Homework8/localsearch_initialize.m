%initialization
function [a, asort] = initialize(scale, weight_para, ratio_para)
ord = 1:scale;
a = rand(scale,3);
a(:,2) = a(:,2) .* weight_para;
a(:,3) = a(:,3) .* ratio_para;
for i=1:scale
    a(i,1) = a(i,2)*a(i,3);
end
a = [ord',a];
asort = sortrows(a,-4);
end