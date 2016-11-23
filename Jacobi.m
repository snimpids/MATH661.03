%% Jacobi iterative method
function [J,x,method] = Jacobi(A,x0,b)

% Initializing parameters, matrices, and vectors.
method = 'Jacobi';
M = diag(diag(A));
N = M - A;

% Constructing the iteration matrix.
J = M\N;

% Performing 10 iterations.
x = x0;
for i=1:10
    x = J*x + J*b;
end;