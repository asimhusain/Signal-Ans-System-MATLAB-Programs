% Enter the complex numbers z1 and z2 in MATLAB. Plot them with zvect() and print them with zprint(). When unsure about a command, use help. Whenever you make a plot with zvect() or zcat(), it is helpful to provide axes for reference. An x-y axis and the unit circle can be superimposed on your zvect() plot by doing the following: 
% hold on, zcoords, ucplot, hold off
z1=10*exp(-j*2*pi/3);
z2=-5+5j;
zvect(z1), hold %it will start from origin to z1
zvect(z2)%it will also start from origin to z2
grid on
zprint(z1)%it will print all the properties associative with complex number
% zprint(z2)
% Compute z1 + z2 and plot the sum using zvect(). Then use zcat() to plot z1 and z2 as 2 vectors head-to-tail, thus illustrating the vector sum. Use hold on to put all 3 vectors on the same plot. If you want to see the numerical value of the sum, use zprint()to display it.
z1=10*(exp(-j*2*pi/3)) 
z2=-5+5j
z1+z2
zvect(z1+z2),hold %ploting z1 + z2 both from origin
zcat([z1,z2]) %ploting only z1 from origin and z2 from z1
zprint(z1+z2)
%  Compute z1z2 and plot the answer using zvect() to show how the angles of z1 and z2 determine the angle of the product. Use zprint() to display the result numerically.
% z1=10*(exp(-j*2*pi/3)) 
z2=-5+5j
z1*z2
zvect(z1), hold
zvect(z2) 
zvect(z1*z2) %ploting z1 + z2 both from origin
grid on
zprint(z1*z2)
% 
% Compute z2/z1 and plot the answers using zvect() to show how the angles of z1 and z2 determine the angle of the quotient. Use zprint() to display the result numerically
% 
% 

z1=10*(exp(-j*2*pi/3)) 
z2=-5+5j 
zvect(z2/z1), hold %ploting z1 + z2 both from origin
grid on
ucplot
zprint(z2/z1)
% 
% Compute the conjugate z* for both z1 and z2 and plot the results. In MATLAB, see help conj. Display the results numerically with zprint
% 
z1=10*(exp(-j*2*pi/3)) 
z2=-5+5j
z1c=conj(z1) 
z2c=conj(z2)
zvect(z1c), hold
zvect(z2c)  %ploting z1 + z2 both from origin
grid on
zprint(z1c)
zprint(z2c)
% Compute the inverse 1/z for both z1 and z2 and plot the results. Display the results numerically with zprint
% 
z1=10*(exp(-j*2*pi/3)) 
z2=-5+5j
z1i=1/z1 
z2i=1/z2
zvect(z1i), hold
zvect(z2i)  %ploting z1 + z2 both from origin
grid on
zprint(z1i)
zprint(z2i)

% 
% The power of MATLAB comes from its matrix-vector syntax. In most cases, loops can be replaced with vector operations because functions such as exp() and cos() are defined for vector inputs, e.g.
% 
% cos(vv) = [cos(vv(1)), cos(vv(2)), cos(vv(3)), ... cos(vv(N))]
% 
% Where vv is an N-element row vector.Vectorization can be used to simplify your code. If you have the following code that plots a certain signal,
% 
% M = 200;
% for k=1:M
% x(k) = k;
% y(k) = cos(0.001*pi*x(k)*x(k) );
% end
% plot( x, y, ‘ro-‘)
% 
% then you can replace the for loop and get the same result with 3 lines of code:
% 
% M = 200;
% y = cos(0.001*pi*(1:M).*(1:M) );
% plot(1:M, y, ‘ro-‘)
% 
% Use this vectorization idea to write 2 or 3 lines of code that will perform the same task as the following MATLAB script without using a for loop. (Note: there is a difference between the two operations xx*xx and xx.*xx when xx is a vector.)
% 

N = 200;
rk = sqrt( (1:200)/50.*(1:200)/50 + 2.25);
sig = exp(j*2*pi.*rk);
plot( xk, real(sig), 'mo-')
% 
% Write a function that will generate a single sinusoid,  , by using four input arguments: amplitude (A), frequency (ω), phase (ɸ) and duration (dur). The function should return two outputs: the values of the sinusoidal signal (x) and corresponding times (t) at which the sinusoid values are known. Make sure that the function generates 20 values of the sinusoid per period. Call this function one cos(). Hint: use goodcos() from par (a) as a starting point. Demonstrate that your one_cos()function works by plotting the output for the following parameters: A = 95, ω = 200  ɸ rad/sec,  ɸ = π/5 radians, and dur=0.025 seconds. Be prepared to explain to the lab instructor features on the plot that indicate
% how the plot has the correct period and phase.
% The plot has correct phase because as we can see the graph is cutting y axis at approximately 80 units but which means to complete 95 unit the graph has still move up in the negative x axis which shows that there is phase shift of some angle and that is what we have given i-e=pi/5rad 
% What is the expected period in millisec?
% The expected time period in millisecond is 31.4ms

function [x,t] = one_cos(Amplitude, frequency, Phase, Duration)
t=0:Duration/19:Duration; 
x=Amplitude*cos(frequency*t+Phase); 
plot(t,x, 'b')
grid on
zoom
xlabel('Time')
ylabel('x(t)=Acos(wt+phase)')
end

% Generate the signal   and make a plot versus t. Use the syn sin function and take a range for t that will cover three periods starting at t = −0.5 secs. Include the MATLAB code with your report
% 
% 
function [xx,tt] = syn_sin(fk, Xk, fs, dur, tstart) 
X = length(Xk);
 
f = length(fk);
 
if (X ~= f); 
    error('lengths of fk and Xk are not same');
end;
 
if nargin<5
    tstart=0; %assigning default value is zero
end; 
 
N = length(Xk);
 
tt = tstart:1/fs:dur;
 
xx=0;
 
for k=1:N
 
x = Xk(k).*exp(i*2*pi*fk(k)*tt);
 
xx=xx+x;
 
end
plot(tt,xx)
grid on
xlabel('Time axis') 
ylabel('Amplitude axis')
end











