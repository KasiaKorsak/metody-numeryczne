function [tOut,thetaOut,omegaOut] = EulerWahadlo(tstart,tend,theta0,omega0,h)

t = tstart;
tOut(1) = tstart;
thetaOut(1) = theta0;
omegaOut(1) = omega0;

theta = theta0;
omega = omega0;

n = floor((tend-tstart)/h);

for i=1:n
   
    % dtheta/dt to skonczone przyrosty; dtheta/dt = omega => 
    % dtheta = omega*dt, a 'dt' w naszym przypadku to h
    thetaOld=theta;
    theta = theta + omega*h;
    omega = omega - sin(thetaOld)*h;
    
    thetaOut = [thetaOut;theta]; % dodajemy nastepna thete do wektora
    omegaOut = [omegaOut;omega];
    
    t = t + h;
    tOut = [tOut;t];
    
    % zeby zoptymalizowac przed petla tworzymy wektor zeros(1,n), bo
    % linijki 20,21,24 sa nieefektywne
    
end

end