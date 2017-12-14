function [value_lin, we_lin, solution_lin] = lin_prog(a, asort, W)
f = -a(:,2);  % opt objective
A = a(:,3);
b = W;
A1 = eye(size(a,1));
A2 = -A1;
b1 = ones(size(a,1),1);
b2 = zeros(size(a,1),1);
A = [A ,A1']';
A = [A',A2']';
b = [b',b1']';
b = [b',b2']';
intcon = 1:size(a,1)
[ x,fval ] = intlinprog(f,intcon, A,b);
we_lin = a(:,3)' * x;
value_lin = a(:,2)' * x;
solution_lin = x';
end
