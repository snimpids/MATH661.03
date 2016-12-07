%% Monte Carlo integration to compute exponential integrals.

% Setting the limits of integration.
startPoint = 0;
endPoint = 1;

% Defining the function to be integrated.
f = @(x)exp(-x^2);
n = 10^6;

A = MonteCarlo(f,startPoint,endPoint,n);
fprintf(['With n = %d, the value of the integral \n',...
    'with Monte Carlo integration is %d.\n'],n,A);

actual = (sqrt(pi)/2)*erf(1);
relError = (abs(actual - A))/abs(actual);

fprintf('The relative error is %d.\n\n',relError);

% for n = [100,200,400]
%     A = MonteCarlo(f,startPoint,endPoint,n);
%     fprintf(['With n = %d, the value of the integral \n',...
%         'with Monte Carlo integration is %d.\n'],n,A);
%     
%     actual = (sqrt(pi)/2)*erf(1);
%     relError = (abs(actual - A))/abs(actual);
%     
%     fprintf('The relative error is %d.\n\n',relError);
%     
% end;