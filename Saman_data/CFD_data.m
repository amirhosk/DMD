clear all;
clc;

Input_tecplot= xlsread('data_100k_01');
%Input_tecplot=importdata('data.dat');

c=0.18; b=c/2;
k=0.1; 
U_inf=10;
w=k*U_inf/b;  %%frequency of the motion

T=(2*pi)/w;

n_s=1200; %number of grid points per time step taken from tecplot  
%should be defined manually or by using Input_tecplot(2,1) in the next line
n_s=Input_tecplot(2,1);

n_t=(length(Input_tecplot)-4+7)/(5+n_s)  %number of time steps which is calculated
if (k==1)
for t=1:n_t
  t
  if(t<6)
  start=4+5*(t-1)+n_s*(t-1)+1;
  finish=start+n_s-1;
  1+5*(t-1)+(t-1)*n_s
  time(t,1)=Input_tecplot(1+5*(t-1)+(t-1)*n_s ,2);
  elseif (t<59)
  start=4+5*(t-1)+n_s*(t-1);
  finish=start+n_s-1;
  1+5*(t-1)+(t-1)*n_s
  time(t,1)=Input_tecplot(5*(t-1)+(t-1)*n_s ,2);
  else
  start=4+5*(t-1)+n_s*(t-1)-1;
  finish=start+n_s-1;
  1+5*(t-1)+(t-1)*n_s
  time(t,1)=Input_tecplot(-1+5*(t-1)+(t-1)*n_s ,2);
  end
  for i=start:finish
  p=i-start+1;
  x(t,p)=Input_tecplot(i,1);
  y(t,p)=Input_tecplot(i,2);
  pressure(t,p)=Input_tecplot(i,3);
  xvel(t,p)=Input_tecplot(i,4);
  yvel(t,p)=Input_tecplot(i,5);
  vorticity(t,p)=Input_tecplot(i,6);

      
  end
end
elseif (k==0.1)
    for t=1:n_t
  t
  if(t<10)
  start=4+5*(t-1)+n_s*(t-1)+1;
  finish=start+n_s-1;
  1+5*(t-1)+(t-1)*n_s
  time(t,1)=Input_tecplot(1+5*(t-1)+(t-1)*n_s ,2);
  elseif (t<59)
  start=4+5*(t-1)+n_s*(t-1);
  finish=start+n_s-1;
  1+5*(t-1)+(t-1)*n_s
  time(t,1)=Input_tecplot(5*(t-1)+(t-1)*n_s ,2);
  elseif (t<116)
  start=4+5*(t-1)+n_s*(t-1)-1;
  finish=start+n_s-1;
  1+5*(t-1)+(t-1)*n_s
  time(t,1)=Input_tecplot(-1+5*(t-1)+(t-1)*n_s ,2);
  else
  start=4+5*(t-1)+n_s*(t-1)-2;
  finish=start+n_s-1;
  1+5*(t-1)+(t-1)*n_s
  time(t,1)=Input_tecplot(-2+5*(t-1)+(t-1)*n_s ,2);
  end
  for i=start:finish
  p=i-start+1;
  x(t,p)=Input_tecplot(i,1);
  y(t,p)=Input_tecplot(i,2);
  pressure(t,p)=Input_tecplot(i,3);
  xvel(t,p)=Input_tecplot(i,4);
  yvel(t,p)=Input_tecplot(i,5);
  vorticity(t,p)=Input_tecplot(i,6);

      
  end
    end
end





