% Power Method
function [a,count] = PowerMethod(A,x0,epsilon)

count = 0;

% Performing the first iteration.
y = A*x0;
a = sqrt(y'*y);
xCurrent = y/a;
xPrevious = x0;

% Iterating subject to the tolerance 'epsilon'.
while norm(xCurrent-xPrevious,2) > epsilon
    xPrevious = xCurrent;
    y = A*xCurrent; 
    a = sqrt(y'*y); % New max eigenvalue estimate
    xCurrent = y/a; % New corresponding eigenvector
    
    % Keeping track of the iterations.
    count = count + 1;
end;
