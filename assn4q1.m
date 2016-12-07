% Confirming the Convergence Rate of the 
% Conjugate Gradient Method

clear;
% Defining the A matrix.
n = 100;
A = 2*eye(n,n) + diag(-ones(n-1,1),-1) +...
    diag(-ones(n-1,1),1);

% Intialization.
x_exact = ones(n,1);    % Exact solution
b = A*x_exact;          % The right hand side
x0 = rand(n,1);         % Initial guess

maxIter = 10;           % Maximum iterations

% Running the algorithm.
[x,ErrorVec] = CGMethod(A,b,x0,x_exact,maxIter);
(cond(A)-1)/(cond(A)+1)