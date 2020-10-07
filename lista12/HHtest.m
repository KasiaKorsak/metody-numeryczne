clc;
clear all;
t0=0;
tk=100;
hi=0.01;
Imax=10;
C=1;
Ena=115;
Ek=-12;
El=10.6;
gNa=120;
gK=36;
gL=0.3;
u0=0;

[tout,mout,nout,hout,uout,Inaout,Ikout,Ilout] = hodgkin_huxley( t0,tk,hi,Imax,C,Ena,Ek,El,gNa,gK,gL,u0 );

%figure;plot(tout,mout);
%xlabel('czas [ms]');
%ylabel('U [mV]');
%title('Parametr m w zaleznosci od czasu');
figure;
plot(tout,mout);
title('Parametry m,n,h w zaleznosci od czasu');
hold on;
plot(tout,nout);
plot(tout,hout);
hold off;xlim([0 100]);
ylabel('U [mV]');
xlabel('czas [ms]');
legend('m','n','h');

figure;
plot(tout,Inaout);
hold on;
plot(tout,Ikout);
plot(tout,Ilout);
hold off;xlim([0 100]);
title('Natezenia w zaleznosci od czasu');
xlabel('czas [ms]');
ylabel('I [uA/cm^2]');
legend('I_N_a','I_K','I_L');
%%
u0=-50;
N=length(u0:0.1:150);
m=[];
n=[];
h=[];
U=[];
for i=u0:0.1:150
   minf=alfaM(i)/(alfaM(i)+betaM(i));
   ninf=alfaN(i)/(alfaN(i)+betaN(i));
   hinf=alfaH(i)/(alfaH(i)+betaH(i));
   
   m=[minf,m];
   n=[ninf,n];
   h=[hinf,h];
   U=[i,U];
    
end

figure;
plot(U,m);hold on;
plot(U,n);
plot(U,h);
hold off;
title('Paramtery bramkowania (inf) w zaleznosci od napiecia');
ylabel('U [mV]');
xlabel('czas [ms]');
legend('m','n','h');

%%
[pks,loc]=findpeaks(uout);
T=diff(loc)*hi;
T=mean(T);
F=1/T; 
max=max(uout);
mean=mean(uout); 
std=std(uout); 