%% SSOR Preconditioner

clear;
% Initialization
n = 100;
endIter = 79;
w = 0.025;

% Defining the system to be solved.
A = 2*eye(n,n) + diag(-ones(n-1,1),-1) + ...
        diag(-ones(n-1,1),1);
    
% Defining the splitting.
D = diag(diag(A));
E = -tril(A,-1);

f = [];
waxis = w:w:w*endIter;

% Finding the condition number for each w.
for w = waxis
    Cw = (w/(2-w))*(D/w - E)\D\(D/w - E');
    f = [f,cond(Cw\A)];
end;

% Plotting the result.
plot(waxis,f)
xlabel('$\omega$','Interpreter','Latex','FontSize',12);
ylabel('cond($C^{-1}_\omega A$)','Interpreter','Latex',...
    'FontSize',12);
title(['Plot of cond($C^{-1}_\omega A$)'...
    ' as a function of $\omega$'],'Interpreter','Latex',...
    'FontSize',14);