clc,clear all;

a=0.02;
b=0.25;
c=-65;
d=0.05; 
v0=c;
u0=b*v0;
h=0.01;
t0=0;
tk=1000;
Imax=6;


[ tout,uout,vout,I ] = EulerRichardson_Izhikevich( a,b,c,d,h,t0,tk,u0,v0,Imax );

figure;
plotyy(tout,vout,tout,uout);
title('TC');
legend('V','U')
min_pot=min(vout);
[pks,loc,w,p] = findpeaks(vout);
t=length(loc);
f=t/(length(tout)/100);
max=max(pks);
sr=mean(pks);
std=std(pks);
D=mean(diff(loc)/100);
F=1/D;

[pks1,loc1]=findpeaks(-vout);

min_max=[];
for i=1:length(pks)
    dm=pks(i)+pks1(i);
    min_max=[min_max,dm];
end
mm=mean(min_max);