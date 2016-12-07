%% Computing Eigenvalues Using the QR Method
clear;

eps = 0.01; % Error tolerance
N = 200; % Maximum number of iterations

for n = [10,20,40,80,100,200]
    A = rand(n,n);
    A = A'*A;
    m = n;
    v = zeros(m,1); % Initializing the empty eigenvector
    a = hess(A);
    B = A;
    count = 0;
    
    % Finding the eigenvalues.
    while max(abs(diag(a)-diag(B))) >= eps
        count = count + 1;
        for k = 1:N
            while m > 1
                if abs(a(m,m-1)) < eps
                    v(m) = a(m,m);
                    a(:,m) = [];
                    a(m,:) = [];
                    m = m - 1;
                end;
                [Q,R] = qr(a);
                a = R*Q;
            end;
        end;
        v(1) = a(1,1);
    end;
    % Rearrange the eigenvalues for comparison.
    V = v(end:-1:1);
    
    fprintf(['For n = %d, the 2-norm difference '...
        'between the\n QR-computed eigenvalues and '...
        'the MATLAB-computed\n eigenvalues is %d\n'...
        'with %d iterations.\n\n'],n,norm(V-eig(A)),count);
end;
