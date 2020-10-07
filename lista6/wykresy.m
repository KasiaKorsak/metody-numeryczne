theta0 = 5*pi/180;
tstart = 0;
tend = 10;
omega0 = 0;
h = 0.1;
c = 0.5;
A=0.5;
f=2/3;

[tOut,thetaOut,omegaOut] = EulerRichardsonWahadlo2(tstart,tend,theta0,omega0,h,c,A,f);

figure;
subplot(3,1,1);
plot(tOut,thetaOut); % wykres polozenia wzgledem czasu
title('Polozenie wzgledem czasu (A=0.5)');

subplot(3,1,2);
plot(tOut,omegaOut);
title('Predkosc wzgledem czasu');

subplot(3,1,3);
plot(thetaOut,omegaOut);
title('Przestrzen fazowa');