theta0 = 5*pi/180;
tstart = 0;
tend = 100;
omega0 = 0;
h = 0.0001;
c = 0.5;
A=0.5;
f=2/3;

[tOut,thetaOut,omegaOut] = EulerRichardsonWahadlo2(tstart,tend,theta0,omega0,h,c,A,f);

figure;
subplot(2,1,1);
plot(tOut,thetaOut); % wykres polozenia wzgledem czasu
title('Polozenie wzgledem czasu (A=0.5)');

A=1.2;
[tOut,thetaOut,omegaOut] = EulerRichardsonWahadlo2(tstart,tend,theta0,omega0,h,c,A,f);
subplot(2,1,2);
plot(tOut,thetaOut);
title('Polozenie wzgledem czasu (A=1.2)');

