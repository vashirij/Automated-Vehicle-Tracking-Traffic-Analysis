%% Main_Project.m
% Vehicle Tracking and Traffic Analysis

clear
clc
close all

%% 1. Reading video and converting  into grayscale
VidGray = ReadVideo('TrafficVideo.mp4');

[ny,nx,nt] = size(VidGray);

disp(['Rows = ',num2str(ny)])
disp(['Columns = ',num2str(nx)])
disp(['Frames = ',num2str(nt)])

%% 2. Smoothing video frames
VidSmooth = SmoothVideo(VidGray);

%% 3. Selecting vehicle template
Template = TemplateSelection(VidGray);

%% 4. Template matching on one frame
frameNum = round(nt/2);
I = VidGray(:,:,frameNum);

[CorImage,bestRow,bestCol,bestR] = TemplateMatch(I,Template);

disp(['Best row = ',num2str(bestRow)])
disp(['Best col = ',num2str(bestCol)])
disp(['Best correlation = ',num2str(bestR)])

[xpos,ypos,rvals] = TrackVehicle(VidGray,Template);

v = VideoReader('TrafficVideo.mp4');
frameRate = v.FrameRate;

speed = ComputeSpeed(xpos,ypos,frameRate);

FourierAnalysis(speed);