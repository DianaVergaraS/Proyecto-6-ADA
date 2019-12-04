function [M,B,X_best,Y_best]=mincuadseg(X)
X_seg=X; X_best=[]; Y_best=[];
count=1;
while isempty(X_seg)==0 && length(X_seg)>2
        %err_max=3;
        n=length(X_seg);
        M_lin=zeros; B_lin=zeros; Err=zeros;
        
        for i=1:n
            if i<n
                [M_lin(i),B_lin(i)]=mincuadlin(X_seg(:,(i:n)));
                x=X_seg(1,(i:n));
                y=M_lin(i)*x+B_lin(i);
                E=0;
                e=zeros(1,n-i);
                for k=1:length(x)
                    e(1,k)=y(1,k)-X_seg(1,k);
                    E=E+e(1,k)^2;
                end
                Err(n-i)=sqrt(E/length(y)); % Error cuadrático medio
            end
        end
        
        %err=min(abs(Err));
        index_err=find(Err==min(Err));

        M(count)=M_lin(index_err);
        B(count)=B_lin(index_err);
        x_best=index_err:length(X_seg);
        X_best=[x_best,X_best];
        y_best=M(count)*x_best+B(count);
        Y_best=[y_best,Y_best];
         hold on
         plot(X_best,Y_best,'k','LineWidth',2);
        X_seg(:,index_err:n)=[];
        count=count+1;
end
hold on
plot(X_best,Y_best,'k','LineWidth',2);

%     [m,b]=mincuadlin(X_seg);
%     hold on
%     x_best=1:length(X_seg);
%     y_best=m*x+b;
%     plot(x_best,y_best,'k');
%     X_seg(:,index_err:n)=[];
%end