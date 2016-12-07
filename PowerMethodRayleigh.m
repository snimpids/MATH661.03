%% Power Method with Rayleigh Quotient
function [lambdaCurrent,count] = PowerMethodRayleigh(A,x0,epsilon)

count = 0;

% Performing the first iteration.
y = A*x0;
a = sqrt(y'*y);
xCurrent = y/a; % Current eigenvector estimate
lambdaPrevious = A(1,1);
lambdaCurrent = a;

% Iterating subject to the tolerance 'epsilon'.
while abs(lambdaCurrent - lambdaPrevious) > epsilon
    y = A*xCurrent; 
    a = sqrt(y'*y);
    lambdaPrevious = a;
    xCurrent = y/a;
    
    % Finding the Rayleigh quotient.
    lambdaCurrent = xCurrent'*A*xCurrent/(xCurrent'*xCurrent);
    
    % Keeping track of the iterations.
    count = count + 1;
end;
