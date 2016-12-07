%% Conjugate Gradient Algorithm
function [x,ErrorVec] = CGMethod(A,b,x,x_exact,maxIter)

r = b - A*x;
p = r;
gamma = r'*r;

% Storing the ratio of the updated solution error to the
% previous solution error.
ErrorVec = zeros(1,maxIter);

% Note that an error tolerance is not specified,
% since we are examining a specific ratio.
for i = 1:maxIter
    % Calculation step.
    y = A*p;
    alpha = gamma/(p'*y);
    error = norm(x-x_exact,2);
    
    x = x + alpha*p;
    errorUpdate = norm(x-x_exact,2);
    ErrorVec(i) = abs(errorUpdate/error);
      
    % Update step.
    r = r - alpha*y;
    beta = r'*r/gamma;
    gamma = r'*r;
    p = r + beta*p;
end;