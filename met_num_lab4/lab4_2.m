clear, clc
omega2=1;
[t1, x1]= ode45(@(t,x) oscylator2(t,x,omega2),[0 10], [0 1]);
[t2, x2]= ode45(@(t,x) oscylator2(t,x,omega2),[0 10], [0 2]);
[t3, x3]= ode45(@(t,x) oscylator2(t,x,omega2),[0 10], [0 3]);

figure;
plot(x1(:,1),x1(:,2)); hold on
plot(x2(:,1),x2(:,2),'r');
plot(x3(:,1),x3(:,2),'m'); hold off
xlabel('x(t)')
ylabel('v(t)')
