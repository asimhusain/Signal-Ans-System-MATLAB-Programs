% Fourier series of a Discrete Time (DT) Sinusoid 
% Write a function that will generate a single Discrete Time (DT) sinusoid x[n]= A sin⁡〖[wn]〗= A sin⁡[2π f/F_s  n]. A=3, f=500Hz and sampling frequency F_s  =8000Hz. 
% 
% Detemine the period, N, of this sinusoid? Determine the DT Fourier series coefficients and plot the magnitude and phase of the DT Fourier series coefficients. 
% 	
% 	For calculating the DT Fourier series coefficients use (2). 
% 	(2) will return the value of the kth DTFS coefficient. For remaining coefficients, you may use a loop to iterate over values of k. What will be the range of k?
% Ans: K can be any consecutive of length time period, for me it is from -7 to 8.
% 
% 	You have to make two plots of the coefficients against frequency axis instead of k 
% 	One plot should be against frequency in radians. Other plot should be against frequency in Hz.
% NOTE: I used the single code to implement both frequencies i-e RADIAN and Hz
% 	k-th coefficient corresponds to frequency 2π/N k. Determine the range in radians of the distinct frequency components?
% ANS: 0 TO 15*pi/8
% 	What is relation between frequency in Hz and frequency in radians? 
% Ans:w=2*pi*f
% 
% 	Also show the periodicity of the DTFS coefficients while plotting. 
% Add the figures of both the time domain and frequency domain representation of the signals with appropriate axes, labels and titles

function[yn]=DT_sinusoid(A,f,Fs)%function decleration
f=500
Fs=8000
A=3
n1=0:45
w=(2*pi*f)/Fs %setting the value of  frequency
N=2*pi/w
yn=A*sin(w*n1)%discerete time sin wave
subplot(5,1,1)
stem(n1,yn)% for plotting discrete signal
title('discrete time sinusoidal')
xlabel('n')
ylabel('y[n]')
a=zeros(1,16)%initilizing with zero
for k=-7:8
    for n1=1:16
        a(k+8)=(a(k+8) + yn(n1+1)*exp(-1j*k*(2*pi/N)*n1))%calculating DTFS co efficients
     
    end
    a(k+8)=a(k+8)/N
end
subplot(5,1,2)
w=-7:8
stem(w,abs(a))%abs for taking magnitude
title('Amplitude plot for f in Hz')
xlabel('w')
ylabel('|ak|')
subplot(5,1,3)
w=-7:8
stem(w,angle(a))
title('phase plot for f in Hz')
xlabel('w')
ylabel('angle of |ak|')
k=-7:8
subplot(5,1,4)
stem(2*pi*k/N,abs(a))
title('amplitude plot for f in radians')
xlabel('w')
ylabel('x[n]')
k=-7:8
subplot(5,1,5)
stem(2*pi*k/N,angle(a))
title('phase plot for f in radians')
xlabel('w')
ylabel('x[n]')

% 
% Assume a rectangular wave as shown below. Using a similar approach outlined in the previous task, obtain the DTFS representation of the rectangular wave. Plot the magnitude and phase of the fourier series coefficients with appropriate axes, labels and titles.
% 
%  
% 
% 
% Detemine the period, N, of this sinosoid? Determine the DT Fourier series coefficients and plot the magnitude and phase of the DT Fourier series coefficients. 
% 	
% 	For calculating the DT Fourier series coefficients use (2). 
% 	(2) will return the value of the kth DTFS coefficient. For remaining coefficients, you may use a loop to iterate over values of k. What will be the range of k?
% ANS: K can be any consecutive of length time period, for me it is from -15 to 15.
% 
% 	You have to make two plots of the coefficients against frequency axis instead of k 
% 	One plot should be against frequency in radians. Other plot should be against frequency in Hz (Take Fs=8000. What will be effect of changing Fs?).
% NOTE: I used the single code for both frequencies i-e RADIAN and Hz
% ANS: As we increase Fs our time period will also increase
% 
% 	k-th coefficient corresponds to frequency 2π/N k. Determine the range in radians of the distinct frequency components?
% 	What is relation between frequency in Hz and frequency in radians? 
% ANS:   w=2*pi*f
% 
% 	Also show the periodicity of the DTFS coefficients. 
% 	Add the figures of both the time domain and frequency domain representation of the signals with appropriate axes, labels and titles.
N = 10;
t = 1:1:45; %generating square wave
for n = 1:45
    if(mod(n,N) == 0)
        x(n) = 1;
    elseif(abs(N-mod(n,N))>= (N/2))
        x(n) = 0;
    else
        x(n) = 1;
    end
