t0 = 0;
tfinal = 15;
y0 = [20 20]';
tfinal = tfinal*(1+eps);
[t,y] = ode23(@lotka,[t0 tfinal],y0);

subplot(1,2,1)
plot(t,y)
title('Populacja')
legend('ofiary','drapiezniki');

subplot(1,2,2)
plot(y(:,1),y(:,2))
title('Przestrzeñ fazowa')
