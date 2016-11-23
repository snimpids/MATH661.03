clear;clc

% Setting up the initial system.
A = [1 2 2 1; -1 2 1 0; 0 1 -2 2; 1 2 1 2];
b = [0;-2;4;0];
x0 = zeros(4,1);

% Performing the Gauss-Seidel method and analyzing the convergence.
[J,x,method] = Gauss_Seidel(A,x0,b);
convMethod(J,x,method);

% Performing the Jacobi method and analyzing the convergence.
[J,x,method] = Jacobi(A,x0,b);
convMethod(J,x,method);