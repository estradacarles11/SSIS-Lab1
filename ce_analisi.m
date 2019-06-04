[nom,cami]=uigetfile('*.wav'); 
[x,fm]=audioread([cami,nom]); 

x=x(:)';
Tm=1/fm;
Lx=length(x);
T=(Lx-1)*Tm;
t=0:Tm:T;

subplot(211), plot(t,x);
title(['Senyal del fitxer ',nom])
xlabel('t')

Zc=ce_csign(x);

Lz=length(Zc);
Zs=0;
for n=2:Lz
    Zs=Zs+Tm*Zc(n)-Tm*Zc(n-1);
end
Nz=Zs/(Lz-1);
Tx=2*Nz;
fx=1/Tx


L3=ceil(Tx*fm*3); % Nombre de mostres que hi ha en tres per�odes del senyal
subplot(212), plot(t(1:L3),x(1:L3))
title('Representació de tres períodes')