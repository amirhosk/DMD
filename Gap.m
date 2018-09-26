%%%%%Gap Metric

clear;clc


tF=100;    %Final time
Fs=5;
t = 0:1/Fs:tF-1/Fs;                     % Time vector
L=length(t);

f1=.1;   %%Initial frequency
f2=Fs;   %%Final frequency

%x = sin(2*pi*15*t) + sin(2*pi*40*t);      % Signal
x = sin(2*pi*(1/2*(f2-f1)/tF.*t+f1).*t);

s = tf('s');
G1 = s/(s^2 + 2*s + 10);
G2 = 1/(s + 1);

out1=lsim(G1,x,t)

out2=lsim(G2,x,t)


y1 = fft(out1);                             % Compute DFT of system 1
m1 = abs(y1);                               % Magnitude
y1(m1<1e-6) = 0;
p1 = unwrap(angle(y1));                     % Phase

y2 = fft(out2);                             % Compute DFT of system 2
%P2 = abs(y2/L);
%P1 = P2(1:L/2+1);
%P1(2:end-1) = 2*P1(2:end-1);

m2 = abs(y2);                               % Magnitude
y2(m2<1e-6) = 0;
p2 = unwrap(angle(y2));                     % Phase


%f = Fs*(0:(L/2))/L;

f = (0:L-1)*Fs/L;        % Frequency vector
f=f(1:end/2);

%plot(f,mag2db(m1))
title('Magnitude')
hold on
scatter(f,mag2db(1/Fs.*m2(1:end/2)))


[mag,phase,wout] = bode(G2,f);
mag=reshape(mag,[],1);
plot(f,mag2db(mag))



v=max(abs((1+y2.*conj(y2)).^(-1/2).*(y2-y1).*(1+y1.*conj(y1)).^(-1/2)))