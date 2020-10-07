function [tout, xout, vout] = EulerRichardson(t0, tk, x0, v0, h)
n = floor((tk-t0)/h); % ilosc próbek
t = t0;
x = x0;
v = v0;
tout(1) = t0;
xout(1) = x0;
vout(1) = v0;
for i = 1:n
 xMid = x + v*(h/2);
 vMid = v - x*(h/2);
 x = x + vMid*h;
 v = v - xMid*h;
 xout = [xout, x];
 vout = [vout, v];
 t = t + h;
 tout = [tout, t];
end
end
