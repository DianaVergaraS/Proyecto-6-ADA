function [m,b]=mincuadlin(X)
n=length(X(1,:));
A=0; B=0; C=0; D=0;

for i=1:n;
    A=A+X(1,i); % Sumatoria de x
    B=B+X(2,i); % Sumatoria de y
    C=C+(X(1,i))^2; % Sumatoria de x^2
    D=D+X(1,i)*X(2,i); % Sumatoria de x*y
end 

m=(n*D-A*B)/(n*C-A^2);
b=(C*B-D*A)/(n*C-A^2); 
x=X(1,1):1:X(1,n);
y=m*x+b;
hold on
plot(x,y,'r','LineWidth',0.5);
hold off
% title('Aproximación lineal por mínimos cuadrados.'); 