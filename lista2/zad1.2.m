deltat = 1;
 t_euler = 0:deltat:10;
e=2.71;
x_analit = zeros(size(t_euler));
x_analit(1,1) = 1;
for i = 1:length(t_euler)-1
 x_analit(1,i) = x_analit(1,e^(-i));
end
 x_analit


 x_euler = zeros(size(t_euler));
x_euler(1,1) = 1 ;
 %x_euler(1,2)=x_euler(1,1)+deltat.*(-1.*t_euler(1,1))
 for i = 1:length(t_euler)-1
 x_euler(1,i+1) = x_euler(1,i) + deltat.*(-1.*t_euler(1,i));
 end
 x_euler
 
 deltat=10^-1;
 x1_euler = zeros(size(t_euler));
 x1_euler(1,1) = 1 ;
 for i = 1:length(t_euler)-1
 x1_euler(1,i+1) = x1_euler(1,i) + deltat.*(-1.*t_euler(1,i));
 end
 E1=abs((x1_euler-x_euler))
 x1_euler
 
 deltat=10^-2;
 x2_euler = zeros(size(t_euler));
 x2_euler(1,1) = 1 ;
 for i = 1:length(t_euler)-1
 x2_euler(1,i+1) = x2_euler(1,i) + deltat.*(-1.*t_euler(1,i));
 end
 E2=abs((x2_euler-x_euler))
 x2_euler
 
 deltat=10^-3;
 x3_euler = zeros(size(t_euler));
 x3_euler(1,1) = 1 ;
 for i = 1:length(t_euler)-1
 x3_euler(1,i+1) = x3_euler(1,i) + deltat.*(-1.*t_euler(1,i));
 end
 E3=abs((x3_euler-x_euler))
 x3_euler
 
 deltat=10^-4;
 x4_euler = zeros(size(t_euler));
 x4_euler(1,1) = 1 ;
 for i = 1:length(t_euler)-1
 x4_euler(1,i+1) = x4_euler(1,i) + deltat.*(-1.*t_euler(1,i));
 end
 E4=abs((x4_euler-x_euler))
 x4_euler
 
 E=[0,E1(3),E2(3),E3(3),E4(3)]
 dt=[1,0.1,0.01,0.001,0.0001]
 figure
 plot(E,dt)
 E=log(E);
 dt=log(dt);
 figure
 plot(E,dt)