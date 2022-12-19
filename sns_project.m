%First Audio signal
[aud1,FS1]=audioread('audio.mp3'); %loadng sound file
p=audioplayer(aud1,FS1);
aud1= aud1(:,1);
dt1 = 1/FS1;
t1 = 0:dt1:(length(aud1)*dt1)-dt1;
figure(1)
subplot(221)
plot(t1,aud1 ); 
xlabel('Seconds');
ylabel('Amplitude');
title('Audio of Muhammad Sufyan ')
%low pass filter of 3kHz
lpass=lowpass;
%filtering aud1 into xfilter
aud1filter=filter(lpass,aud1);
subplot(222)
plot(t1,aud1filter)
title('Filtered Audio of Muhammad Sufyan')
%Calculating Frequency spectrum 
N=length(aud1filter);
fftx=fftshift(fft(aud1filter,N));
f=FS1*(-N/2:N/2-1)/N;
subplot(223)
plot(f,abs(fftx))
xlabel('Absolute Frequency Of Signal')
ylabel('Dft Values')
title('Spectrum Of Muhammad Sufyan Audio')
%-------------------------Second Audio-------------------------------

[aud2,FS2]=audioread('audio2.mp3'); %loadng sounfd file
%sound(aud2,FS2); %playing audio
aud2= aud2(:,1);
dt2 = 1/FS2;
t2 = 0:dt2:(length(aud2)*dt2)-dt2;
figure(2)
subplot(221)
plot(t2,aud2 ); 
xlabel('Seconds');
ylabel('Amplitude');
title('Audio of Arslan Azam')
%low pass filter of 3kHz
aud2filter=filter(lpass,aud2);
subplot(222)
plot(t2,aud2filter)
title('Filtered Audio of Arslan Azam ')
%Calculating Frequency spectrum 
N2=length(aud2filter);
fftaud2=fftshift(fft(aud2filter,N2));
f2=FS2*(-N2/2:N2/2-1)/N2;
subplot(223)
plot(f2,abs(fftaud2))
xlabel('Absolute Frequency Of Arslan Azam Audio')
ylabel('dft values')
title('Spectrum of Arslan Azam Audio')

%-------------------------3rd Audio-------------------------------

[aud3,FS3]=audioread('audio3.mp3'); %loadng sounfd file
%sound(aud3,FS3); %playing audio
aud3= aud3(:,1);
dt3 = 1/FS3;
t3 = 0:dt3:(length(aud3)*dt3)-dt3;
figure(3)
subplot(221)
plot(t3,aud3 ); 
xlabel('Seconds');
ylabel('Amplitude');
title('Audio of Jawad Ahmed')
%low pass filter of 3kHz
aud3filter=filter(lpass,aud3);
subplot(222)

plot(t3,aud3filter)
title('Filtered Audio Of Jawad Ahmed')
%Calculating Frequency spectrum 
N3=length(aud3filter);
fftaud3=fftshift(fft(aud3filter,N3));
f3=FS3*(-N3/2:N3/2-1)/N3;
subplot(223)
plot(f3,abs(fftaud3))
xlabel('Absolute Frequency Of Jawad Ahmed Audio')
ylabel('Dft Values')
title('Spectrum of Jawad Ahmed Audio')
%-------------------------4th Audio-------------------------------




[aud4,FS4]=audioread('audio4.m4a'); %loadng sounfd file
%sound(aud4,FS4); %playing audio
aud4= aud4(:,1);
dt4 = 1/FS4;
t4 = 0:dt4:(length(aud4)*dt4)-dt4;
figure(4)
subplot(221)
plot(t4,aud4 ); 
xlabel('Seconds');
ylabel('Amplitude');
title('Audio of Asim Hussain')
%low pass filter of 3kHz
aud4filter=filter(lpass,aud4);
%sound(aud4filter,FS4)
subplot(222)

plot(t4,aud4filter)
title('Filtered Audio of Asim Hussain')
%Calculating Frequency spectrum 
N44=length(aud4filter);
fftaud4=fftshift(fft(aud4filter,N44));
f44=FS4*(-N44/2:N44/2-1)/N44;
subplot(223)
plot(f44,abs(fftaud4))
xlabel('Absolute Frequency Of Asim Hussain Audio')
ylabel('Dft Values')
title('Spectrum of Asim Hussain Audio')
%-------------------------------Modulation---------------------------------

%appending zeros for the to remove order mismatch
%first signal multiply
q=abs(length(aud2filter)-length(aud2filter));
a1=zeros(32256,1);
c1=zeros(34560,1);
d1=zeros(38784,1);
tt=transpose(t1);
ac1=cos(2*pi*3000*tt);
me1=aud1filter.*ac1;
m1=[me1;a1];
%second signal multiply
tt2=transpose(t2);
ac2=cos(2*pi*9000*tt2);
m2=aud2filter.*ac2;
%third signal multiply
tt3=transpose(t3);
ac3=cos(2*pi*15000*tt3);
me2=aud3filter.*ac3;
m3=[me2;c1];
tt4=transpose(t4);
ac4=cos(2*pi*21000*tt4);
me4=aud4filter.*ac4;
m4=[me4;d1];
m=m1+m2+m3+m4;
%sound(m,FS2) %playing the modulated audio
figure(5)
subplot(221)
plot(t2,m)
xlabel('Seconds');
ylabel('Amplitude');
title('Modulated audio')
%Calculating Frequency spectrum 
N4=length(m);
fftm=fftshift(fft(m,N4));%using fs2 because it is highest and i have make all equal to this for now, will change latter
f4=FS2*(-N4/2:N4/2-1)/N4;
subplot(222)
plot(f4,abs(fftm))
xlabel('Absolute Frequency of Modulated Signal ')
ylabel('Dft Values')
title('Spectrum Of Modulted Signal')

