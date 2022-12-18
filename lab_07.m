% Write a function that will generate a single sinusoid x(t)= A sin⁡〖(wt)〗. A=3 and time period T =.01. Choose an appropriate value of ‘time_increment/sampling time’ during the generation of signal.
% T=0:time_increment:T
function []=Sin(N,T)
t=0:1/N:T;
A=3;
w=(2*pi)/T;
for k=1:length(t)
    x(1,k)=A*sin(w*t(1,k));
end
plot(t,x);
% Determine the Fourier series coefficients and plot the magnitude and phase of the fourier series coefficients. 
% 	
% NOTE:
% 	For calculating the fourier series coefficients use (1). 
% 	Note that (1) involves solving an integration. Use MATLAB built in function integral() to numerically evaluate the integral. For example, for a value of k=4, the function will be evaluated as 
% a = integral(@(z)  A*sin⁡((2*pi/T)*z).*exp(-j*4*(2*pi/T)*z)/T,0,T)
% 	Above code will return the value of the 4th CTFS coefficient. For remaining coefficients, replace 4 and follow similar procedure. You may use a loop to iterate over values of k.
% 	Add the figures of both the time domain and frequency domain representation of the singals with appropriate axes, labels and titles.
function y=Sin(N,T)
    A=3
t1=0:1/N:T;
x_1=A*sin(2*pi*t1/T);
subplot(4,1,1);
plot(t1,x_1)
title('Original sine wave');
xlabel('time axis')
ylabel('signal value') 
 
for k=-4:4
    k=k+1
func=@(t)A*sin(2*pi*t/T).*exp(-1j*k*2*pi*t/T);
a1(k+4)=integral(func,0,10);
end
 
k=-4:4;
hold on;
subplot(4,1,2)
stem(k,abs(a1))
title('Magnitude-Frequency Plot')
xlabel('frequency')
ylabel('magnitude')
 
subplot(4,1,3)
stem(k,phase(a1))
title('Phase-Frequency Plot')
xlabel('frequency')
ylabel('phase')
 
size=length(t1)
 
for k=-4:4
    k=k+1
    x_1=x_1+a1(k+4)*exp(1j*k*2*pi*t1)  
end
subplot(4,1,4)
stem(t1,x_1)
title('Generated Signal')
xlabel('time axis')
ylabel('signal value')
 

% Assume a rectangular wave as shown below. Using a similar approach outlined in the previous task, obtain the CTFS representation of the rectangular wave. Plot the magnitude and phase of the fourier series coefficients with appropriate axes, labels and titles.
% 
% 
% 
% 
% 
% 
% Value of N and T used in this task are 100 and 5 respectively
function y= squrae(N,T)
A=3
t_1=0:1/N:T;
y_1=A*square((2*pi/T)*t_1);
subplot(4,1,1)
plot(t_1,y_1)
title('Original Square Wave');
xlabel('time axis')
ylabel('signal value')
 
a1=zeros(9);
for k=-4:4
func=@(t)square(2*pi*0.5*t).*exp(-1j*k*2*pi*t/0.5);
a1(k+5)=integral(func,0,10);
end
 
k=-4:4;
hold on;
subplot(4,1,2)
stem(k,abs(a1))
title('Magnitude-Frequency Plot')
xlabel('frequency')
ylabel('magnitude')
 
subplot(4,1,3) 
stem(k,angle(a1))
title('Phase-Frequency Plot')
xlabel('frequency')
ylabel('phase')
 
size=length(t_1)
 
for k=-4:4
    k=k+1
    y_1=y_1+a1(k+4)*exp(1j*k*2*pi*t_1/0.5)  
end
subplot(4,1,4)
stem(t_1,y_1)
title('Generated Signal')
xlabel('time axis')
ylabel('signal value')
 
 
% MATLAB contains efficient routines for computing CTFS and DTFS. If x is an N-point vector for the period 0 ≤ n ≤ N - 1, then the DTFS of x[n]can be computed by ak=(l/N)*fft(x), where the N-point vector a contains ak for 0 ≤ k ≤ N - 1. The function fft is simply an efficient implementation of (2) scaled by N. Thus, DTFS can by computed by typing ak=(l/N)*fft(x). The function will return both real and imaginary parts of the DTFS coefficients. 
% 
% Given a vector containing the DTFS coefficients ak for 0 ≤ k ≤ N - 1, the function ifft can be used to construct a vector x containing x[n] for 0 ≤ n ≤ N – 1 as x=N*ifft (a). The function ifft is an efficient realization of the DTFS synthesis equation, scaled by 1/N.
% 
% •	Choose an appropriate value of ‘time_increment’ during the generation of cosine function.
% for n=0:time_increment:T
% 			%Generate Cosine Wave
% •	% Hint for calculating the fourier series and displaying its real part
% L=length(signal);
% y=real(fft(signal,L))/L;
% stem(y);

T=10;
A= 3;
n=0:1:T
y=A*cos(2*pi*n/T)
subplot(211)
stem(y)
title('cosine wave')%generating cosine wave
xlabel('n')
ylabel('y')
L=length(y)
y1=real(fft(y,L))/L%for fourier series co efficients
subplot(2 ,1,2)
stem(y1)
title('real part of fourier series')
xlabel('n')
ylabel('y1')

% Using the function ‘ifft’ and knowledge of FS coefficents of a Cosine waveform determine the signal x[n]. For the lab report plot both the fourier coefficients and time domain signal. 
% 
% Now assuming that the DTFT was N Point DTFT or FFT. Then the fourier Series Coefficients of x[n] = cos (pi/4) n will have impulses at locations k and N-k. 
% 
% ωk = 2 pi k /N   If ωk = pi/4 Then k = N/8 Where N is the N point DTFT or FFT. Assuming that N =1024 locations k and N-k can be calculated. So the coeff_array will be an array of size N with fourier series coefficients of a cosine waveform at locations k and N-k.
% 
% %HINT
% y=ifft(coeff_array,N); %N is number of points in the Inverse FFT 
% stem(real(N*y));

T=10;
w=2*pi/T
t_1=0:1:10;
x_1=3*sin(w*t_1);
hold on
subplot(3,1,1)
stem(t_1,x_1);
title('Original Signal')
xlabel('time axis')
ylabel('signal value')
 
l=length(x_1);
y_1=(1/l)*fft(x_1,l);
z_1=l.*(ifft(y_1,l));
fav=(-l/2:l/2-1)/l;
 
subplot(3,1,2)
stem(fav,fftshift(y_1))
title('Fourier Cofficients')
xlabel('k')
ylabel('weights')
 
subplot(3,1,3)
stem(t_1,z_1)
title('Generated Signal')
xlabel('time axis')
ylabel('signal value')



 








