theta0 = 5*pi/180;
tstart = 0;
tend = 100;
omega0 = 0;
h = 0.0001;
c = 1;

[tOut,thetaOut,omegaOut] = tlumienie(tstart,tend,theta0,omega0,h,c);

figure;
plot(tOut,thetaOut); % wykres polozenia wzgledem czasu
title('Polozenie wzgledem czasu (c=1)');
xlabel('czas');
ylabel('wychylenie');