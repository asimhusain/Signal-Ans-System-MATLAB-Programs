% a)	Calculate the result of convolving x[n]= {1 2 1 2} with h[n]= {0 1 2 3 4 1 1}.
   n=1:4
n1=1:7
n3=1:10
x=[1 2 1 2]
h= [0 1 2 3 4 1 1]
y=convn(x,h)
subplot(3,1,1)
stem(n,x)
title('x[n]'),xlabel('n'),ylabel('x[n]')
subplot(3,1,2)
stem(n1,h)
title('x[n]'),xlabel('n'),ylabel('x[n]')
subplot(3,1,3)
stem(n3,y)
title('x[n]'),xlabel('n'),ylabel('y[n]')

% b)	Calculate the result of convolving x[n]= {1 2 1 2} with h[n]= {0 1 2 3 4 1 1}.
n=-1:2
n1=-1:5
n3=-1:8
x=[1 2 1 2]%defining input signal
h= [0 1 2 3 4 1 1]%defining impulse response
y=convn(x,h)%calculating convolution using inbuilt function
subplot(3,1,1)
stem(n,x)%for plotting discrete function
title('x[n]'),xlabel('n'),ylabel('x[n]')%for indentation
subplot(3,1,2)
stem(n1,h)
title('h[n]'),xlabel('n'),ylabel('x[n]')
subplot(3,1,3)
stem(n3,y)
title('y[n]'),xlabel('n'),ylabel('y[n]')

% c)	Calculate the result of convolving x[n]= {-1 0 1} with h[n]= {1 2 1}.
% 
% 

  n=1:3
n1=-1:1
n3=-1:3
x=[-1 0 1]
h= [1 2 1]
y=convn(x,h)
subplot(3,1,1)
stem(n,x)
title('x[n]'),xlabel('n'),ylabel('x[n]')
subplot(3,1,2)
stem(n1,h)
title('h[n]'),xlabel('n'),ylabel(' h[n]')
subplot(3,1,3)
stem(n3,y)
title('y[n]'),xlabel('n'),ylabel('y[n]')
% Given the following two sequences:
% x[n]= {1,2,1,2} h[n]= {0,1,2,3,4,1,1} Where _ indicates the zero position.
% a)	Write a Matlab function ‘my_conv’ that will convolve the signal x[n] with the system impulse response h[n] and produce the output y[n]. Plot the output y[n] on a graph with correct axis.
% 

function f = my_conv(x,h) %function decleration
    x=[1 2 1 2] %inputs
    h=[0 1 2 3 4]
    n=h; 
     
    length_x=length(x); %length of x
    length_h=length(h); %length of h
    if length_x>length_h %checking conditiion
    n=[n zeros(1,length_x-length_h)]; 
    else 
    x=[x zeros(1,length_h-length_x)]; 
    end 
    f=zeros(1,length_x+length_h-1); % function call
    x=fliplr(x); %flipping x for convolution
    for i=1:length(f) 
    if i<=length(x) 
    f(i)=sum(x(1,length(x)-i+1:length(x)).*n(1,1:i)); 
    else 
    j=i-length(x); 
    f(i)=sum(x(1,1:length(x)-j).*n(1,j+1:length(n))); 
end 
    end 
    figure 
stem(f);%for plotting discrete function
     
    end  
% b)	Compare your result with built in function of Matlab ‘conv’.
x=[1 2 1 2] %inputs
h=[0 1 2 3 4]
c=conv(x,h)
stem(c)

% c)	If x[n] starts from -1 and h[n] starts from -2 then what will be the result of convolution using ‘my_conv’ and ‘conv’? Is the result of ‘my_conv’ similar to the result you get on paper? If not, how will you get the correct result with respect to position of signal values. (Note: You have to make time vector to obtain correct plotting on Matlab).

function [y, n] = my_conv(x,h)
    x=[1 2 1 2] %inputs
    h=[0 1 2 3 4]
input_x = input('starting point of x: '); 
input_h = input('starting point of h: ');
sum_in = input_x + input_h;
h_flipped = flip(h);%fliping h[n]
n_actual=sum_in:((length(x) + length(h) - 1)+sum_in-1);
x_o = (length(x) + length(h) - 1) - length(x);
flip_h_o = (length(x) + length(h) - 1) - length(h_flipped);
x_temp = horzcat(zeros(1, x_o), x);
h_temp = horzcat(h_flipped, zeros(1,flip_h_o));
temp = 0;
y = zeros(1,(length(x) + length(h) - 1));
 
for i=1:(length(x) + length(h) - 1)
    if(i == 1)
        temp = x_temp.*h_temp;
        y(i)=sum(temp);
    else 
        h_temp = circshift(h_temp, [0 1]);
        temp = x_temp.*h_temp;
        y(i)=sum(temp);
    end 
end 
disp(y)
stem(n_actual,y)
% d) Convolution of x[n]={-1 0 1} with h[n]={1 2 1} results in y[n] ={-1 -2 0 2 1}. Verify this by using the function ‘my_conv’
function f = my_conv(x,h) %function decleration
x=[-1 0 1] %inputs
h=[1 2 1]
n=h; 
 
length_x=length(x); %length of x
length_h=length(h); %length of h
if length_x>length_h %checking conditiion
n=[n zeros(1,length_x-length_h)]; 
else 
x=[x zeros(1,length_h-length_x)]; 
end 
f=zeros(1,length_x+length_h-1); % function call
x=fliplr(x); %flipping x for convolution
for i=1:length(f) 
if i<=length(x) 
f(i)=sum(x(1,length(x)-i+1:length(x)).*n(1,1:i)); 
else 
j=i-length(x); 
f(i)=sum(x(1,1:length(x)-j).*n(1,j+1:length(n))); 
end 
end 
figure 
stem(f);%for plotting discrete function
 
end







