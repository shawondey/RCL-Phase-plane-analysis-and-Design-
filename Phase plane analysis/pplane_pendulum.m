clc
clear
close all 
warning off

g = 9.8;
l = 1;
Ts = linspace(-4,4,50);
[x1,x2] = meshgrid(Ts,Ts);
dx1= x2;
dx2= -(g/l)*sin(x1);
xdot1 = dx1./(sqrt((dx1).^2 + (dx2).^2));
xdot2 = dx2./(sqrt((dx1).^2 + (dx2).^2));
figure
quiver(x1,x2,xdot1,xdot2)
% quiver(x1,x2,dx1,dx2)
axis([-4 4 -4 4])
grid on
hold on

options = odeset('RelTol',1e-4,'AbsTol',[1e-5 1e-5]);

for i = -10:10
    [~,X] = ode45(@plane,[0 10],[i,i]',options);
    plot(X(:,1),X(:,2),'r')
    hold on
    [~,X] = ode45(@plane,[10 0],[i,i]',options);
    plot(X(:,1),X(:,2),'r')
    hold on
    [~,X] = ode45(@plane,[0 10],[-i,i]',options);
    plot(X(:,1),X(:,2),'r')
    hold on
    [~,X] = ode45(@plane,[10 0],[-i,i]',options);
    plot(X(:,1),X(:,2),'r')
    hold on
end

function [dx] = plane(t,x)
dx = zeros(2,1);
dx(1)= x(2);
dx(2)= -(9.8)*sin(x(1));
end
