clc,clear all;

a=0.02;
b=0.2;
c=-65;
d=8;           % RS 
v0=c;
u0=b*v0;
h=0.01;
t0=0;
tk=1000;
Imax=6;


[ tout,uout,vout,I ] = EulerRichardson_Izhikevich( a,b,c,d,h,t0,tk,u0,v0,Imax );

figure;
plotyy(tout,vout,tout,uout);
title('RS');
legend('V','U')
hold on;
plot(tout,I,'y');
hold off;

[pks,loc,w,p] = findpeaks(vout);
t=length(loc);
fRS=t/(length(tout)/100);
maxRS=max(pks);
min=min(pks);
srRS=0.5*(maxRS+min);
stdRS=std(pks);
s=sort(pks);
t_RS=floor((s(end)-s(end-1))/fRS);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          IB
c=-55;
d=4; %IB
[ tout,uout,vout,I ] = EulerRichardson_Izhikevich( a,b,c,d,h,t0,tk,u0,v0,Imax );

figure;
plotyy(tout,vout,tout,uout);
title('IB');
legend('V','U')

[pks,loc,w,p] = findpeaks(vout);
t=length(loc);
fIB=t/(length(tout)/100);
maxIB=max(pks);
s=sort(pks);
min=s(1);
srIB=0.5*(maxIB+min);
stdIB=std(pks);
t_IB=floor((s(end)-s(end-1))/fIB);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          CH
c=-50;
d=2; %CH
[ tout,uout,vout,I ] = EulerRichardson_Izhikevich( a,b,c,d,h,t0,tk,u0,v0,Imax );

figure;
plotyy(tout,vout,tout,uout);
title('CH');
legend('V','U')

[pks,loc,w,p] = findpeaks(vout);
t=length(loc);
fCH=t/(length(tout)/100);
maxCH=max(pks);
s=sort(pks);
min=s(1);
srCH=0.5*(maxCH+min);
stdCH=std(pks);
t_CH=floor((s(end)-s(end-1))/fCH);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%               FS
a=0.1;
c=-65; %FS
[ tout,uout,vout,I ] = EulerRichardson_Izhikevich( a,b,c,d,h,t0,tk,u0,v0,Imax );

figure;
plotyy(tout,vout,tout,uout);
title('FS');
legend('V','U')

[pks,loc,w,p] = findpeaks(vout);
t=length(loc);
fFS=t/(length(tout)/100);
maxFS=max(pks);
s=sort(pks);
min=s(1);
srFS=0.5*(maxFS+min);
stdFS=std(pks);
t_FS=floor((s(end)-s(end-1))/fFS);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%               LTS
a=0.02;
b=0.25;
[ tout,uout,vout,I ] = EulerRichardson_Izhikevich( a,b,c,d,h,t0,tk,u0,v0,Imax );

figure;
plotyy(tout,vout,tout,uout);
title('LTS');
legend('V','U')

[pks,loc,w,p] = findpeaks(vout);
t=length(loc);
fLTS=t/(length(tout)/100);
maxLTS=max(pks);
s=sort(pks);
min=s(1);
srLTS=0.5*(maxLTS+min);
stdLTS=std(pks);
t_LTS=floor((s(end)-s(end-1))/fLTS);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%               TC
d=0.05;
tk=200;
[ tout,uout,vout,I ] = EulerRichardson_Izhikevich( a,b,c,d,h,t0,tk,u0,v0,Imax );

figure;
plotyy(tout,vout,tout,uout);
title('TC');
legend('V','U')

[pks,loc,w,p] = findpeaks(vout);
t=length(loc);
fTC=t/(length(tout)/100);
maxTC=max(pks);
s=sort(pks);
min=s(1);
srTC=0.5*(maxTC+min);
stdTC=std(pks);
t_TC=floor((s(end)-s(end-1))/fTC);