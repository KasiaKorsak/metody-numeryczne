function [ tout,uout,vout,I ] = EulerRichardson_Izhikevich2( a,b,c,d,h,t0,tk,u0,v0,Imin )

tout(1)=t0;
uout(1)=u0;
vout(1)=v0;
t=t0;
u=u0;
v=v0;

n = floor((tk-t0)/h);
I=[Imin*ones(1,0.1*n+1),zeros(1,0.9*n)];
for i=1:n
    

vmid= v+(0.04*v^2+5*v+140-u+I(i))*h/2;
umid=u+(a*(b*v-u))*h/2;
    
v=v+(0.04*vmid^2+5*vmid+140-umid+I(i))*h;  % potencjal
u=u+(a*(b*vmid-umid))*h; % zmienna odpowiadaj¹ca za powrót b³ony do stanu spoczynkowego
if v>=30
    v=c;
    u=u+d;
end
t = t + h;

uout=[uout,u];
vout=[vout,v];
tout=[tout,t];

end
end

