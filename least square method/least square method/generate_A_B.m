function [A,B]=generate_A_B(m,n,x,y)
    %Éú³ÉA£¬B¾ØÕó    
    A=zeros(n+1);
    n
    m
    for j=1:n+1
        for i =1:n+1
            for k=1:m+1              
                A(j,i)=A(j,i)+x(k)^(j+i-2);
            end
        end
    end;
    B=zeros(1,n+1);
    for j=1:n+1
        for i =1:m+1
            B(j)=B(j)+y(i)*x(i)^(j-1);
        end
    end
end

