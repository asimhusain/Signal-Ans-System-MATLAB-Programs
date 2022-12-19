% 1.	Assume a continuous time sinusoidal signal with frequency 1 Hz. Since Matlab can only handle discrete sample signals we will assume that the signal having 100 samples per cycle is a continuous time signal. 
% 
% Generic Information related to the signal and its samples may be declared as follows:
% freq=1;
% samples_in_one_cycle=100;
% division_increment=1/samples_in_one_cycle;
% 
% Using the following commands generate the signal for 5 cycles. Next display the signal with respect to time, as a continuous signal in Figure (1).
% x(inc)=cos((2*pi*freq*t));
%     	time(inc)=t;
freq=1;
samples_in_one_cycle=100;
division_increment=1/samples_in_one_cycle;
t=0:division_increment:5
x=cos((2*pi*freq*t));
figure(1)
plot(t,x)
title('cosine function for 5 cycles')
xlabel('time')
ylabel('cos(2*pi*freq*t)')
 
% 2.	Assume that sampling frequency is 4 times the highest frequency in the above generated signal. Only pick appropriate evenly spaced samples, starting from the first sample. The code given below may help you in identifying which samples to pick.
% upper_limit=length(x);
% increment_value=floor((1/sampling_freq)*(1/division_increment));
% 
% Display the sampled signal in Figure(2) along with the time instant from which the signal was picked. 
% 
% NOTE: Please make sure that you insert zeros between the samples so that the continuous time signal “x(t)” and continuous time sampled signal “xp(t)” have the same number of samples in Matlab. 

freq=1;
samples_in_one_cycle=100;
division_increment=1/samples_in_one_cycle;
t=0:1/100:5
x=cos((2*pi*freq*t));
        sampling_freq=4
        x1=zeros(1,length(x))%equalizing the length of two vectors
upper_limit=length(x);
increment_value=floor((1/sampling_freq)*(1/division_increment));
for t1=1:increment_value:upper_limit
    x1(t1)=x(t1)%for particular samples
end
figure(2)
stem(t,x1)
title('cosine function for 5 cycles with fs =4')
xlabel('time')
ylabel('cos(2*pi*freq*t)')
% 
% 3.	Since filtering with a low pass filter in frequency domain means convolution with a sinc in time domain construct a sinc function using the code given below: 
% Using the following commands generate the sinc. Next display the signal with respect to time, as a continuous signal in Figure (3).
% for t=-2.5:division_increment:2.5
%     inc=inc+1;
%     z(inc)=4*sinc(4*t);% In matlab this means sinc(4*pi*t)
% end
% 
% Comment why set amplitude of Sinc to 4? Is it necessary? Also comment why have sinc(4*pi*t)? 
% Ans: Yes, it is necessary. To follow the Nyquist criteria i.e ws>2*wmax. As wmax is 2*pi for given signal.so for sinc it should be 4*pi or greater than that to reconstruct the original signal
freq=1;
samples_in_one_cycle=100;%for taking partcular samples
division_increment=1/samples_in_one_cycle;
t=-2.5:division_increment:2.5;
z=4*sinc(4*t);% In matlab this means sinc(4*pi*t)
figure(3)
plot(t,z)
title('sinc function')
xlabel('time')
ylabel('sinc(4*t)')


% 4.	Convolve sinc with sampled signal. Plot the resultant continuous time reconstructed signal.  
% Display the reconstructed signal with respect to time in Figure (4). Is this signal similar to the starting signal?
freq=1;
samples_in_one_cycle=100;
division_increment=1/samples_in_one_cycle;
T=1/freq;
t1=0:division_increment:5*T;
x_t=cos(2*pi*freq*t1);
sampling_freq=4*freq;
upper_limit=length(x_t);
increment_value=floor((1/sampling_freq)*(1/division_increment));
x_p=zeros(1,501);
for index = 1:501
    r = mod(index,increment_value)
    if r == 0
        x_p(index) = x_t(index);
    else
        x_p(index)=0;
    end    
