%% Implementing the Power Method to Find Max and Min Eigenvalues

% Defining the tolerance.
epsilon = 10^-3;

% Performing the power method for different sized matrices.
for n = [100,200]
    % Choosing a normalized initial guess.
    x0 = rand(n,1)/sqrt((rand(n,1)'*rand(n,1)));
    A = 2*eye(n,n) + diag(-ones(n-1,1),-1) + ...
        diag(-ones(n-1,1),1);
    
    % Checking if the initial guess is orthogonal
    % to any of the eigenvectors of A.
    Y = OrthoCheck(A,x0);
    if any(Y == 1)
        disp('pewp')
        x0 = 2*ones(n,1)/sqrt((ones(n,1)'*ones(n,1)));
    end;
    
    [a,count] = PowerMethod(A,x0,epsilon);
    [aInv,countInv] = InvPowerMethod(A,x0,epsilon);
    
    fprintf(['For n = %d, the power method required %d ',...
        'iterations \n with an error of %d. \n',...
        'The computed max eigenvalue of A is %d, and \n',...
        ' the actual max eigenvalue of A is %d.\n\n'],...
        n,count,abs(a-max(eig(A))),a,max(eig(A)));
    
    fprintf(['For n = %d, the inverse power method required ',...
        '%d iterations \n with an error of %d. \n',...
        'The computed min eigenvalue of A is %d, and \n',...
        ' the actual min eigenvalue of A is %d.\n\n'],...
        n,countInv,abs(aInv-min(eig(A))),aInv,min(eig(A)));
end;