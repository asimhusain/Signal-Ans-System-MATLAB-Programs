function Hd = lowpass
%LOWPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.10 and Signal Processing Toolbox 8.6.
% Generated on: 23-May-2021 17:18:59

% Equiripple Lowpass filter designed using the FIRPM function.

%low pass filter for step 2


% All frequency values are in Hz.
Fs = 44100;  % Sampling Frequency

N     = 30;    % Order
Fpass = 0;     % Passband Frequency
Fstop = 6000;  % Stopband Frequency
Wpass = 1;     % Passband Weight
Wstop = 1;     % Stopband Weight
dens  = 20;    % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fpass Fstop Fs/2]/(Fs/2), [1 1 0 0], [Wpass Wstop], ...
           {dens});
Hd = dfilt.dffir(b);

% [EOF]
