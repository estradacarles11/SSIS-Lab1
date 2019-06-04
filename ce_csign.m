function Zc=ce_csign(x)

x=x(:)'; % Garantim que el senyal x sigui un vector fila
Lx=length(x); % nombre de mostres del senyal

Zc=[]; % Inicialització de la variable on comptem les mostres entre canvis
for n=2:Lx % Es recorre tot el vector x
    if (sign(x(n))*sign(x(n-1)))<0 % Si hi ha canvi de signe
    Zc=[Zc,n]; % Afegim a Zc en quina posici� es produeix el canvi de signe
    end
end

