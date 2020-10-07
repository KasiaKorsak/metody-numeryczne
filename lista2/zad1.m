%x0=1;
%dt=1;
%syms x;
%f(x)=-x;
%x(1)=x0+f(x0)*dt;
%x_daszek=x(1)

%dt=10^-1;



x_zkropka=-x;
dx(t)/dt=f(x(t),t);
x(t0)=x0;