end
conv_s1=conv(x_p,z);
figure(4)
t2=0:division_increment:2*5*T;
plot(t2,conv_s1)
xlabel('time')
ylabel('amplitude')
% 5.	What happens when sampling frequency is set equal to:
% a.	Signal Frequency
% In this case since Fs= frequency which does not meet the criteria of sampling theorem so original signal will not be rederived at the end which can be seen in the following graphs  
freq=1;
samples_in_one_cycle=100;
division_increment=1/samples_in_one_cycle;
t=-2.5:division_increment:2.5
z=4*sinc(4*t);% In matlab this means sinc(4*pi*t)
t=0:1/100:5
x=cos((2*pi*freq*t));
sampling_freq=1
x1=zeros(1,length(x))%equalizing the length of two vectors
upper_limit=length(x);
increment_value=floor((1/sampling_freq)*(1/division_increment));
for t1=1:increment_value:upper_limit
    x1(t1)=x(t1)%for particular samples
end
subplot(221)
plot(t,x1)
title('sampled signal'),xlabel('time'),ylabel('x1')
subplot(222)
plot(t,z)
title('sinc function'),xlabel('time'),ylabel('z')
subplot(223)
plot(t,x)
title('original cos signal'),xlabel('time'),ylabel('x')
subplot(224)
t=-2.5:division_increment:7.5
y=(conv(x1,z))/4
plot(t,y)
xlim([0,5])
title('Reconstructed signal')
xlabel('time')
ylabel('x1(t)*z(t)')

% b.	8 times the signal frequency
% In this case since Fs= 8*frequency which meets the criteria of sampling theorem  because minimum value should be 2*freq, so original signal will n be retrieved at the end which can be seen in the following graphs  
freq=1;
samples_in_one_cycle=100;
division_increment=1/samples_in_one_cycle;
t=-2.5:division_increment:2.5
z=4*sinc(4*t);% In matlab this means sinc(4*pi*t)
t=0:1/100:5
x=cos((2*pi*freq*t));
sampling_freq=8
x1=zeros(1,length(x))%equalizing the length of two vectors
upper_limit=length(x);
increment_value=floor((1/sampling_freq)*(1/division_increment));
for t1=1:increment_value:upper_limit
    x1(t1)=x(t1)%for particular samples
end
subplot(221)
plot(t,x1)
title('sampled signal'),xlabel('time'),ylabel('x1')
subplot(222)
plot(t,z)
title('sinc function'),xlabel('time'),ylabel('z')
subplot(223)
plot(t,x)
title('original cos signal'),xlabel('time'),ylabel('x')
subplot(224)
t=-2.5:division_increment:7.5
y=(conv(x1,z))/4
plot(t,y)
xlim([0,5])
title('Reconstructed signal')
xlabel('time')
ylabel('x1(t)*z(t)')

% 
% c.	16 times the signal frequency.
% 6.	In this case since Fs= 16*frequency which meets the criteria of sampling theorem  because minimum value should be 2*freq, so original signal will n be retrieved at the end which can be seen in the following graphs  
% 
% 
% 
% 
freq=1;
samples_in_one_cycle=100;
division_increment=1/samples_in_one_cycle;
t=-2.5:division_increment:2.5
z=4*sinc(4*t);% In matlab this means sinc(4*pi*t)
t=0:1/100:5
x=cos((2*pi*freq*t));
sampling_freq=16
x1=zeros(1,length(x))%equalizing the length of two vectors
upper_limit=length(x);
increment_value=floor((1/sampling_freq)*(1/division_increment));
for t1=1:increment_value:upper_limit
    x1(t1)=x(t1)%for particular samples
end
subplot(221)
plot(t,x1)
title('sampled signal'),xlabel('time'),ylabel('x1')
subplot(222)
plot(t,z)
title('sinc function'),xlabel('time'),ylabel('z')
subplot(223)
plot(t,x)
title('original cos signal'),xlabel('time'),ylabel('x')
subplot(224)
t=-2.5:division_increment:7.5
y=(conv(x1,z))/4
plot(t,y)
xlim([0,5])
title('Reconstructed signal')
xlabel('time')
ylabel('x1(t)*z(t)')



















