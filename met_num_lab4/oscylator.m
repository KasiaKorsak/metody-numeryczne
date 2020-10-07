function dx = oscylator( t,x,k,m ) %k,m - stale, x - polozenie

dx=[x(2);(1/m)*(-k*x(1))];

end

