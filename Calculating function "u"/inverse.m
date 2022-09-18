clc; clear;
close all;

T = 2;
dt =0.5;
a = 1;
l = 3;
dI = 0.5;
t = 0:dt:T;
x = 0:dI:l;
tau=[1,T];
alpha=[1,2];
N0 = ceil(l/(a*(T-tau(length(tau)-1))))-1;
U = zeros(length(t),length(x));
G = zeros(length(x));
PHI=zeros(length(t));
H=zeros(length(x));
AH=zeros(length(x));
B=zeros(length(x));
F=zeros(length(x));
beta=alpha(length(alpha));
set(0,'DefaultTextInterpreter','latex');


%-----U(x,t) FUNCTION

for i = 1:length(x)
  for j = 1:length(t)
    U(j,i) = find_u(x(i), t(j), a, T, N0, beta, tau, alpha,l);
  end
end
[X,T] = meshgrid(x,t);
surf(X,T,U);

xlabel('x', 'Color', [0.8 0.07 0.18], 'FontSize', 15, 'FontWeight', 'bold')
ylabel('t', 'Color', [0.8 0.07 0.18], 'FontSize', 15, 'FontWeight', 'bold')
zlh = zlabel('u', 'Color', [0.8 0.07 0.18], 'FontSize', 15, 'FontWeight', 'bold');
set(zlh,'rotation',0);
set(gcf, 'numbertitle', 'off')
set(gcf, 'name', 'INVERSE PROBLEM')
set(gca, 'fontsize', 11)