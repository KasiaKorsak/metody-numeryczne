[toutv, xoutv, voutv] = Verlet(0, 10, 1, 0, 0.01);
[toute, xoute, voute] = EulerRichardson(0, 10, 1, 0, 0.01);

Ev = (voutv.^2/2)+(xoutv.^2/2);
Ev = Ev/Ev(1);
Ee = (voute.^2/2)+(xoute.^2/2);
Ee = Ee/Ee(1);

figure
subplot(1,2,1)
plot(toutv,Ev)
title('Verlet')
xlabel('czas')
ylabel('E/E1')
set(gca,'yticklabel',num2str(get(gca,'ytick')','%.6f'))
subplot(1,2,2)
plot(toute,Ee)
title('Euler-Richardson')
xlabel('czas')
ylabel('E/E1')
set(gca,'yticklabel',num2str(get(gca,'ytick')','%.7f'))
