function [R]=SOR_iterative(A,b,fid,w)
    fprintf(fid,'\n********��w=%dʱ��SOR����������Է������������********\n',w);
    [P,L,U]=LU(A)
    % for i=1:n-1
    %     if(i==0)
    %         y
    x2 = U\(L\P*b)%��ֵ
    x2=P*x2;
    x2=x2'
    R=zeros(10,4)
% ��SOR����������Է�����,����A�Ƿ���
    x0=zeros(1,length(b)); % ����ֵ
    tol=5*10^(-6); % ��������
    N=1000;  % ��������������
    [n,n]=size(A); % ȷ������A�Ľ�
%     w=1.1; % �����ɳ�����
    k=1;
    % ��������
    y=zeros(1,n);       
    while k<=N
       x(1)=(1-w)*x0(1)+w*((b(1)-A(1,2:n)*x0(2:n)')/A(1,1));%��ֵ x0��ֵ
       for i=2:n
           x(i)=(1-w)*x0(i)+w*(b(i)-A(i,1:i-1)*x(1:i-1)'-A(i,i+1:n)*x0(i+1:n)')/A(i,i);
       end
       fprintf(fid, '%d', k);
       R(k,1)=k;
       R(k,[2 3 4])=x;
 
       fprintf(fid, ' %16.14f\n', x);
       if norm(x-x2,inf) <=tol%max(abs(x-x2))
           fprintf(fid,'��������: %d�� \n',k);
           fprintf(fid,'x��ֵ\n');
           fprintf(fid, '%16.14f\n', x);
           break;
       end
       k=k+1;
       x0=x;
    end
    if k==N+1
     fprintf(fid,'\n********��SOR����������Է������������********\n');
     fprintf(fid,'��������: %d��\n',k);
     fprintf(fid,'�������������������ʧ�ܣ�');
    end
end