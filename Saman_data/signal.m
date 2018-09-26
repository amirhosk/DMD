clear
clc
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
t=0:0.001:tf;

w=2*pi*((f2-f1)/(2*tf)*t+f1);
k=w*C/(2*u);
plot(t,10*sin(w.*t))
hold on
plot(t,w.*cos(w.*t))
grid on
legend('alpha','alpha-dot')