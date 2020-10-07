function [tout, xout, vout] = Verlet(t0, tk, x0, v0, h)
t = 0;
x = x0;
v = v0;
tout(1) = t0;
xout(1) = x0;
vout(1) = v0;

a = -x;
n = floor((tk-t0)/h);

for i = 1:n
vMid = v+(h*a/2);
x = x+h*vMid;
a = -x;
v = vMid+(h*a/2);

xout = [xout, x];
vout = [vout, v];
tout = [tout, t];

t = t + h;
end

end