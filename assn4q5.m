% Combining the Power Method with the Rayleigh Quotient.

clear;
n = 100;
x0 = ones(n,1)/sqrt((ones(n,1)'*ones(n,1)));
A = 2*eye(n,n) + diag(-ones(n-1,1),-1) + ...
        diag(-ones(n-1,1),1);

% Defining the tolerance.
epsilon = 10^-3;

[lambda,count] = PowerMethodRayleigh(A,x0,epsilon);

fprintf(['The largest eigenvalue of A found with the '...
    'Rayleigh quotient\n and the power method is '...
    '%d. \nThe actual largest eigenvalue of A is %d.\n'...
    'The Rayleigh quotient method used %d iterations.\n\n'],...
    lambda,max(eig(A)),count);