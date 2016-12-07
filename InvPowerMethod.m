% Inverse Power Method
function [aInv,countInv] = InvPowerMethod(A,x0,epsilon)

countInv = 0;

y = A\x0;
aInv = 1/sqrt(y'*y);
xCurrent = y/aInv;
xPrevious = x0;

% Iterating subject to the tolerance 'epsilon'.
while norm(xCurrent-xPrevious,2) > epsilon
    xPrevious = xCurrent;
    y = A\xCurrent;
    aInv = 1/sqrt(y'*y); % New min eigenvalue estimate
    xCurrent = y/sqrt(y'*y); % New corresponding eigenvector
    
    % Keeping track of iterations.
    countInv = countInv + 1;
end;
