% Preconditioned conjugate gradient method

A = (1/12)*[5,4,3,2,1;4,5,4,3,2;3,4,5,4,3;2,3,4,5,4;1,2,3,4,5];
b = [1;2;3;4;5];

epsilon = 10^-4;

C = chol(A,'lower');

x = [-2;0;0;0;10];
r = b - A*x;
z = C'*r;
p = z;
gamma = z'*r;

iterCount = 0;
maxIter = 100;

while gamma > epsilon^2 && iterCount < maxIter
    y = A*p;
    g = z'*r;
    alpha = g/(p'*y);
    x = x + alpha*p;
    r = r - alpha*y;
    z = C'*r;
    beta = z'*r/gamma;
    gamma = r'*r;
    p = r + beta*p;
    iterCount = iterCount + 1;
end;

iterCount

pcg(A,b)