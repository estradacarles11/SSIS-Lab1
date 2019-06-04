[y,fm]=audioread('ymtpx1.wav');
%sound(y,fm)
Ti=1;
Tf=Ti+0.025;

%Constants
y=y(:)';
Tm=1/fm;
Ly=length(y);
%T=(Lx-1)*Tm;
Li=uint32((Ti/Tm));
Lf=uint32((Tf/Tm));
%Lx=length(x);
%Lt=length(t);
Ly=length(y)
T=(Ly-1)*Tm;
t=0:Tm:T;
Lt=length(t)

%Transformades de Fourier
tt=Ti:Tm:Tf;
yy=y(Li:L)';
f=0:fm/2/1000*1.2:fm/2*1.2;
ff=0:5:5000;
Y1=ce_tf(yy,tt,ff);
fff=20000:5:25000;
Y2=ce_tf(yy,tt,fff);

%Demodulador
f1=2.205*10^4
y1=y.*cos(2*pi*f1*t);%Les dimensions de y han de ser iguals a les de t
%sound(y1,fm)

%Experiment
y2=y;
y2(1:2:end)=-y2(1:2:end);
%sound(y2,fm) %Es sent igual



%Representació gràfica
figure
subplot(2,1,1)
plot(tt,yy)
subplot(2,1,2)
plot([ff,fff],[abs(Y1)',abs(Y2)'])