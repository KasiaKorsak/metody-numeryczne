function [tOut,uOut,mOut,nOut,hOut,ILout,IKout,INAout] = hodgkinHuxley(t0,tk,dt,Imax)

C=1;
eNa=115.0;
eK=-12.0;
eL=10.6;
gNa=120;
gK=36.0;
gL=0.3;

nProb=floor((tk-t0)/dt);
I=[zeros(1,0.1*nProb) ones(1,0.9*nProb+1)*Imax];

u=0;
t=t0;

alfaM=(0.1*(25-u))/(exp((25-u)/10)-1); 
betaM=4*exp(-u/18);
alfaN=(0.01*(10-u))/(exp((10-u)/10)-1);
betaN=0.125*exp(-u/80);
alfaH=0.07*exp(-u/20);
betaH=1/(exp((30-u)/10)+1);

mOut(1)=(alfaM)/(alfaM+betaM);
nOut(1)=(alfaN)/(alfaN+betaN);
hOut(1)=(alfaH)/(alfaH+betaH);
tOut(1)=t0;
uOut(1)=u;

m=mOut(1);
n=nOut(1);
h=hOut(1);

ILout(1)=gL*(u-eL);
IKout(1)=gK*n^4*(u-eK);
INAout(1)= gNa*m^3*h*(u-eNa);

for i=1:nProb
t=t+dt;

alfaM=(0.1*(25-u))/(exp((25-u)/10)-1);
betaM=4*exp(-u/18);
alfaN=(0.01*(10-u))/(exp((10-u)/10)-1);
betaN=0.125*exp(-u/80);
alfaH=0.07*exp(-u/20);
betaH=1/(exp((30-u)/10)+1);

mMid=m+(alfaM*(1-m)-betaM*m)*(dt/2);
nMid=n+(alfaN*(1-n)-betaN*n)*(dt/2);
hMid=h+(alfaH*(1-h)-betaH*h)*(dt/2);
uMid=u+((-(gNa*m^3*h*(u-eNa)+gK*n^4*(u-eK)+gL*(u-eL))+I(i))/C)*(dt/2);

alfaM=(0.1*(25-uMid))/(exp((25-uMid)/10)-1);
betaM=4*exp(-uMid/18);
alfaN=(0.01*(10-uMid))/(exp((10-uMid)/10)-1);
betaN=0.125*exp(-uMid/80);
alfaH=0.07*exp(-uMid/20);
betaH=1/(exp((30-uMid)/10)+1);

m=m+dt*(alfaM*(1-mMid)-betaM*mMid);
n=n+dt*(alfaN*(1-nMid)-betaN*nMid);
h=h+dt*(alfaH*(1-hMid)-betaH*hMid);
u=u+dt*((-(gNa*mMid^3*hMid*(uMid-eNa)+gK*nMid^4*(uMid-eK)+gL*(uMid-eL))+I(i))/C);
 
uOut=[uOut;u];
tOut=[tOut;t];
mOut=[mOut;m];
nOut=[nOut;n];
hOut=[hOut;h];
 
IL=gL*(u-eL);
IK=gK*n^4*(u-eK);
INA=gNa*m^3*h*(u-eNa);

INAout=[INAout;INA];
IKout=[IKout;IK];
ILout=[ILout;IL];
end
end
