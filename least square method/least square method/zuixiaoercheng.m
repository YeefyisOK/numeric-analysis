x=[19 25 31 38 44];
y=[19 32.3 49 73.3 97.8];

%最小二乘法
m=4;
n=2;
mi=0:5:45;
[A,B]=generate_A_B(m,n,x,y);
A
B
M=zeros(2)
N=[0 1]
N(1)=B(1);
N(2)=B(3);
M(1,1)=A(1,1);%取13行13列赋值矩阵
M(1,2)=A(1,3);
M(2,1)=A(3,1);
M(2,2)=A(3,3);
a=inv(M)*N'
temp=[1 0 1]
temp(1)=a(2);
temp(3)=a(1);%高次项在前面
ni=polyval(temp,mi)
figure(1)
plot(mi,ni,x,y,'r*')

%一次拟合
xi=0:5:45;
Q=polyfit(x,y,1)
yi=polyval(Q,xi)
figure(2)
plot(xi,yi,x,y,'r*')

%二次拟合
ai=0:5:45;
P=polyfit(x,y,2)
bi=polyval(P,ai)
figure(3)
plot(ai,bi,x,y,'r*')