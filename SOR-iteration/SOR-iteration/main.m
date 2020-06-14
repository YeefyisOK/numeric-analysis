format long
A=[[4 -1 0]
    [-1 4 -1]
    [0 -1 4]]
b=[1 
   4
   -3]
% A=[[10 -1 2 0]
%     [-1 11 -1 3]
%     [2 -1 10 -1]
%     [0 3 -1 8]]
% b=[6 
%    25
%    -11
%    15]
fid = fopen('SOR_iter_result.txt', 'wt');
R1=SOR_iterative(A,b,fid,1);
R2=SOR_iterative(A,b,fid,1.03);
R3=SOR_iterative(A,b,fid,1.1);
R1
R=zeros(30,4);
R(1:10,:)=R1;
R(11:20,:)=R2;
R(21:30,:)=R3;
xlswrite('result.xls',R); 


fclose(fid);