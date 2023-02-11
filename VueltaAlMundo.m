%% VueltaAlMundo
% Autor: Dr. Juan Carlos C�rdova Zece�a.
% Fecha: Enero de 2023.
%
% Uso:
% VueltaAlMundo
%
%% Preliminares
% 1. CoppeliaSim debe estar siendo ejecutada localmente con un objeto con
% nombre '/ReferenceFrame'.
% 2. No debe estar ejecut�ndos eninguna simulaci�n.
% 3. MATLAB u Octave a??n no se conectan con CoppeliaSim (este script
% crear� esa conexi�n).
%
%% Descripci�n
% Este script hace que un sistema de referencia haga una revoluci�n
% circular alrededor del origen.
%
% El movimiento ocurre en el modo de simulaci�n de CoppeliaSim. El script
% comienza y termina la simulaci�n.
% Creamos la conexi�n.
client = RemoteAPIClient();
sim = client.getObject('sim');
% Obtenemos una referencia (handle) al marco de referencia.
hRF = sim.getObject('/ReferenceFrame');
% Ubicamos al marco de referencia en (A,0,0).
A = 1;
sim.setObjectPosition(hRF,sim.handle_world,[A 0 0]);
% Iniciamos la simulaci�n.
sim.startSimulation();
% Movemos al sistema de referencia en un c�rculo.

N = input("Ingrese n�mero de segmentos:");
tp = input("Ingrese tiempo a utilizar:");

%Variable = Func(Segmentos, Tiempo)
pause(3);
for k = 0:N
 P = [A*cos(2*pi*k/N) A*sin(2*pi*k/N) 0];
 O = [0 0 pi];
 sim.setObjectPosition(hRF,sim.handle_world,P);
 sim.setObjectOrientation(hRF,sim.handle_world,O);
 pause(tp);
end
sim.stopSimulation();