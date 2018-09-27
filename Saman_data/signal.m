clear
clc


load data
t=data(:,1);
cl=data(:,2);

C=0.18;
u=10;
k1=0;
k2=1;
f1=k1*u/(pi*C);
f2=k2*u/(pi*C);
T2=1/f2;
%tf=5*T2;
%tf=0.5655;
tf=10*(1/f2);
%tf=(1/f1+1/f2)/2;
%t=0:0.001:tf;
L=length(t);
tf=t(end);

w=2*pi*((f2-f1)/(2*tf)*t+f1);
k=w*C/(2*u);
alpha=10.*sin(w.*t);
%plot(t,10*sin(w.*t))
%hold on
%plot(t,w.*cos(w.*t))  %%% It looks worng the derivative
grid on
legend('alpha','alpha-dot')

y1=fft(alpha);
y2=fft(cl);
f = (0:L-1)*Fs/L;        % Frequency vector
f=f(1:end/2);