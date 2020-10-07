clc,clear

m = 1250; k = 1250;

tstart = 0; tend = 16;
x0 = [0.2 0];

[t,x] = ode45(@(t,x) oscylator(t,x,k,m),[tstart,tend],x0);
%matlablog.ont.com.pl

figure;
plot(t,x(:,1),'k',t,x(:,2),'--k','LineWidth',2);
legend('x','v');

%funkcje anonimowe