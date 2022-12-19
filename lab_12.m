% Task 1:
% Hints: Please for your own understanding think as if we are using a single pure tone as the message signal. Also try to implement the whole system as a single m file, this will help in attempting the Task 2 quickly.
% 
% (a): Generate a signal defined by the following equation, 
% y[n]=cos⁡[2πn]+0.5 cos⁡[4πn]+0.5cos⁡[8πn] 
% , and let it be your message signal. Plot and analyze both the time domain and frequency domain plots.
fs=10000;
n=0:01/fs:5
y =(cos(2*pi*n))+ (0.5*cos(4*pi*n))+ (0.5*cos(8*pi*n));    %message signal
L=length(n);
Y=(1/L)*fftshift(abs(fft(y)));
f=fs*(-L/2:L/2-1)/L;
subplot(221); 
plot(n,y);    %plotting in time domain
title('Signal in Time Domain'),
xlabel('Time/n');
ylabel('Amplitude/y')
subplot(222);
plot(f,Y)      %plotting magnitude in frequency domain
title('Amplitude of Signal in Frequency Domain'),
xlabel('Omega');
ylabel('Amplitude')
subplot(223);
plot(f,angle(z))   % Angle or phase in frequency domain
title('Angle of signal in frequency domain'),
xlabel('Omega');
ylabel('Angle')
% 
% Generate a cosine of 1000Hz and call it you carrier signal. Plot and analyze both the time domain and the frequency domain plots

fs=10000;
t=1/1000;
n=-5*t:1/fs:5*t;
y =(cos(2*1000*pi*n));    %carrier signal
L=length(n);
Y=(1/L)*fftshift(abs(fft(y)));
f=fs*(-L/2:L/2-1)/L;
subplot(221); 
plot(n,y);    %plotting in time domain
title('Signal in Time Domain'),
xlabel('Time/n');
ylabel('Amplitude/y')
subplot(222);
plot(f,Y)      %plotting magnitude in frequency domain
title('Amplitude of Signal in Frequency Domain'),
xlabel('Omega');
ylabel('Amplitude')

% 
% Now generate the signal that we will receive at the end of the transmitter system. Plot and analyze both the time and the frequency plots. This signal is the Amplitude modulated signal, carefully examine these plots. Try identifying the how the amplitude of the amplitude modulated signal varies with time.
% In this part we have modulated our signal over the cosine function having frequency of 1000Hz. The message signal behavior changes as the frequency of the sin changes and at last it look like as in the following figure
% 
% 
% 

fs=10000;
n=-5:1/fs:5;
x= cos(2*pi*1000*n);                   %carrier signal
y =cos(2*pi*n)+ 0.5*cos(4*pi*n)+ 0.5*cos(8*pi*n);    %message signal
m=y.*x;                             
L=length(m);
Y=(1/L)*fftshift(abs(fft(m)));
f=fs*(-L/2:L/2-1)/L;
subplot(221);
plot(n,y)
title('Original Signal in Time Domain'),
xlabel('Time/n');
ylabel('Amplitude/y')
subplot(222); 
plot(n,m);    %plotting in time domain
title('Modulted Signal in Time Domain'),
xlabel('Time/n');
ylabel('Amplitude/m')
subplot(223);
plot(f,Y)      %plotting magnitude in frequency domain
title('Amplitude of Modulated Signal in Frequency Domain'),
xlabel('Omega');
ylabel('Amplitude')

% 
% (d): Assuming we have a noise less channel we receive the signal generated in the previous part as the input to the receiver circuit. Generate the output signal by implementing the system given in the block diagram. Plot and analyze the output signal. A detailed answer is required focusing on what has actually happened here.   
% If we follow the exactly as the block diagram says the following figure is retrieved at the end which have some noise if we compared to the original, due to the high frequency components of the carrier signals. So we have to remove it by filtering through the lowpass filter which with cutoff frequency 1000Hz. 
% 
% 
fs=10000;
n=-5:1/fs:5;
x= cos(2*pi*1000*n);                   %carrier signal
y =cos(2*pi*n)+ 0.5*cos(4*pi*n)+ 0.5*cos(8*pi*n);    %message signal
m=y.*x;                             
L=length(m);
Y=(1/L)*fftshift(abs(fft(m)));
f=fs*(-L/2:L/2-1)/L;
rec=m.*x;
M=length(rec);
outsig=length(rec);
Z=(1/M)*fftshift(abs(fft(rec)));
f1=fs*(-M/2:M/2-1)/M;
 
