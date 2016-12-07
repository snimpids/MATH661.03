function A = MonteCarlo(f,startPoint,endPoint,N)

F = 0;
for i = 1:N
    % Finding a random point within the interval.
    x = startPoint + endPoint*rand(1);
    %Evaluating the function f at the random point.
    F = F + f(x);
end;

% Taking the average of the evaluated function values
% over the domain.
A = ((endPoint - startPoint)/N)*F;