% Deblurring algorithm
%
% Given A and xtilde, solve the linear optimization problem:
%
% min_{0 <= x <= 1} ||A*xtilde - x||_1 + lambda ||x||_1

function x = deblurr(A,xtilde,lambda);

n = size(A);
% Write your code HERE to compute x

c1 = ones(n,1); % pour les t
c2 = zeros(n,1); %pour les x
c3 = zeros(2*n,1);  %pour les variables d'ecarts
c = [c1;c2;c3];

A_t = [-1*eye(n);-1*eye(n)];
A_x = [-A;A];

%insertion du lambda
 for i= 1:n
     A_x(i,i) = A_x(i,i) + lambda;
     A_x(n + i,i) = -A_x(i,i) - lambda;
endfor
 A_s = eye(2*n);

 Aeq = [A_t,A_x,A_s];

 [l,col] = size(Aeq);

 beq = [-xtilde;xtilde];
 length(beq);

lb = zeros(col, 1);
ub = [];
ctype = repmat("S", 1, l);
vartype = repmat("C", 1, col);

[x, fval,status,extra] = glpk(c, Aeq, beq, lb, ub, ctype, vartype, 1);

extra.status

x = x(n+1:2*n)';

endfunction
