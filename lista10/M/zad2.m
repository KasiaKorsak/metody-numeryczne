x0 = [1.0, 0.5, 0.7, 2, 1, 1, 1, 1, 1, 1, 1];
y0 = [0, 0, 0, 0, 0.1, 0.5, 1, 2, 0, 0, 0];
vx0 = zeros(1,numel(x0));
vy0 = [2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi];
h = 0.01;
tout = zeros(1,numel(x0));
xout = zeros(1,numel(x0));
yout = zeros(1,numel(x0));
r = zeros(1,numel(x0));
for i=1:numel(x0)
[t, x, y, vxout, vyout, rmin, rmax] = Verlet2(0, 10, x0, y0, vx0, vy0, h);
tout(i) = t;
xout(i) = x;
yout(i) = y;
r(i) = (rmin+rmax)/2;
end

% do III PK
r = (rmin+rmax)/2
%periods = tout(find(xout>=(max(xout)-0.01*max(xout))))
%T = periods(4)-periods(3)
% pks - wartoœci, locs - indeksy
[pks,locs] = findpeaks(xout)
T = mean(diff(locs)*h)
kepler = T^2/r^3
a = max([max(xout), max(yout)])

figure
subplot(1,3,1)
plot(xout, yout);
xlabel('x [AU]')
ylabel('y [AU]')
%xlim([-1,1])
%ylim([-1,1])
subplot(1,3,2)
plot(tout, xout);
xlabel('t [lata]')
ylabel('x [AU]')
subplot(1,3,3)
plot(tout, yout);
xlabel('t [lata]')
ylabel('y [AU]')