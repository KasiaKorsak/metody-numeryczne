function [ suma ] = zad3( alfa, N, x )
suma=0;
if abs(x)>1
    error('z³a liczba')  
end
if x==1
    for n=0:N
      suma = suma + ((-1)^n)/(n+1) * x^(n+1);
    end
    wynik = log(1+x) 
elseif abs(x)<1
for n=0:N
suma = suma + factorial(alfa)/(factorial(n)*factorial(alfa-n))*(x^n);
end
wynik2 =(1+x)^alfa
end
end

