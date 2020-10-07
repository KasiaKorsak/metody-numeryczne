x = 1.0;
v = 0.0;
dt = 0.01;
t=0;
xVec=[];
vVec=[];
tVec=[];
n=1000;
a = przyspieszenie(x);

for i=1:n
    xVec=[xVec;x];
    vVec=[vVec;v];
    tVec=[tVec;t];
    
    vMid=v+0.5*a*dt;
    x=x+vMid*dt;
    a = przyspieszenie(x);
    v=vMid+0.5*a*dt;
    t=t+dt;
    
end

%%
figure
plot(tVec, vVec); grid on