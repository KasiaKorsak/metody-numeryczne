function [tout,mout,nout,hout,uout,Inaout,Ikout,Ilout] = hodgkin_huxley( t0,tk,hi,Imax,C,Ena,Ek,El,gNa,gK,gL,u0 )

tout(1)=t0;
minf=alfaM(u0)/(alfaM(u0)+betaM(u0));
ninf=alfaN(u0)/(alfaN(u0)+betaN(u0));
hinf=alfaH(u0)/(alfaH(u0)+betaH(u0));
t=t0;
mout(1)=minf;
nout(1)=ninf;
hout(1)=hinf;
uout(1)=u0;
u=u0;
m=mout(1);
n=nout(1);
h=hout(1);

Inaout(1)=gNa*m^3*h*(u0-Ena);
Ikout(1)=gK*n^4*(u0-Ek);
Ilout(1)=gL*(u0-El);

k = floor((tk-t0)/hi);
I=[zeros(1,0.1*k),ones(1,0.9*k+1)*Imax];
for i=1:k
 t = t + hi;
 
    mMid=m+(alfaM(u)*(1-m)-betaM(u)*m)*(hi/2);
    nMid=n+(alfaN(u)*(1-n)-betaN(u)*n)*(hi/2);
    hMid=h+(alfaH(u)*(1-h)-betaH(u)*h)*(hi/2);
    uMid=u+((-(gNa*m^3*h*(u-Ena)+gK*n^4*(u-Ek)+gL*(u-El))+I(i))/C)*(hi/2);
    
    m=m+(alfaM(uMid)*(1-mMid)-betaM(uMid)*mMid)*hi;
    n=n+(alfaN(uMid)*(1-nMid)-betaN(uMid)*nMid)*hi;
    h=h+(alfaH(uMid)*(1-hMid)-betaH(uMid)*hMid)*hi;
    u=u+((-(gNa*mMid^3*hMid*(uMid-Ena)+gK*nMid^4*(uMid-Ek)+gL*(uMid-El))+I(i))/C)*hi;
   
    mout=[mout,m];
    nout=[nout,n];
    hout=[hout,h];
    tout=[tout,t];
    uout=[uout,u];
    
    Ina=gNa*m^3*h*(u-Ena);
    Ik=gK*n^4*(u-Ek);
    Il=gL*(u-El);

    Inaout=[Inaout,Ina];
    Ikout=[Ikout,Ik];
    Ilout=[Ilout,Il];
end

end

