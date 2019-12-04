clc; close all; clear all
x1=(1:10)*0.6; y1=(1:10);
x2=(1:10)+6; y2=(11:20);
x3=(ones(10,1)*16)'; y3=(21:30);
x4=(1:10)*-2+15; y4=(31:40);
x5=(1:10)-5; y5=(41:50);
x=[x1, x2, x3, x4, x5];
% Para añadir ruido blanco (SNR)
x=awgn(x,9);
y=[y1, y2, y3, y4, y5];
scatter(y,x)
X=[y;x];
clear x1 x2 x3 x4 x5 y1 y2 y3 y4 y5
[M,B,X_best,Y_best]=mincuadseg2(X);
figure
scatter(X(1,:),X(2,:))
hold on
plot(X_best,Y_best)