%% Convergence of iterative methods
function convMethod(J,x,method)

spectralRad = max(abs(eig(J)));

% Formatting the solution vector x for display.
fprintf(['The solution of the ' method ' method is: \n'...
    'x = [%g; %g; %g; %g] \n\n'],x);

if spectralRad >= 1
    fprintf(['The ',method,...
        ' method is not convergent since the spectral radius of J is: \n'...
        '%s >= 1.\n\n'],spectralRad)
else
    fprintf(['The ',method,...
        ' method is convergent since the spectral radius of J is: \n'...
        '%s < 1.\n\n'],spectralRad)
end;