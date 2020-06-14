function [y]=Runge_kutta4(a,b,h,y0)
    x=a:h:b
    y(1)=y0;
    n=(b-a)/h;
    for i=2:n+1
        K(1)=f1(x(i-1),y(i-1));
        K(2)=f1(x(i-1)+h/2,y(i-1)+K(1,1)*h/2);
        K(3)=f1(x(i-1)+h/2,y(i-1)+K(1,2)*h/2);
        K(4)=f1(x(i-1)+h,y(i-1)+K(1,3)*h);
        y(i)=y(i-1)+h/6*(K(1)+2*K(2)+2*K(3)+K(4));
    end
end
