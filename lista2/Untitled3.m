x_euler = zeros(0,6);
deltat = 1;
x_euler(1,1) = 1 ;
x_euler(1,2)=x_euler(1,1)+deltat.*(-1.*t_euler(1,1))
for n=1:4
   deltat = 10^-n;
   x_euler(1,2+n) = x_euler(1,1) + deltat.*(-1.*t_euler(1,1))
end