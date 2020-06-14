h = 0.01;  x = 0:h:1; y = x; y(1)=0.5;%参数初值
for n = 1:length(x)-1 
       k1 = f1(x(n),y(n));
 
       k2 = f1(x(n)+h/2,y(n)+h/2*k1);
 
       k3 = f1(x(n)+h/2,y(n)+h/2*k2);
 
       k4 = f1(x(n)+h,y(n)+h*k3);       
       y(n+1) = y(n)+h/6*(k1+2*k2+2*k3+k4);%四级四阶Runge-Kutta公式
 
end
 
plot(x,y,'.',x,0.5*exp(-50*x)+x.^2,'r-.d')
legend('data3','data2','Location','northwest')  
hold on;
 
y=[]
t=0.5
   for(s=0:0.02:1)
       t=t+0.02*(-50*t+50*s^2+2*s);
     y=[y,t]   
   end
y=[0.5,y(1:50)]   
plot(x,y,'b')   
