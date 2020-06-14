function y = forwardEuler(a, b, h, y0)
    n = (b-a)/h;
    x0 = a;
    y(1) = y0;
    for i = 2:n+1
        x0 = x0 + h;
        f0 = -50*y0+50*x0^2+2*x0;
        y0 = y0 + h*f0;
        y(i) = y0;
    end
end