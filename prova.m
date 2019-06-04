[nom,cami]=uigetfile('*.wav'); 
[x,fm]=audioread([cami,nom]); 

x=x(:)';
Tm=1/fm;
Lx=length(x);
T=(Lx-1)*Tm;
t=0:Tm:T;

Zc=ce_csign(x);

Lz=length(Zc);
Zs=0;
for n=2:Lz
    Zs=Zs+Tm*Zc(n)-Tm*Zc(n-1);
end
Nz=Zs/(Lz-1);
Tx=2*Nz;
fx=1/Tx
