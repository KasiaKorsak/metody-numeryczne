function yp = lotka(t,y)
yp = diag([1.5 - 1*y(2), -3 + 1*y(1)])*y;
end