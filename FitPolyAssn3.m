function FitPolyAssn3(n,endPoint,degree)
% This function takes the input parameters 'n'=number of grid points, 
% 'endPoint'=end of domain, and 'degree'=degree of polynomial model, 
% and fits a polynomial of degree 'degree' to the data specified by (x,f(x)).

% Setting up the n+1 equally spaced grid points.
x = linspace(0,endPoint,n+1)';

% Creating the data set {xi,f(xi)}.
f = exp(-x) + x + sin(x);

figure;
p = polyfit(x,f,degree);
polynomial = 0;
% Creating the fitted polynomial based on its degree.
for i = 1:degree + 1
    polynomial = polynomial + power(x,i-1)*p((degree+2) - i);
end;

% Calculating the error.
error = norm(polynomial - f,2);
relError = error/norm(f,2);

% Plotting the result.
plot(x,f,'-or',x,polynomial,'-+b')
title(['Plot of degree ' num2str(degree) ' polynomial fitted to the data' char(10) ...
    'Relative error =' num2str(relError) char(10) num2str(n) ' grid points']);