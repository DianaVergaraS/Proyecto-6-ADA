clc; close all; clear all
figure
X=[(1:20);(1:20).^3];
[M,B,X_best,Y_best]=mincuadseg(X);
figure
scatter(X(1,:),X(2,:))
hold on
plot(X_best,Y_best)