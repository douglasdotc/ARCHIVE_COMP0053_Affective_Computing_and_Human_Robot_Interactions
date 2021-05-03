function [HR_Array] = Heart_rate_window(VideoFile, FS, StartTime, Duration, WindowDur, Participant)
  
addpath(genpath('tools'))


%number of windows
numWindows = floor(Duration / WindowDur);

for n  = 1:numWindows
    
    %% Load Video:
    VidObj = VideoReader(VideoFile);
    VidObj.CurrentTime = StartTime + (n-1) * WindowDur;

    FramesToRead=ceil(WindowDur*VidObj.FrameRate); %video may be encoded at slightly different frame rate

    %% Read Video and Spatially Average:
    T = zeros(FramesToRead,1);%initialize time vector
    RGB = zeros(FramesToRead,3);%initialize color signal
    FN = 0;
    while hasFrame(VidObj) && (VidObj.CurrentTime <= StartTime + n * WindowDur)
        FN = FN+1;
        T(FN) = VidObj.CurrentTime;
        VidFrame = readFrame(VidObj);

        %position for optional face detection/tracking - originally specified in reference as a manual segmentation.
        VidROI = VidFrame;

        %position for optional skin segmentation

        RGB(FN,:) = sum(sum(VidROI));%if different size regions are used for different frames, the signals should be normalized by the region size, but not necessary for whole frame processing or constant region size
    end
    HR_Array(n) = avg_HR_calc(RGB, FS);
    time(n) = StartTime + n * WindowDur;
    
    

end

plot(time,HR_Array);
title('Apostle - Participant3');
xlabel('time [s]')
ylabel('Estimated Pulse Rate [bpm]')


end
