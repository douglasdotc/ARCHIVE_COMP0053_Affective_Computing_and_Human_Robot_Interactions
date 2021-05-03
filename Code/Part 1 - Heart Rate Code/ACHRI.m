clc, clear; close all
addpath(genpath([cd '\tools\']))%additional required functions

%% Set variables:
DataDirectory           = [cd '\test_data\'];%default determined off this script's directory
VideoFile               = [DataDirectory 'p3_vid.mov'];% Video file path.
FS                      = 30;% Video framerate (fps).
StartTime               = 2353;% Timepoint at which to start process.
Duration                = 120;% Duration of the time window to process.
ECGFile                 = [DataDirectory 'ECGData.mat'];% File path to corresponding ECG data file (.mat) containing: 1) The waveform - ECGData.data, 2) The ECG sampling rate - ECGData.fs, 3) The ECG peak locations (in samples) - ECGData.peaks.
PPGFile                 = [DataDirectory 'PPGData.mat'];% File path to corresponding PPG data file (.mat) containing: 1) The waveform - PPGData.data, 2) The PPG sampling rate - PPGData.fs, 3) The PPG peak locations (in samples) - PPGData.peaks.
PlotTF                  = true;% Boolean to turn plotting results on or off.
WindowDur               = 10; % The size of the sliding window in seconds.
Participant             = 'participant4'; % The identifier code of the participant.

%% Check Files
if(~exist(VideoFile,'file'))
    error('VideoFile: ''%s'' does not exist.\nAn example video file can be downloaded from: ''https://drive.google.com/open?id=1oD4VbBD9ColSlbiIMEgxbvQ7LnXHPy1_''',VideoFile)
end
% if(~exist(ECGFile,'file'))
%     error('ECGFile: ''%s'' does not exist.\nAn example ECG file is contained in the respository ''test_data'' directory',ECGFile)
% end
% if(~exist(PPGFile,'file'))
%     error('PPGGFile: ''%s'' does not exist.\nAn example PPG file is contained in the respository ''test_data'' directory',PPGFile)
% end

%% Green - Verkruysse, Svaasand, Nelson (2008)
% Verkruysse, W., Svaasand, L. O., & Nelson, J. S. (2008). Remote
% plethysmographic imaging using ambient light. Optics express, 16(26),
% 21434-21445. DOI: 10.1364/OE.16.021434
% [BVP, PR, HR_ECG, PR_PPG, SNR] = GREEN_VERKRUYSSE(VideoFile, FS, StartTime, Duration, ECGFile, PPGFile, PlotTF);
% fprintf('GREEN_VERKRUYSSE:\n')
% PR, HR_ECG, PR_PPG, SNR

HR_Array = Heart_rate_window(VideoFile, FS, StartTime, Duration, WindowDur, Participant)

