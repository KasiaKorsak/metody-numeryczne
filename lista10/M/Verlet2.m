function [tout, xout, yout, vxout, vyout, rmin, rmax] = VerletK(t0, tk, x0, y0, vx0, vy0, h)
t = 0;
x = x0;
y = y0;
vx = vx0;
vy = vy0;
tout(1) = t0;
xout(1) = x0;
yout(1) = y0;
vxout(1) = vx0;
vyout(1) = vy0;
GM = 4*pi^2;

n = floor((tk-t0)/h);
rmin = sqrt(x^2+y^2);

for i = 1:n
r = sqrt(x^2+y^2);
vxMid = vx+(h*(-(GM/r^3)*x)*0.5);
vyMid = vy+(h*(-(GM/r^3)*y)*0.5);
x = x+h*vxMid;
y = y+h*vyMid;
r = sqrt(x^2+y^2);
vx = vxMid+(h*(-(GM/r^3)*x)*0.5);
vy = vyMid+(h*(-(GM/r^3)*y)*0.5);

xout = [xout, x];
vxout = [vxout, vx];
yout = [yout, y];
vyout = [vyout, vy];
t = t + h;
tout = [tout, t];
rout = [rout, r];

end
rmax=rout(end);
end