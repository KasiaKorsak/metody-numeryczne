clear all;
clc;
A=[1 1 5 15 39 50 75 100 100];
a=[0.99 1.01 5.01 14.98 29.99 49.85 75.45 99.99 99]; 

delta=[];
gamma=[];
N=length(A);
for n=1:N
[delta] = [delta abs(A(n)-a(n))];
[gamma] = [gamma abs(A(n)-a(n))/(abs(A(n)))];
end
figure;
plot(A,delta,A,gamma);
xlabel('A');
grid on;
hold on;
ylabel('b³êdy');