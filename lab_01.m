% Draw the following: 
%  
% 1.	x(t) = 2 sin (2πt - π/2) for 0 ≤ t ≤ 4 
 
t=0:0.01:4;
x=2*sin(t.*(2*pi)-pi/2);
plot(t,x,'k')
title('x(t) = 2 sin (2\pit - \pi/2) for 0 \leq t \leq 4')
xlabel('t (ms)')
ylabel('x')

% 2.	Draw graphs of the functions y = cos(x) y = x  
% for 0 ≤ x ≤ 2 in the same window. Use the zoom facility to determine the point of intersection of the two curves (and, hence, the root of x = cos(x)) to two significant figures. 
x=0:0.01:2;
y=cos(x);
h=x;
plot(x,y,'b',x,h,'k')
xlabel('x-axis')
ylabel('y-axis')
title('Graph of y = cos(x) & y = x ')
legend('y=cos(x)','y=x')
zoom
grid

% 3.	Draw graphs of the functions for x =0:0.1:10 and label your graph properly. 
%  
% i.	y = sin(x)/x 
%  
% ii.	u = (1/(x-1)2)+x 
%  
% iii.	v = (x2+1)/(x2-4) 
%  
% iv.	z = ((10-x)1/3-1)/(4 - x2)1/2 
x=0:0.1:10;
y=sin(x)./x;
u=(1./((x-1).^2))+x;
v = ((x.^2)+1)./((x.^2)-4);
z = (((10-x).^1./3)-1)./((4 - x.^2).^1./2); 
subplot(2,2,1),plot(x,y,'k')
xlabel('x-axis')
ylabel('y-axis')
title('y = sin(x)/x')
subplot(2,2,2),plot(x,u,'k')
xlabel('x-axis')
ylabel('y-axis')
title('u = (1/(x-1)^2)+x')
subplot(2,2,3),plot(x,v,'k')
xlabel('x-axis')
ylabel('y-axis')
title('v = (x^2+1)/(x^2-4)')
subplot(2,2,4),plot(x,z,'k')
xlabel('x-axis')
ylabel('y-axis')
title('z = ((10-x)^1/3 -1)/(4 - x^2)^1/2')
 
