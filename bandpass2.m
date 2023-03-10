function Hd = bandpass2
%BANDPASS2 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.10 and Signal Processing Toolbox 8.6.
% Generated on: 26-May-2021 23:13:24

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 48000;  % Sampling Frequency

N      = 500;    % Order
Fstop1 = 4977;   % First Stopband Frequency
Fpass1 = 6000;   % First Passband Frequency
Fpass2 = 12000;  % Second Passband Frequency
Fstop2 = 13023;  % Second Stopband Frequency
Wstop1 = 10;     % First Stopband Weight
Wpass  = 40;     % Passband Weight
Wstop2 = 800;    % Second Stopband Weight
dens   = 20;     % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 ...
           0], [Wstop1 Wpass Wstop2], {dens});
Hd = dfilt.dffir(b);

% [EOF]
