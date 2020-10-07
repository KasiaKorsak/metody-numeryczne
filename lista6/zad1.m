theta0 = 130*pi/180;
tstart = 0;
tend = 100;
omega0 = 0;
h = 0.0001;

[tOut,thetaOut,omegaOut] = EulerWahadlo(tstart,tend,theta0,omega0,h);

figure;
plot(tOut,thetaOut); % wykres polozenia wzgledem czasu
xlabel('czas');
ylabel('wychylenie');
title('Polozenie wzgledem czasu (Euler)');

y=thetaOut(1:end-1).*thetaOut(2:end);

x=find(y<0);
mz=diff(x);
Tc=2*mz*h;
T=Tc(1);

katy=[0.0872664625997165,0.349065850398866,1.04719755119660,1.57079632679490,2.26892802759263];
okresy=[6.28620000000000,6.33140000000000,6.74320000000000,7.41680000000000,9.23680000000000];

figure;
plot(okresy,katy,'rs');
title('Wykres zaleznosci okresu od wartosci kata wychylenia poczatkowego');
xlabel('Okres');
ylabel('Theta0');

% okres wzrasta 4 krotnie jesi zamiast theta0=5*pi/180 wpiszemy 179*pi/180

% dla kazdego elementu wektora thetaouut i omegaout obliczyc calkowita
% energie mechaniczna ukladu i wyrysowac jako funkcje czasu

Ek = omegaOut.*omegaOut/2;
Ep = 1 - cos(thetaOut);
Emech = Ek + Ep;
figure;
plot(tOut,Emech/Emech(1));
xlabel('czas');
ylabel('energia mechaniczna');
title('Energia mechaniczna w funkcji czasu');

% Radomyra:
% E0 = (1-cos(thetaOut(1)))+omegaOut(1)^2/2);
% E = (1-cos(thetaOut))+omegaOut.^2/2)/E0;

% chcielibysmy i oczekiwalibysmy ze wykres Emech bedzie linia prosta bo to
% jest wielkosc stala (zmienia sie Epot i Ekin ale ich suma jest stala),
% ale sa niewielkie oscylacje (bo to metody numeryczne)

[tOut,thetaOut,omegaOut] = EulerRichardsonWahadlo(tstart,tend,theta0,omega0,h);

figure;
plot(tOut,thetaOut); % wykres polozenia wzgledem czasu
xlabel('czas');
ylabel('wychylenie');
title('Polozenie wzgledem czasu (Euler-Richardson)');

