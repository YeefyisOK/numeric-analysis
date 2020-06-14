function[P1,L1,U1] = LU(A)
m=size(A,1);
n=size(A,2);
%if(m~=n)    
U=A;
L=zeros(n);
P=eye(n);
for j=1:n-1
    for i=j+1:n
        if(U(j,j)~=0)
            L(i,j)=U(i,j)/U(j,j);
            U(i,:)=U(i,:)-U(j,:)*U(i,j)/U(j,j);
        else
            a=j+1;
            while( U(a,j)==0&&(a<n) ) %向下找到不为0的主元
                a=a+1;
            end;
            temp=U(j,:);
            U(j,:)=U(a,:);
            U(a,:)=temp;%U矩阵交换
            m=L(j,:);
            L(j,:)=L(a,:);
            L(a,:)=m;%L矩阵交换
            temp3=P(j,:);
            P(j,:)=P(a,:);
            P(a,:)=temp3;%P矩阵交换
            L(i,j)=U(i,j)/U(j,j);
            U(i,:)=U(i,:)-U(j,:)*U(i,j)/U(j,j);
        end;
    end;
end;
for i=1:n
    L(i,i)=1;
end
L1=L;
U1=U;
P1=P;
end