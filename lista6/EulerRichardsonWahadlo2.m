function [tOut,thetaOut,omegaOut] = EulerRichardsonWahadlo2(tstart,tend,theta0,omega0,h,c,A,f)

t = tstart;
tOut(1) = tstart;
thetaOut(1) = theta0;
omegaOut(1) = omega0;

theta = theta0;
omega = omega0;

tMid=0;
thetaMid=0;

n = floor((tend-tstart)/h);

for i=1:n 
    
    thetaOld=theta;
    
    tMid =t + h/2;
    thetaMid=theta + h/2*omega;
    omegaMid=omega -  sin(thetaOld)*h/2-c*omega*h/2+A*sin(t*f)*h/2;
    
    theta = theta + h*omegaMid;
    omega = omega - sin(thetaMid)*h-c*omegaMid*h+A*sin(tMid*f)*h;
    
    thetaOut = [thetaOut;theta]; 
    omegaOut = [omegaOut;omega];
    
    t = t + h;
    tOut = [tOut;t];
    
end

end