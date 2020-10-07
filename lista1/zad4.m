P=15;
G=0;
k=4*(4*atan(1/5)-atan(1/239));
for p=1:P
    G=G+(10^p*(1+p*k*10^(-p))-10^p)/p;
end
G