end
subplot(5,1,1);
stem(t,x);
title('Original Signal');
for k = -15:15
    a(k+16) = 0;
    for n = 1:N
        a(k+16) = a(k+16) +(x(n)*exp(-1i*k*(2*pi/N)*n))/N; %calculating DTFS co efficients
    end
end
 
k = -15:15;
mag = abs(a);
ph = angle(a);
subplot(5,1,2);
stem(k,mag);
title('Amplitude plot for f in Hz')
xlabel('f')
ylabel('|ak|')
 
subplot(5,1,3);
stem(k,ph);
title('phase plot for f in Hz')
xlabel('f')
ylabel('angle of |ak|')
subplot(5,1,4);
stem(2*pi*k/N,angle(a));
title('amplitude plot for f in radians')
xlabel('w')
ylabel('x[n]')
subplot(5,1,5);
stem(2*pi*k/N,abs(a));
title('amplitude plot for f in radians')
xlabel('w')
ylabel('x[n]')
 
%  Assume a rectangular wave as shown below. Using a similar approach outlined in the previous task, obtain the DTFS representation of the rectangular wave. Plot the magnitude and phase of the DT Fourier series coefficients with appropriate axes, labels and titles. What differences can you note from the frequency representation of previous waveform. What explanation can you provide for the difference observed? 
N = 10;
t = 1:1:45; %generating square wave
for n = 1:45
    if(mod(n,N) == 0)
        x(n) = 1;
    elseif(abs(N-mod(n,N))>= 2)
        x(n) = 0;
    else
        x(n) = 1;
    end
end
subplot(5,1,1);
stem(t,x);
title('Original Signal');
for k = -15:15
    a(k+16) = 0;
    for n = 1:N
        a(k+16) = a(k+16) +(x(n)*exp(-1i*k*(2*pi/N)*n))/N; %calculating DTFS co efficients
    end
end
 
k = -15:15;
mag = abs(a);
ph = angle(a);
subplot(5,1,2);
stem(k,mag);
title('Amplitude plot for f in Hz')
xlabel('f')
ylabel('|ak|')
 
subplot(5,1,3);
stem(k,ph);
title('phase plot for f in Hz')
xlabel('f')
ylabel('angle of |ak|')
subplot(5,1,4);
stem(2*pi*k/N,angle(a));
title('amplitude plot for f in radians')
xlabel('w')
ylabel('x[n]')
subplot(5,1,5);
stem(2*pi*k/N,abs(a));
title('amplitude plot for f in radians')
xlabel('w')
ylabel('x[n]')

% Inverse DT Fourier Series Calculation
% 
% For the signals in Tasks 1.2.1.1 and 1.2.1.2, reconstruct the signal using the obtained DTFS coefficients a_k. The DT signal can be generated from the FS coefficients a_k using (1).  
% x_r [n]= ∑_(k=<N>)▒〖a_k e^jk(2π/N)n 〗	           (1)
% 	           
% Plot the reconstructed signal x_r [n]. Compare with original signal x[n]. 
% 
% NOTE: I used the signal from the task one over one period to reconstruct it again using given equation 
function[yn]=DT_sinusoid(A,f,Fs)
f=500
Fs=8000
 
