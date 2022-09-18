
clc; clear;
close all;

T = 2;
a = 1;
l = 3;
alpha=[1,2];
tau=[1,T];
N0 = ceil(l/(T-tau(length(tau)-1)))-1;
beta=alpha(length(alpha));
set(0,'DefaultTextInterpreter','latex');
syms s sigma(x) gamma(t) u0(x) u1(x) phi(t) h(x) f(x) B(x) BB(x) BBB(x) BBBB(x) BBBBB(x) BBBBBB(x) BBBBBBB(x) g(x)
sigma(x)=-1;
gamma(t)=1;
u0(x)=exp(x);
u1(x)=x+1;

h(x)=piecewise((x<0)|(x>l),0, (x>=0)&(x<=a*T), u1(x)-gamma(T-x/a)*exp(-(1/a)*int(sigma(s),s,0,x)),(x>=a*T)&(x<=l),u1(x)-u0(x-a*T)*exp(-(1/a)*int(sigma(s),s,x-a*T,x)));

f(x)=a*diff(h(x))+sigma(x)*h(x);                                        

B(x)=alpha(1)*f(x-a*T)*exp(-(1/a)*int(sigma(s),s,x-a*T,x));
for k = 2:length(alpha)
    B(x)=B(x)+(alpha(k)-alpha(k-1))*f(x-a*(T-tau(k-1)))*exp(-(1/a)*int(sigma(s),s,x-a*(T-tau(k-1)),x));
end

BB(x)=alpha(1)*B(x-a*T)*exp(-(1/a)*int(sigma(s),s,x-a*T,x));
for k = 2:length(alpha)
    BB(x)=BB(x)+(alpha(k)-alpha(k-1))*B(x-a*(T-tau(k-1)))*exp(-(1/a)*int(sigma(s),s,x-a*(T-tau(k-1)),x));
end

BBB(x)=alpha(1)*BB(x-a*T)*exp(-(1/a)*int(sigma(s),s,x-a*T,x));
for k = 2:length(alpha)
    BBB(x)=BBB(x)+(alpha(k)-alpha(k-1))*BB(x-a*(T-tau(k-1)))*exp(-(1/a)*int(sigma(s),s,x-a*(T-tau(k-1)),x));
end

BBBB(x)=alpha(1)*BBB(x-a*T)*exp(-(1/a)*int(sigma(s),s,x-a*T,x));
for k = 2:length(alpha)
    BBBB(x)=BBBB(x)+(alpha(k)-alpha(k-1))*BBB(x-a*(T-tau(k-1)))*exp(-(1/a)*int(sigma(s),s,x-a*(T-tau(k-1)),x));
end

BBBBB(x)=alpha(1)*BBBB(x-a*T)*exp(-(1/a)*int(sigma(s),s,x-a*T,x));
for k = 2:length(alpha)
    BBBBB(x)=BBBBB(x)+(alpha(k)-alpha(k-1))*BBBB(x-a*(T-tau(k-1)))*exp(-(1/a)*int(sigma(s),s,x-a*(T-tau(k-1)),x));
end

BBBBBB(x)=alpha(1)*BBBBB(x-a*T)*exp(-(1/a)*int(sigma(s),s,x-a*T,x));
for k = 2:length(alpha)
    BBBBBB(x)=BBBBBB(x)+(alpha(k)-alpha(k-1))*BBBBB(x-a*(T-tau(k-1)))*exp(-(1/a)*int(sigma(s),s,x-a*(T-tau(k-1)),x));
end

BBBBBBB(x)=alpha(1)*BBBBBB(x-a*T)*exp(-(1/a)*int(sigma(s),s,x-a*T,x));
for k = 2:length(alpha)
    BBBBBBB(x)=BBBBBBB(x)+(alpha(k)-alpha(k-1))*BBBBBB(x-a*(T-tau(k-1)))*exp(-(1/a)*int(sigma(s),s,x-a*(T-tau(k-1)),x));
end

if N0==0
    g(x)=(1/beta)*f(x);
end
if N0==1
    g(x)=(1/beta)*f(x)+(1/beta)^2 * B(x);
end
if N0==2
    g(x)=(1/beta)*f(x)+(1/beta)^2 * B(x)+(1/beta)^3 * BB(x);
end
if N0==3
    g(x)=(1/beta)*f(x)+(1/beta)^2 * B(x)+(1/beta)^3 * BB(x)+(1/beta)^4 * BBB(x);
end
if N0==4
    g(x)=(1/beta)*f(x)+(1/beta)^2 * B(x)+(1/beta)^3 * BB(x)+(1/beta)^4 * BBB(x)+(1/beta)^5 * BBBB(x);
end
if N0==5
    g(x)=(1/beta)*f(x)+(1/beta)^2 * B(x)+(1/beta)^3 * BB(x)+(1/beta)^4 * BBB(x)+(1/beta)^5 * BBBB(x)+(1/beta)^6 * BBBBB(x);
end
if N0==6
    g(x)=(1/beta)*f(x)+(1/beta)^2 * B(x)+(1/beta)^3 * BB(x)+(1/beta)^4 * BBB(x)+(1/beta)^5 * BBBB(x)+(1/beta)^6 * BBBBB(x)+(1/beta)^7 * BBBBBB(x);
end
if N0==7
    g(x)=(1/beta)*f(x)+(1/beta)^2 * B(x)+(1/beta)^3 * BB(x)+(1/beta)^4 * BBB(x)+(1/beta)^5 * BBBB(x)+(1/beta)^6 * BBBBB(x)+(1/beta)^7 * BBBBBB(x)+(1/beta)^8 * BBBBBBB(x);
end

fplot(g(x))
hold on
p=fplot(0,'--');
p.Color='black';
set(gca, 'xlim', [0 l]);
ylim("padded");
xlabel('x', 'Color', [0.8 0.07 0.18], 'FontSize', 15, 'FontWeight', 'bold')
ylh = ylabel('g', 'Color', [0.8 0.07 0.18], 'FontSize', 15, 'FontWeight', 'bold');
set(ylh,'rotation',0);
set(gcf, 'numbertitle', 'off')
set(gca, 'fontsize', 11)



    