figure(1)
subplot(221);
plot(n,y)
title('Original Signal in Time Domain'),
xlabel('Time/n');
ylabel('Amplitude/y')
subplot(222); 
plot(n,m);    %plotting in time domain
title('Modulted Signal in Time Domain'),
xlabel('Time/n');
ylabel('Amplitude/m')
subplot(223);
plot(f,Y)      %plotting magnitude in frequency domain
title('Amplitude of Modulated Signal in Frequency Domain'),
xlabel('Omega');
ylabel('Amplitude')
figure(2)
subplot(221)
plot(n,rec)
title('Signal At output Time Domain'),
xlabel('Time/n');
ylabel('Amplitude/y')
subplot(222)
plot(f1,Z)      %plotting magnitude in frequency domain
title('Amplitude of Modulated Signal in Frequency Domain'),
xlabel('Omega');
ylabel('Amplitude')
 

% 
% ): If you would have noticed that the output signal in the previous part was supposed to be the message signal, but it is quite different. Can you identify what operation (in terms of filtering) we need to perform to retrieve our original message signal? Explain how you arrived at your answer.
% We need to design a perfect low pass filter which will remove that noise. So I have designed the low pass filter by the FDA tool which has removed the extra noise as seen in the figure
% 
% 
fs=10000;
n=-5:1/fs:5;
x= cos(2*pi*1000*n);                   %carrier signal
y =cos(2*pi*n)+ 0.5*cos(4*pi*n)+ 0.5*cos(8*pi*n);    %message signal
m=y.*x;                             
L=length(m);
Y=(1/L)*fftshift(abs(fft(m)));
f=fs*(-L/2:L/2-1)/L;
rec=m.*x;
M=length(rec);
outsig=length(rec);
Z=(1/M)*fftshift(abs(fft(rec)));
f1=fs*(-M/2:M/2-1)/M;
lowpas=lowpass;
recovered=filter(lowpass,rec);
figure(1)
subplot(221);
plot(n,y)
title('Original Signal in Time Domain'),
xlabel('Time/n');
ylabel('Amplitude/y')
subplot(222); 
plot(n,m);    %plotting in time domain
title('Modulted Signal in Time Domain'),
xlabel('Time/n');
ylabel('Amplitude/m')
subplot(223);
plot(f,Y)      %plotting magnitude in frequency domain
title('Amplitude of Modulated Signal in Frequency Domain'),
xlabel('Omega');
ylabel('Amplitude')
figure(2)
subplot(221)
plot(n,rec)
title('Signal At output Time Domain'),
xlabel('Time/n');
ylabel('Amplitude/y')
subplot(222)
plot(f,Y)      %plotting magnitude in frequency domain
title('Amplitude of Recovered in Frequency Domain'),
xlabel('Omega');
ylabel('Amplitude')
subplot(223)
plot(n,recovered)
title('Signal At output after LPF filter'),
xlabel('Time/n');
ylabel('Amplitude/y')

lowpass filter designed by fda tool
function Hd = lowpass
%LOWPASS Returns a discrete-time filter object.
 
% MATLAB Code
% Generated by MATLAB(R) 9.10 and Signal Processing Toolbox 8.6.
% Generated on: 01-Jun-2021 22:15:31
 
% Butterworth Lowpass filter designed using FDESIGN.LOWPASS.
 
% All frequency values are in Hz.
Fs = 10000;  % Sampling Frequency
 
N  = 100;   % Order
Fc = 1000;  % Cutoff Frequency
 
% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass('N,F3dB', N, Fc, Fs);
Hd = design(h, 'butter');
 
% [EOF]












