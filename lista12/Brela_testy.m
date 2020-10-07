%zad3
clear all;
clc;
close all;

t0=0;
tk=100;
dt=0.01;
Imax=10;

[tOut,uOut,mOut,nOut,hOut,ILout,IKout,INAout] = hodgkinHuxley(t0,tk,dt,Imax);


figure;
plot(tOut,INAout); hold on;
plot(tOut,IKout);
plot(tOut,ILout); hold off;
ylabel('I [uA/cm^2]');
xlabel('Czas [s]');
legend('INa','IK','IL');
xlim([0 65]);

figure;
plot(tOut,mOut); hold on;
plot(tOut,nOut);
plot(tOut,hOut); hold off;
legend('m','n','h');
ylabel('Parametry bramkowania');
xlabel('Czas [s]');
xlim([0 65]);

figure;
plot(tOut,uOut); 
ylabel('U [mV]');
xlabel('Czas [s]');
xlim([0 65]);

% wyznaczamy okres
[~,loc]=findpeaks(uOut);
T=diff(loc)*0.01;
T=mean(T);
F=1/T; % czêstotliwoœæ generowania iglic
max=max(uOut); %maksymalny potencja³ iglicy
mean=mean(uOut); %sredni potencja³ iglicy
std=std(uOut); %odchylenie standardowe



