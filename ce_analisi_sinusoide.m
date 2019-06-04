

% Autor: Carles Estrada i Adrià Febrer
% Anàlisi paràmetres sinusoide
%
clc, clear, close all  % Esborrat de variables i gràfics anteriors
%
% Lectura del fitxer wav
[nom,cami]=uigetfile('*.wav');   % Selecció fitxer .wav
[x,fm]=audioread([cami,nom]);    % Importació de senyal i freq. mostratge
%
%Preparació de variables d'anàlisi
x=x(:)';  % Garantim que el senyal x sigui un vector fila
Tm=1/fm;  % temps de mostratge
Lx=length(x); % nombre de mostres del senyal
T=(Lx-1)*Tm;  % Durada del senyal en segons
t=0:Tm:T;  % Eix de temps
%
% Escoltem el senyal
sound(x,fm)
%
% Primera representació gràfica
subplot(211), plot(t,x);
title(['Senyal del fitxer ',nom])
xlabel('t')


% Anàlisi amplitud (es pot comprovar amb el gràfic)
A1=max(x);  % mesurem l'amplitud amb el màxim
A2=-min(x);  % mesurem l'amplitud amb el mínim
A3=max(abs(x));  % mesurem l'amplitud amb el valor absolut màxim
Px=x*x'/Lx;     % Estimació de la potència del senyal
A4=sqrt(2*Px);  % Amplitud a partir de la potència
%
%Mostrem els resultats d'amplitud
disp('La mesura de l''amplitud amb diferents procediments és:')
disp(['A, com a màxim de x(t), A1=',num2str(A1)])
disp(['A, com mínim de x(t), A2=',num2str(A2)])
disp(['A, com el màxim valor absolut de x(t), A3=',num2str(A3)])
disp(['A, a partir de la potència mitjana de x(t), A4=',num2str(A4)])

% Mesura de freqüència (o període)
Zc=ce_csign(x); % Ús de la funció creada per trobar els creuaments
Lz=length(Zc);
Zs=0;
for n=2:Lz
    Zs=Zs+Tm*Zc(n)-Tm*Zc(n-1);
end
Nz=Zs/(Lz-1);
Tx=2*Nz;
fx=1/Tx; % Freqüència del senyal
disp(['La freqüència estimada per creuament per zeros és: fx=',num2str(fx),' Hz'])

% Representem 3 períodes
L3=ceil(Tx*fm*3); % Nombre de mostres que hi ha en tres períodes del senyal
subplot(212), plot(t(1:L3),x(1:L3))
title('Representació de tres períodes')
xlabel('t')

% Mesura de la fase
phix=asin(x(1)/A4);
if x(2)<x(1), phix=pi-phix; end  % Comprovació de l'angle de la fase
if phix>pi, phix=phix-2*pi; end % Comprovació del signe de la fase
disp(['La fase és phix=',num2str(phix*180/pi),'º'])