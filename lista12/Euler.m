clc; clear;
%Constants set for all Methods
Cm=0.01; % Membrane Capcitance uF/cm^2
dt=0.04; % Time Step ms
t=0:dt:25; %Time Array ms
I=0.1; %External Current Applied
Ena=55.17;
Ek=-72.14;
El=-10;
gbarNa=120;
gbarK=36;
gbarL=0.3;
V(1)=0; % Initial Membrane voltage
m(1)=alfaM(V(1))/(alfaM(V(1))+betaM(V(1))); % Initial m-value
n(1)=alfaN(V(1))/(alfaN(V(1))+betaN(V(1))); % Initial n-value
h(1)=alfaH(V(1))/(alfaH(V(1))+betaH(V(1))); % Initial h-value
for i=1:length(t)-1

 %Euler method to find the next m/n/h value
 m(i+1)=m(i)+dt*((alfaM(V(i))*(1-m(i)))-(betaM(V(i))*m(i)));
 n(i+1)=n(i)+dt*((alfaN(V(i))*(1-n(i)))-(betaN(V(i))*n(i)));
 h(i+1)=h(i)+dt*((alfaH(V(i))*(1-h(i)))-(betaH(V(i))*h(i)));
 gNa=gbarNa*m(i)^3*h(i);
 gK=gbarK*n(i)^4;
 gl=gbarL;

 INa=gNa*(V(i)-Ena);
 IK=gK*(V(i)-Ek);
 Il=gl*(V(i)-El);

 %Euler method to find the next voltage value
 V(i+1)=V(i)+(dt)*((1/Cm)*(I-(INa+IK+Il)));

end

figure;
plot(t,V);
figure;
plot(t,h);