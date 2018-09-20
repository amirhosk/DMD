close all, clc
CFD_data
xvel(isnan(xvel))=0;
yvel(isnan(yvel))=0;
xvel=xvel';
yvel=yvel';

VEL=[xvel;yvel];
vel=VEL(:,1:90);

X = vel(:,1:end-1);
X2 = vel(:,2:end);
[U,S,V] = svd(X,'econ');

%%  Compute DMD (Phi are eigenvectors)
r = 21;  % truncate at 21 modes
U = U(:,1:r);
S = S(1:r,1:r);
V = V(:,1:r);
Atilde = U'*X2*V*inv(S);
[W,eigs] = eig(Atilde);
Phi = X2*V*inv(S)*W;

%% Plot DMD modes
% for i=10:2:20
%     plotCylinder(reshape(real(Phi(:,i)),nx,ny),nx,ny);
%     plotCylinder(reshape(imag(Phi(:,i)),nx,ny),nx,ny);
% end

%%  Plot DMD spectrum
% figure
% theta = (0:1:100)*2*pi/100;
% plot(cos(theta),sin(theta),'k--') % plot unit circle
% hold on, grid on
% scatter(real(diag(eigs)),imag(diag(eigs)),'ok')
% axis([-1.1 1.1 -1.1 1.1]);

%% Prediction

dt=.01;
t=0:1:129;
%lambda = diag(eigs);
%omega = log(lambda)/dt;
x1 = X(:, 1);
%b = Phi\x1;

 X_dmd = zeros(2400,130);
 X_dmd(:,1)=x1;
for iter = 2:130
    X_dmd(:,iter) = Phi*eigs^(iter-1)*Phi'*x1;
end


hold on
plot(t,VEL(1,:),'r--',t,X_dmd(1,:),'k')

