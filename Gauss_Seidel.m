%% Gauss-Seidel iterative method
function [J,x,method] = Gauss_Seidel(A,x0,b)

% Initializing parameters, matrices, and vectors.
method = 'Gauss-Seidel';

D = diag(diag(A));
E = -1*tril(A,-1);
F = -1*triu(A,1);

M = D - E;
N = F;

% Constructing the iteration matrix.
J = M\N;
% Performing 10 iterations.
x = x0;
for i=1:10
    x = J*x + J*b;
end;