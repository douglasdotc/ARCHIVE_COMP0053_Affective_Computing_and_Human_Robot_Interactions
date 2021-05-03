# Insturction using the modified iPhys toolbox to determine heart rate from video

First read this paper written about the iPhys toolbox:

https://arxiv.org/abs/1901.04366

### Installation

Follow the instructions from the following github link to download the iPhys toolbox.

https://github.com/danmcduff/iphys-toolbox

This toolbox has been extended with the following three scripts
 in order to get a pulse rate value for every 10 seconds time window
(this time window can be modified):

ACHRI.m
Heart_rate_window.m
avg_HR_calc.m

Please, save these into the folder of the iPhys toolbox.

### description of the usage of the modified toolbox

ACHRI.m is the main script; this script has to be run to get the heart rate values.
 
The following parameters need to be specified:

VideoFile: The path to the examinabe video has to be given.
StartTime: Timepoint at which to start process in seconds.
Duration: Duration of the time window to process in seconds.
WindowDur: The size of the sliding window in seconds.
Participant: The identifier code of the participant. 