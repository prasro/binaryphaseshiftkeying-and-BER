clear all: close all: clc:
h=[10 3];
mu= 0.8; %step size %
Fs= 1000; %number of itterations %
x=randn(1,Fs);
mean=0;
sigma= 1;
noise =sigma+randn(1,Fs)+mean;% white noise generation %
x-x+noise;
d=conv(x,h); % desired output %
w0(1:length(mu),1) = 0;w1(1:length(mu),1)= 0; % initial coefficents set to zero%
for i= 1: length(mu);
    y(1) = w0(i,1)*x(1); 
    e(1) = d(1)- y(1); % error calculation %
    w0(i,2) = w0(i,1)+mu(i)*e(1)*x(1);
    w1(i,2) = w1(i,1)+mu(i)*e(1)*x(1);
    
    for n = 2:Fs 
        y(n) = w0(i,n)*x(n)+w1(i,n)*x(n-1);
         e(n) = d(n) - y(n);
         w0(i,n+1) = w0(i,n)+mu(i)*e(n)*x(n);
         w1(i,n+1) = w1(i,n)+mu(i)*e(n)*x(n-1);
    end
     E(i,:)=e;
     cost(i,:) = e.*e;
     W= [w0 ,w1];
     
end
mse_error = mse(e);
plot(E);
grid on;
title('Error v/s Itterations ');
xlabel('itterations');
ylabel('amplitude');
figure;
plot(w0)
grid on;
title('coefficient 1');
xlabel('itterations');
figure;
plot(w1);
grid on;
title('coefficient 2');
xlabel('itterations');
figure;
stem(mse_error);
title ('mean square error');