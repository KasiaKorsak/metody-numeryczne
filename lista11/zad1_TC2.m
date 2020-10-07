a=0.02;
b=0.25;
c=-65;
d=0.05;
v0=c;
u0=b*v0;
h=0.01;
t0=0;
tk=1000;
Imax=-15;
[ tout,uout,vout,I ] = EulerRichardson_Izhikevich2( a,b,c,d,h,t0,tk,u0,v0,Imax );

figure;
plotyy(tout,vout,tout,uout);
title('TC(2)');
legend('V','U')
hold on;plot(tout,I,'y');hold off;

[pks,loc,w,p] = findpeaks(vout);
t=length(loc);
fTC=t/(length(tout)/100);
maxTC=max(pks);
s=sort(pks);
min=s(1);
srTC=0.5*(maxTC+min);
stdTC=std(pks);
t_TC=floor((s(end)-s(end-1))/fTC);
