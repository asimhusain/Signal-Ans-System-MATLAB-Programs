% Generate a signal as sum of two sinusoidal of frequency f_1=400Hz and f_2=800Hz.
% Use fft() function to find the Fourier transform. Show your results. You have to make two plots of the coefficients against frequency axis. One plot should be against frequency in radians. Other plot should be against frequency in Hz. You also need to use function fftshift(). See MATLAB help for details.
function [y]=mysin(f1,f2)
f1= 400;
f2= 800;
Fs=10000;
t=-0.1:1/Fs:0.1;
x = cos(2*pi*f1*t)+sin(2*pi*f2*t);
L=length(t);
Y = fftshift(fft(x)/L);
Magnitude = abs(Y);
fVals = Fs*(-L/2:L/2-1)/L;
subplot(311);
plot(t,x);
title ('Original-Signal');
xlabel('t-axis');
ylabel('amplitude');
subplot(312);
plot(fVals,Magnitude);
title('Single-sided Amplitude spectrum of x');
xlabel('f in (Hz)');
ylabel('Magnitude (f)');
subplot(313);
plot(2*pi*fVals,Magnitude);
title('Single-sided Amplitude spectrum of x');
xlabel('f in (Radians)');
ylabel('Magnitude (f)');
% Calculate Fourier transform of e^(-at)  u(t).Plot the original signal, magnitude and phase of its Fourier transform. You have to make two plots of the coefficients against frequency axis. One plot should be against frequency in radians. Other plot should be against frequency in Hz. You also need to use function fftshift(). See MATLAB help for details.
% NOTE: Phase function was not working for calculating angle in my MATLAB that’s why I used angle function which produces following result.

Fs=1000;
a = .5;
t=-5:1/Fs:5
NFFT=length(t);
fvalue= Fs*(-NFFT/2:NFFT/2-1)/NFFT
fvalue1=2*pi*fvalue
y=exp(-a*t).*heaviside(t);%given signal for a=2
plot(y)
y1=fft(y)
y2=fftshift(y1/l)%calulating  center shifted fourier transform
subplot(2,3,1)
plot(t,y)%original signal plot
title('Original signal')
xlabel('t')
ylabel('e^-at')
subplot(2,3,2)
plot(fvalue,abs(y2))
title(' Magnitude plot of CFT  vs f in hz')
xlabel('f')
ylabel('|y(jw)|')
subplot(2,3,3)
plot(fvalue1,abs(y2))% magitude plot against frequency in radians
title(' Magnitude plot of CFT  vs f in radians')
xlabel('w')
ylabel('|y(jw)|')
subplot(2,3,4)
plot(fvalue,angle(y2))%phase plot against frequency in hz
title(' Phase plot of CFT  vs f in hz')
xlabel('f')
ylabel('<y(jw)')
subplot(2,3,5)
plot(fvalue1,angle(y2))%phase plot against frequency in radians
title(' Phase plot of CFT  vs f in radians')
xlabel('w')
ylabel('<y(jw)')
%  
% Convolve the signals x_1 (t)=e^at u(t) and x_2 (t)=sin⁡(t)u(t) for 100 samples. Verify that “convolution in time domain equals multiplication in frequency domain.” 
% 
Fs=100;
T=1/Fs;
t = -10:T:10;
w=2*pi/T;
x1= exp(1*t).*heaviside(t);
x2= sin(t).*heaviside(t);
subplot(511);
plot(t,x1);
title('Graph of Exponential function');
xlabel('t');
ylabel('X1(t)');
subplot(512);
plot(t,x2);
title('Graph of Sinusoidal function');
xlabel('t');
ylabel('X2(t)');
Y1=fft(x1);
Y2= fft(x2);
Y= Y1.*Y2;
Z=ifft(Y);
subplot(513);
plot(Z);
axis([0 2000 -1800000 1800000]);
title(' Graph using Inverse Fourier transform');
xlabel('t');
ylabel('Z');
U= conv(x1,x2);
subplot(514);
plot(fftshift(U));
axis([0 2000 -1800000 1800000]);
title(' Graph using Convolution property');
xlabel('t');
ylabel('U');
























