clc
clear all;
format long;
a = 0;
b = 1;
h = 0.02;
y0 = 0.5;%³õÖµ
x=a:h:b;
y(1,:) = realres(a, b, h, y0);
y(2,:) = forwardEuler(a, b, h, y0);
y(3,:) =  Runge_kutta4(a, b, h, y0);
e =y(3,:)-y(1,:);
% plot(x, y);
plot(x,y(1,:),'r');
hold on
plot(x,y(2,:),'g');
hold on
plot(x,y(3,:),'b');
