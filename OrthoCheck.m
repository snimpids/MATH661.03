% This function checks if the initial guess
% x0 is orthogonal to any of the eigenvectors
% of the matrix A.
function Y = OrthoCheck(A,x0)
epsilon = 10^-5;

[V,D] = eig(A);
[I,J] = size(V);

Y = zeros(1,J);
for j = 1:J 
    C = x0'*V(:,j);
    if C < epsilon
        Y(j) = 1;
    else
        Y(j) = 0;
    end;
end;