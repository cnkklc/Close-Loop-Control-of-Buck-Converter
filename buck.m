clear all;
close all;
clc;
% Cenk KILIÇ
%Parameters - 1
Vin=48;
Vo=12;
R=10;
fs=30e3;
D1=Vo/Vin;
D2=1-D1;
Lmin=(D2*R)/(2*fs);
L=1.25*Lmin;
Ripple=0.01;
Cmin=D2/(8*L*Ripple*fs*fs);
%Parameters - 2 
Ls=160e-6;
Cs=70e-6;
Vref=3;
H=Vref/Vo;
Vm=5;
Gc=1;
%Tranfer Function
s=tf('s');
Gd0=Vo/D1
w0=1/(sqrt(Ls*Cs))
Q=R*(sqrt(Cs/Ls))
Gvd=Gd0*((1))/(1+(s/(Q*w0))+(s/w0)^2)
%Loop Gain
T=(Gc*H*Gvd)/Vm
figure(1)
margin(T)
%Bode 
fc=2.76e3;
Vc=0.139;
pm=180-173;
%Phase Lead
teta=(pm+52)*(pi/180);
fz=fc*(sqrt((1-sin(teta))/(1+sin(teta))))
fp=fc*(sqrt((1+sin(teta))/(1-sin(teta))))
Glead0=(sqrt(fz/fp))/(10^(Vc/20))
Glead=((1+(s/(2*pi*fz)))/(1+(s/(2*pi*fp))))
%Phase Lag
fl=fc/10
Glag=1+((2*pi*fl)/s)
