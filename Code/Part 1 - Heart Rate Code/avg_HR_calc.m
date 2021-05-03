function [PR] = avg_HR_calc(RGB, FS)

%% Parameters
LPF = 0.7; %low cutoff frequency (Hz) - 0.8 Hz in reference
HPF = 2.5; %high cutoff frequency (Hz) - both 6.0 Hz and 2.0 Hz used in reference
%% Select BVP Source:
% Green channel
BVP = RGB(:,2);

%% Filter, Normalize
NyquistF = 1/2*FS;
[B,A] = butter(3,[LPF/NyquistF HPF/NyquistF]);%Butterworth 3rd order filter - originally specified in reference with a 4th order butterworth using filtfilt function
BVP_F = filtfilt(B,A,(double(BVP)-mean(BVP)));

BVP = BVP_F;

% Estimate Pulse Rate from periodogram
PR = prpsd(BVP,FS,40,240,false);




end%end function