%------------------------BANDPASS FILTER-------------------------------
%FIRST SIGNAL
bpass=bandpass1;
%filtering x into xfilter
acc1=[ac1;a1];
aud1bandpass=filter(bpass,m);
z1=2*aud1bandpass.*acc1;
lpass1=lowpass;
rec1=filter(lpass1,z1);
%sound(rec1,FS2)
%DRAWING FREQUENCY SPECTRUM OF RECOVERED SIGNAL
N5=length(rec1);
fftz1f=fftshift(fft(rec1,N5));
f5=FS2*(-N5/2:N5/2-1)/N5; %using fs2 because it is highest and i have make all equal to this for now, will change latter
figure(6)
subplot(221)
plot(f5,abs(fftz1f))
xlabel('Absolute Frequency Of Signal')
ylabel('Dft Values')
title('Spectrum Of Recovered Audio of Muhammad Sufyan')
subplot(222)
plot(f4,abs(fftm))
xlabel('Absolute Frequency of Modulated Signal ')
ylabel('Dft Values')
title('Spectrum Of Modulted Signal')
subplot(223)
plot(f,abs(fftx))
xlabel('Absolute Frequency Of Signal')
ylabel('Dft Values')
title('Spectrum Of Muhammad Sufyan Audio')

%SECOND SIGNAL
bpass2=bandpass2;

%filtering x into xfilter
aud2bandpass=filter(bpass2,m);
z2=2*aud2bandpass.*ac2;
lpass2=lowpass2;
rec2=filter(lpass2,z2);   

%sound(rec2,FS2)
%DRAWING FREQUENCY SPECTRUM OF RECOVERED SIGNAL 2
N6=length(rec2);
fftz2f=fftshift(fft(rec2,N6));
f6=FS2*(-N6/2:N6/2-1)/N6; 
figure(7)
subplot(221)
plot(f6,abs(fftz2f))
xlabel('Absolute Frequency Of Arslan Azam Audio')
ylabel('dft values')
title('Spectrum Of Recovered Audio of Arslan Azam')
subplot(222)
plot(f4,abs(fftm))
xlabel('Absolute Frequency Of  Signal 1')
ylabel('Dft Values')
title('Spectrum Of Modulated Signal')
subplot(223)
plot(f2,abs(fftaud2))
xlabel('Absolute Frequency Of Arslan Azam Audio')
ylabel('dft values')
title('Spectrum of Arslan Azam Audio')


%THIRD SIGNAL
bpass3=bandpass3;
%BANDPASS FILTERING OF AUDIO SIGNAL 3
aud3bandpass=filter(bpass3,m);
acc3=[ac3;zeros(34560,1)];
z3=2*aud3bandpass.*acc3;
lpass3=lowpass3;
rec3=filter(lpass3,z3); 
%sound(rec3,FS2)
%DRAWING FREQUENCY SPECTRUM OF RECOVERED SIGNAL 2
N7=length(rec3);
fftz3f=fftshift(fft(rec3,N7));
f7=FS2*(-N7/2:N7/2-1)/N7;
figure(8)
subplot(221)
plot(f7,abs(fftz3f))
xlabel('Absolute Frequency Of Jawad Ahmed Audio')
ylabel('Dft Values')
title('Spectrum Of Recovered Audio of Jawad Ahmed')
subplot(222)
plot(f4,abs(fftm))
xlabel('Absolute Frequency of  Modulated Signal')
ylabel('Dft Values')
title('Spectrum Of Modulated Signal')
subplot(223)
plot(f3,abs(fftaud3))
xlabel('Absolute Frequency Of Jawad Ahmed Audio')
ylabel('Dft Values')
title('Spectrum of Jawad Ahmed Audio')



%FOURTH SIGNAL
bpass4=bandpass4;
aud4bandpass=filter(bpass4,m);
acc4=[ac4;zeros(38784,1)];
z4=2*aud4bandpass.*acc4;
lpass44=lowpass44;
rec4=filter(lpass44,z4); 
%sound(rec4,FS4)
%DRAWING FREQUENCY SPECTRUM OF RECOVERED SIGNAL 4
N8=length(rec4);
fftz4f=fftshift(fft(rec4,N8));
f8=FS2*(-N8/2:N8/2-1)/N8;
figure(9)
subplot(221)
plot(f8,abs(fftz4f))
xlabel('Absolute Frequency Of Asim Hussain Audio')
ylabel('Dft Values')
title('Spectrum Of Recovered Audio of Asim Hussain')
subplot(222)
plot(f4,abs(fftm))
xlabel('Absolute Frequency of  Modulated Signal')
ylabel('Dft Values')
title('Spectrum Of Modulated Signal')
subplot(223)
plot(f44,abs(fftaud4))
xlabel('Absolute Frequency Of Asim Hussain Audio')
ylabel('Dft Values')
title('Spectrum of Asim Hussain Audio')