A=3
n1=0:45
w=(2*pi*f)/Fs
N=2*pi/w
yn=A*sin(w*n1)%generating sin wave
subplot(4,1,1)
stem(n1,yn)
title('discrete time sinusoidal')
xlabel('n')
ylabel('y[n]')
a=zeros(1,16)
for k=-7:8
    for n1=1:16
        a(k+8)=(a(k+8) + yn(n1+1)*exp(-1j*k*(2*pi/N)*n1))
     
    end
    a(k+8)=a(k+8)/N
end
 
for n1=1:16%for reconstructing original signal
    xrn(n1)=0
    for k=-7:8
        xrn(n1)=(xrn(n1) + a(k+8)*exp(1j*k*(2*pi/N)*n1))%calculating fourier transform
     
    end
  
end
subplot(4,1,2)
w=-7:8
stem(w,abs(a))
title('Amplitude plot for f in Hz')
xlabel('w')
ylabel('|ak|')
subplot(4,1,3)
w=-7:8
stem(w,angle(a))
title('phase plot for f in Hz')
xlabel('w')
ylabel('angle of |ak|')
k=-7:8
subplot(4,1,4)
stem(k,xrn)
title('reconstructed signal')
xlabel('k')
ylabel('xr[n]')


% TASK-2 PART-B CODE
f=1/10;
Fs=10;
xn=[0,0,0,0,0,1,1,1,1,1]%generating square wave
n1=0:9
N=10
 
 
subplot(4,1,1)
stem(n1,xn)%plotting discrete signal
title('Original signal')
xlabel('n')
ylabel('y[n]')
a=zeros(1,16);
for k=-7:8
    for n1=1:10
        a(k+8)=(a(k+8) + xn(n1)*exp(-1j*k*(2*pi/N)*n1));%calculating fourier series co efficients
     
    end
    a(k+8)=a(k+8)/N;
end
for n1=1:10;% for reconstruction of signal
    xrn(n1)=0
    for k=-7:8
        xrn(n1)=(xrn(n1) + a(k+8)*exp(1j*k*(2*pi/N)*n1));%calculating  inverse fourierseries 
     
    end
   
end
subplot(4,1,2)
w=-7:8;
stem(w,abs(a))
title('Amplitude plot for f in Hz')
xlabel('w')
ylabel('|ak|')
subplot(4,1,3)
w=-7:8;
stem(w,angle(a))
title('phase plot for f in Hz')
xlabel('w')
ylabel('angle of |ak|')
n=0:9;
subplot(4,1,4)
stem(n,xrn)
title('reconstructed signal')
xlabel('n')
ylabel('xr[n]')
%  TASK-2 PART-B CODE
f=1/10;
Fs=10;
xn=[0,0,0,0,0,0,0,0,1,1]%generating square wave
n1=0:9
N=10
 
 
subplot(4,1,1)
stem(n1,xn)%plotting discrete signal
title('Original signal')
xlabel('n')
ylabel('y[n]')
a=zeros(1,16);
for k=-7:8
    for n1=1:10
        a(k+8)=(a(k+8) + xn(n1)*exp(-1j*k*(2*pi/N)*n1));%calculating fourier series co efficients
     
    end
    a(k+8)=a(k+8)/N;
end
for n1=1:10;% for reconstruction of signal
    xrn(n1)=0
    for k=-7:8
        xrn(n1)=(xrn(n1) + a(k+8)*exp(1j*k*(2*pi/N)*n1));%calculating  inverse fourierseries 
     
    end
   
end
subplot(4,1,2)
w=-7:8;
stem(w,abs(a))
title('Amplitude plot for f in Hz')
xlabel('w')
ylabel('|ak|')
subplot(4,1,3)
w=-7:8;
stem(w,angle(a))
title('phase plot for f in Hz')
xlabel('w')
ylabel('angle of |ak|')
n=0:9;
subplot(4,1,4)
stem(n,xrn)
title('reconstructed signal')
xlabel('n')
ylabel('xr[n]')








