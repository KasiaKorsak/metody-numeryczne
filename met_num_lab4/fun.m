function dxdt = fun(t,x,ni)
dxdt = [x(2); (1-x(1)^2)*x(2)*ni-x(1)];
end
