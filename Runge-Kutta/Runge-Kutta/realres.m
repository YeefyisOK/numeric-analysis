function y = realres(a, b, h, y0)
    n = (b-a)/h;
    x0 = a;
    y(1) = y0;
    for i = 2:n+1
        x0 = x0 + h;        
        y(i)=0.5*exp(1)^(-50*x0)+x0^2;
    end
end