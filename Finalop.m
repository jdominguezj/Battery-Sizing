%%
%Optimizing battery sizing 
%Using WeiBull distribution to describe wind speed data

%Typical cut-in wind speed: 3 ms 
%http://www.energy.kth.se/compedu/webcompedu/Glossary/R/Rated_wind_speed.htm

%Rated Wind Speed: The minimun wind speed at which the wind turbine
%will generate its designated rated power.

clear, clc, close all
Ws=[1.7 2.2 2.6 3.2 3.6 3.9 4.5 5.0 5.6 6.3 6.9 7.7 8.6 9.8 10.9]; %Wind speed 
Wstd=std(Ws);                                                      
Vmean=mean(Ws);
k=(Wstd/Vmean)^(-1.086);
c=Vmean/gamma(1+(1/k));
Vrated=13.5;
Vin=3.8;
Vout=25;
Wprated=225;

%%% Weibull distribution %%%

%%% The available wind generator power (Wpout)%%%

if Vin<=Ws<=Vrated
    Wpout=Wprated*((Ws.^k)-(Vin.^k))/((Vin.^k)-(Vrated.^k));
else
    Wpout=Wprated;
end

A=Wprated*Vin^k/(Vrated^k-Vout^k);
B=Wprated/(Vrated^k-Vout^k);
syms x
f = @(x)(k/c)*(x/c)^k-1*exp(-(x/c)^k)

f1=(A+(B*Ws.^k))*f(x);
f2=Wprated*Ws;
    
Pwin=integral(f,Vin,Vrated)
% +int(f2,Vrated,Vout)

%