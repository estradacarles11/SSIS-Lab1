% Autor: Carles Estrada i Adrià Febrer
% Creació d'un senyal d'àudio a una freqüència determinada
%
clc, clear, close all  % Esborrat de variables i gràfics anteriors
%
Ax=1; % Definim l'amplitud
fx=220; % Definim la freqüència del senyal
phix=0; % Definim la fase
ti=0; % Definim el temps inicial
tf=2; % Definim el temps final
fm=44100; % Definim la freqüència de mostratge

tm=1/fm; % Es calcula el període de mostratge
t=[ti:tm:tf]; % Es crea el vector temps

% S'analitza si l'amplitud introduïda està admesa (A<1). 
if Ax > 1;
    Ax=1;
end

x=Ax*sin(2*pi*fx*t+phix); % Es genera el vector del senyal

audiowrite('ce_diapaso.wav',x,fm) % Generació de l'arxiu d'audio

% Generació de gràfica
L3=ceil(3/fx*fm); % Mostres necessàries per dibuixar 3 períodes
plot(t(1:L3),x(1:L3)) 
title(['Diapassó de ' num2str(fx) ' Hz, representació de 3 períodes.'])
xlabel('t')

sound(x,fm) % Escoltar senyal