
%Optimization procedure of a hybrid photovoltaic wind energy system

%%http://sci-hub.tw/10.1016/s0360-5442(99)00042-0
%The aim of this optimization procedure is to size a hybrid system 
%that satisfies an annual specified load demand with the minimum cost.


%A hybrid solar/wind system with a PV array area of Apv (m^2) and multiple
%wind machines of 30 kW rated power is considered


% A         Area, m2
% Apv       Area of the PV array, m2
% h         Efficiency, dimensionless
% Pf        Packing factor, dimensionless
% Sj        Solar Insolation during month J
b=1;        %array efficiency
Tc=35;      %monthly average cell
Tr=40;      %reference temperature for the cell efficiency
hr=1;       %module reference efficiency
hm=hr*(1-b(Tc-Tr));        %module efficiency
hpc=1;      %power conditioning efficiency
h=hm*hpc*Pf;
Pf=1;

h=hm*hpc*Pf;    %system efficiency
A=12;           %cross sectional area of the wind rotor in m2
V=[];           %wind velocity in m/s at the hub height
ro=             %air density in kg/m3

Pw=0.593*(0.5*ro*A*V.^3);
%Sj es una tabla de irradiacion solar por mes
%Xi otra tabla
%The monthly solar/wind hybrid power production is given by

%j Number of months
%i Number of hours
for j=1:12
    for i=1:24
        Psj=Sj*h*Apv;  %The hourly-based calculated solar power
        Pij=Psj+Xi+Pwj(1-Xi) %The monthly solar/wind hybrid power production
        