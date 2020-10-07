function [tOut,thetaOut,omegaOut] = tlumienie(tstart,tend,theta0,omega0,h,c)

t = tstart;
tOut(1) = tstart;
thetaOut(1) = theta0;
omegaOut(1) = omega0;

theta = theta0;
omega = omega0;

n = floor((tend-tstart)/h);

for i=1:n

    thetaOld=theta;
    theta = theta + omega*h;
    omega = omega - sin(thetaOld)*h-c*omega*h;
    
    thetaOut = [thetaOut;theta];
    omegaOut = [omegaOut;omega];
    
    t = t + h;
    tOut = [tOut;t];

end

end