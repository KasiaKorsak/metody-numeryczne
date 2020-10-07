clc;
clear all;
t0=0;
tk=100;
hi=0.01;
C=1;
Ena=115;
Ek=-12;
El=10.6;
gNa=120;
gK=36;
gL=0.3;
u0=0;
natezenia=[];
czestotliwosci=[];
for i=10:3:50
    Imax=i;
[tout,mout,nout,hout,uout,Inaout,Ikout,Ilout] = hodgkin_huxley( t0,tk,hi,Imax,C,Ena,Ek,El,gNa,gK,gL,u0 );
[pks,loc]=findpeaks(uout);
T=diff(loc)*hi;
T=mean(T);
F=1/T;
natezenia=[natezenia,Imax];
czestotliwosci=[czestotliwosci,F];
end
figure;plot(natezenia,czestotliwosci,'rs');
xlabel('Natê¿enia [uA/cm^2]');
ylabel('Czêstotliwoœci [mHz]');
title('Zaleznosc czestotwliowsci od natezenia');
