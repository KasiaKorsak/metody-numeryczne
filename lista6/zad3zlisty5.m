x1=2;
x2=0.5;
x3=1;
alfa=1;
dx=@(t,x)[x(1)*(0.5*(1-x(1))+0.5*(1-x(2))+0.1*(1-x(3)));
    x(2)*(-0.5*(1-x(1))-0.1*(1-x(2))+0.1*(1-x(3)));
    x(3)*(alfa*(1-x(1))+0.1*(1-x(2))+0.1*(1-x(3)))];
[t,x]=ode45(dx,[0,100],[x1 x2 x3]);
figure
comet3(x(:,1),x(:,2),x(:,3));