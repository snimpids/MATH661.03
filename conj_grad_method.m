% Exercise 9.3 from "Numerical Linear Algebra".

A = (1/12)*[5,4,3,2,1;4,5,4,3,2;3,4,5,4,3;2,3,4,5,4;1,2,3,4,5];
b = [1;2;3;4;5];

epsilon = 10^-7;

x = [-2;0;0;0;10];
r = b - A*x;
p = r;
gamma = r'*r;

iterCount = 0;
maxIter = 10;

while gamma > epsilon^2 && iterCount < maxIter
    y = A*p;
    alpha = gamma/(p'*y);
    x = x + alpha*p;
    r = r - alpha*y;
    beta = r'*r/gamma;
    gamma = r'*r;
    p = r + beta*p;
    iterCount = iterCount + 1;
end;

