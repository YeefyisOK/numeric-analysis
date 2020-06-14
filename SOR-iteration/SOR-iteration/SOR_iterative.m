function [R]=SOR_iterative(A,b,fid,w)
    fprintf(fid,'\n********当w=%d时用SOR迭代求解线性方程组的输出结果********\n',w);
    [P,L,U]=LU(A)
    % for i=1:n-1
    %     if(i==0)
    %         y
    x2 = U\(L\P*b)%真值
    x2=P*x2;
    x2=x2'
    R=zeros(10,4)
% 用SOR迭代求解线性方程组,矩阵A是方阵
    x0=zeros(1,length(b)); % 赋初值
    tol=5*10^(-6); % 给定误差界
    N=1000;  % 给定最大迭代次数
    [n,n]=size(A); % 确定矩阵A的阶
%     w=1.1; % 给定松弛因子
    k=1;
    % 迭代过程
    y=zeros(1,n);       
    while k<=N
       x(1)=(1-w)*x0(1)+w*((b(1)-A(1,2:n)*x0(2:n)')/A(1,1));%新值 x0旧值
       for i=2:n
           x(i)=(1-w)*x0(i)+w*(b(i)-A(i,1:i-1)*x(1:i-1)'-A(i,i+1:n)*x0(i+1:n)')/A(i,i);
       end
       fprintf(fid, '%d', k);
       R(k,1)=k;
       R(k,[2 3 4])=x;
 
       fprintf(fid, ' %16.14f\n', x);
       if norm(x-x2,inf) <=tol%max(abs(x-x2))
           fprintf(fid,'迭代次数: %d次 \n',k);
           fprintf(fid,'x的值\n');
           fprintf(fid, '%16.14f\n', x);
           break;
       end
       k=k+1;
       x0=x;
    end
    if k==N+1
     fprintf(fid,'\n********用SOR迭代求解线性方程组的输出结果********\n');
     fprintf(fid,'迭代次数: %d次\n',k);
     fprintf(fid,'超过最大迭代次数，求解失败！');
    end
end