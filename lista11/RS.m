clc,clear all;

a=0.02;
b=0.2;
c=-65;
d=8;          
v0=c;
u0=b*v0;
h=0.01;
t0=0;
tk=1000;
Imax=6;

[ tout,uout,vout,I ] = EulerRichardson_Izhikevich( a,b,c,d,h,t0,tk,u0,v0,Imax );
min_pot=min(vout);
figure;plot(tout,vout);
figure;
plotyy(tout,vout,tout,uout);
title('RS');
legend('V','U')
hold on;
plot(tout,I,'y');
hold off;

[pks,loc,w,p] = findpeaks(vout);
t=length(loc);
fRS=t/(length(tout)/100);
maxRS=max(pks);
srRS=mean(pks);
stdRS=std(pks);
D=diff(loc);
T=(D(11)+D(12))/200;
F=1/T;
T2=mean(diff(loc)/100);
Fsr=1/(mean(diff(loc)/100));
[pks1,loc1]=findpeaks(-vout);


min_max=[];
for i=1:length(pks)
    dm=pks(i)+pks1(i);
    min_max=[min_max,dm];
end
mm=mean(min_max);