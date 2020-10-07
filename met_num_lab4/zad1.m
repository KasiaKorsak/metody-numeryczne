%[t,x] = ode45(@fun,[0 20],[2; 0]);
%plot(t,x(:,1),'-o',t,x(:,2),'-o')
%title('Solution for (\mu = ) with ODE45');
%xlabel('Time t');
%ylabel('Solution x');
%legend('x_1','x_2');


ni=0.2;
[t1, x1]= ode45(@(t,x) fun(t,x,ni),[0 10], [0 1]);
ni=1;
[t2, x2]= ode45(@(t,x) fun(t,x,ni),[0 10], [0 1]);
ni=5;
[t3, x3]= ode45(@(t,x) fun(t,x,ni),[0 10], [0 1]);

figure;
plot(x1(:,1),x1(:,2)); hold on
plot(x2(:,1),x2(:,2),'r');
plot(x3(:,1),x3(:,2),'m'); hold off
xlabel('x(t)')
ylabel('v(t)')
legend('ni=0.2','ni=1','ni=5');