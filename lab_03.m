% i)	Load the audio file titled “song.wav” using MATLAB. Play the audio file. 

[x,Fs]=audioread('test_song.wav'); %loadng sounfd file
sound(x,Fs) %playing audio
x= x(:,1);
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
plot(t,x); xlabel('Seconds'); ylabel('Amplitude');

% ii)	Flip the audio sequence and play it back again. (Hint: The operation is time reversal)

[x,Fs]=audioread('test_song.wav'); %loadng sounfd file
y=flipud(x); %flippimg the sound
sound(y,Fs) %playing audio 
y = y(:,1);
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
plot(t,y); xlabel('Seconds'); ylabel('Amplitude');
% iii)	Next perform time compression on the flipped signal by a factor of 2. What does the audio sequence sound like?
% The loaded audio played at double speed in the reverse direction
% 
[x,Fs]=audioread('test_song.wav'); %loadng sounfd file
y=flipud(x); %flippimg the sound
sound(y,2*Fs) %playing audio
plot(y)
 
y = y(:,1);
dt = 1/2*Fs;
t = 0:dt:(length(y)*dt)-dt;
plot(t,y); xlabel('Seconds'); ylabel('Amplitude');
%  
% Perform time expansion by a factor of 2. What does the flipped audio sequence sound like?
% Hints: You may use the commands ‘fliplr’ ‘flipud’ for flipping the signal. Also the same can be achieved using a for loop.
% The loaded audio played at half of speed in the reverse direction
% 
% 
% 
[x,Fs]=audioread('test_song.wav'); %loadng sounfd file
y=flipud(x); %flippimg the sound
sound(y,0.5*Fs) %playing audio
plot(y)
 
y = y(:,1);
dt = 1/0.5*Fs;
t = 0:dt:(length(y)*dt)-dt;
plot(t,y); xlabel('Seconds'); ylabel('Amplitude');
%  
% Transformations of the Time Index for Discrete time signals:
% i)	Define a Matlab vector n,such that -3 ≤n < 7, representing time/sample indices of a Discrete Time Signal x[n] such that : 
% 
n = [-3:6];  % creating vector at given indexes
y =[0   0   0   2   0   3  -1   0   2   -3  ];  % corresponding values at different indexes
stem(n,y,'b-*'); % plotting discrete tine function
grid on;
xlabel('n');
ylabel('x[n]');
%  
% Make a generalized function that can shift the signal x[n]by delaying or advancing it by a specified amount.
% *HINT (You can make use of ‘find’ command in Matlab).
% The inputs to the function should be the data and shift while output should be the shifted signal. Please make sure that the indices accompanying the shifted signal are correct
n1=input('Enter delaying amount ');
n2=input('Enter advancing amount ');
n=[-3:1:6];
x=[0,0,0,2,0,3,-1,0,2,-3];
subplot(3,1,1);
stem(n,x, 'r-*');
title('signal befor shifting');
d=n+n1;%delaying signal
y=x;
subplot(3,1,2);
stem(d,y, 'r-*'); %plotong signal
title('Delayed signal by enter amount n1');
t=n-n2;%advancing signal
z=x;
subplot(3,1,3);
stem(t,z, 'r-*');
title('Advanced signal by entetred amount n2)');
% Implement the following function in Matlab. Your function should take k and n as input from user.
% 
% u[k-n]= {_(0 ,k<n)^(1 ,k≥n)
% 
k=input('Ener the value of K ');%getting the value from users
n=input('Enter th value of N ');
if(k>n)
one=ones(1,k-n);%it will genrate all ones when conditon meets
n=[-length(one):1:length(one)];
x=(n>=0);
subplot(1,2,1);plot(n,x,'red-*');
subplot(1,2,2);stem(n,x,'red-*');
else
one=ones(1,n-k);
n=[-length(one):1:length(one)];
x=(n>=0);
x=fliplr(x); %time reversl of the siganl to meets the desired condition
subplot(1,2,1);plot(n,x,'red-*');
subplot(1,2,2);stem(n,x,'red-*');
% end
% Write a function that will produce three figures. The first figure shall show the signal x[n] given above. The second figure shall show the signal xe[n]. The third figure shall show the signal xo[n].
x=[2,3,-1,2,-3]% i used the signal which is given in the lab question
n=0:1:4;
y=fliplr(x);
%for even part of signal,using formula x_e [n]= 1/2[x[n]+x[-n]],
evenpart=0.5.*(x+y);
%for even part of signal,using formula x_e [n]= 1/2[x[n]-x[-n]],
oddpart=0.5.*(x-y);
subplot(4,1,1);
stem(n,x);
grid on;
title('Signal x[n]')
subplot(4,1,2);
stem(n,evenpart);
grid on;
title('Even Part of Signal')
subplot(4,1,3)
stem(n,evenpart);
title('Odd Part of signal')
%check the validity that we have calcluted even and part accuratly lets
%just add both even and odd part and plot
subplot(4,1,4)
stem(n,evenpart+oddpart)
title('ADDITON OF BOTH EVEN AND ODD PART')
% 
% Image Transformation:
% v)	Load the file ‘image.jpg’ in Matlab. See the image. You should see a fighter throwing a punch. Assuming that each row is a separate signal perform time reversal of each row. Now see the image. The fighter is now throwing a punch with which hand?
% 	Use the following commands:
% 	For loading the image: img=imread(‘filename.extension’);
% 	For seeing the image: imagesc(img);
% 	For finding the dimensions of the image: [height width channels]=size(img);
% To acess each channel separately try this output(:,:,1)=input(:,:,1). This means that we are copying rows, columns of the Blue Channel to be copied from input to output.
% 
% 

img=imread('image.jpg')
imagesc(img)%to see image on screen
[height width channels]=size(img)
flipped= flipdim(img,2)%flipped image or we can say mirror image
subplot(3,1,1), imshow(img)
title('Original image')
subplot(3,1,2), imshow(flipped)
title('Flipped Image')
imag(:,:,1)=img(:,:,1)%copying rows, columns of blue channel to be copied from input to outut
 subplot(3,1,3),imshow(imag)









