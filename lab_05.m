% a.	Verify that the system y[n] = sin ((π/2)x[n]) is not linear. Use signal x1[n] = δ[n] and x2[n] = 2δ[n] to demonstrate if the system violates linearity
n=-10:10;%for setting the range
x1 = (n==0);%defining impulse function
x2=2.*x1;
y1 = sin ((pi/2).*x1); 
y2 = sin ((pi/2).*x2);
x3=2.*x1+3.*x2;%adding input signal and multiplying with random constants
y3 = sin ((pi/2).*x3);
y4=2.*y1+3.*y2;%adding output signal and multiplying with with random constants
subplot(2,2,1)
stem(n,y1)%stem is used for plotting discrete functions
title('graph of sin ((pi/2)*x1)'),xlabel('n'),ylabel('y1')
subplot(2,2,2)
stem(n,y2)
title('graph of sin ((pi/2)*x2)'),xlabel('n'),ylabel('y2')
subplot(2,2,3)
stem(n,y3)
title('graph of sin ((pi/2)*x3)'),xlabel('n'),ylabel('y3')
subplot(2,2,4)
stem(n,y4)
title('graph of y4'),xlabel('n'),ylabel('y4')
% 
% b.	Verify if the following system y[n] = x[n] + x[n+1] is not causal. Use the signal x[n]=u[n] to deomstrate this. Define vectors x and y to represent the input on the interval -5 ≤ n ≤ 9 and output on the interval -5 ≤ n ≤ 8
% 
n=-5:1:9;
x1=[zeros(1,5),ones(1,10)]; %unit step function x[n]
x2=[zeros(1,4),ones(1,11)]; %unit step function x[n+1]
x3=x1+x2; %adding both function to get y[n] = x[n] + x[n+1] 
subplot(3,1,1)
stem(n,x1)
title('Grapgh of x[n]')
xlim([-5,9])
subplot(3,1,2)
stem(n,x2)
title('Grapgh of x[n+1]')
xlim([-5,9])
subplot(3,1,3)
stem(n,x3)
title('Grapgh of y[n]')
xlim([-5,8])
% c.	Verify if the following system y[n] = x[2n] is time variant or invariant? Use a signal of your choice
% 

n=-5:1:9;
x=[zeros(1,5),ones(1,10)]%given unit step signal x[n]
y1=[2.*n];
y2=[2.*n+4]; %shifted input signal by four units
y3=[2.*(n+4)]; %shifted output signal by four units
 
subplot(3,1,1)
stem(y1,x)
title('x[n]')
 
 
subplot(3,1,2)
stem(y2,x)
title('Shifted input signal')
 
subplot(3,1,3)
stem(y3,x)
title('Shifted output signal ')
%  
% d.	Given the signals x[n] = [1 2 3 4 5] and y[n] = [1 1 1 1 1], verify using ‘conv or convn’ function that commutative property holds. 
% 
x = [1 2 3 4 5];
y = [1 1 1 1 1];
conv1=conv(x,y);
conv2=conv(y,x);
subplot(2,1,1)
stem(conv1)
subplot(2,1,2)
stem(conv2)
% e.	Assume a 2-D signal (i.e., some image). Load image and assume it to be signal x. Next assume that instead of having a 2-D filter you have two one D filters h1[n] =[0.25 0.5 0.25] and h2[n]=[0.25;0.5;0.25]. Assume that the convolution (h1[n]* h2[n]) = h3[n] = [0.0625 0.125 0.0625; 0.125 0.25 0.125; 0.0625 0.125 0.0625].  Using this information and output at each stage verify that Associative property holds.
% Image used for convolution:
x=imread('C:\Users\Asim Hussain\Desktop\images.png');%Loading image from desktop
h1=[0.25 0.5 0.25];
h2=[0.25;0.5;0.25];
h5=convn(h1,h2);%Covolving Given Signals
h6=convn(x,h1);%Covolving Given Signal h1 with image
h7=convn(h2,h6);%Covolving Given Signal h2 with result of convolution of image and h1
h8=convn(h5,x);%Covolving Image with result of convolution of h2 and h1
subplot(2,2,1)
imshow(h7)
title('(x[n]*h1[n])*h2[n]')
subplot(2,2,2)
imshow(h8)
title('x[n]*(h1[n]*h2[n])')
if(h7==h8)
    disp('Associative Law holds' )
end





















