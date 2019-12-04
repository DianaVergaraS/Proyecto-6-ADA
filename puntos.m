clc; close all; clear all
x1=10-(1:10)*0.6; y1=(1:10);
x2=(1:10)+4; y2=(11:20);
x3=(ones(10,1)*15)'; y3=(21:30);
x=[x1, x2, x3];
% Para añadir ruido blanco (SNR)
x=awgn(x,1);
y=[y1, y2, y3];
scatter(y,x)
X=[y;x];
%X_seg=[y;x]
clear x1 x2 x3 y1 y2 y3
[M,B,X_best,Y_best]=mincuadseg(X);
figure
scatter(X(1,:),X(2,:))
hold on
plot(X_best,Y_best)