clear;clc

% Initializing parameters.
a = 0;
n = 10;
Rand = rand(n,n);

% Defining the A matrix.
A = triu(Rand,1) + tril(Rand,-1);
A = A + diag(sum(abs(Rand')));

% Defining the b vector.
b = sum(A')';

% Performing the QR factorization of the A matrix, then using it to solve
% for the x vector.
[Q,R] = qr(A);
xa = R\(Q\b);

% The actual solution.
x = ones(n,1);

% Comparing the result with the actual solution, inv(A)*b, which turns out 
% to be an nx1 vector of ones. 
norm(xa - x,2)