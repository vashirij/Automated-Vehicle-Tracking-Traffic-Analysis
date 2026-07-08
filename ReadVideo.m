function VidGray = ReadVideo(TrafficVideo)
% ReadVideo
% Reads a video, converts frames to grayscale,
% stores them in a 3-D array, and displays
% the first, middle, and last frames.

if nargin == 0
    TrafficVideo = 'TrafficVideo.mp4';
end

%% Read video
v = VideoReader(TrafficVideo);

ny = v.Height;
nx = v.Width;
nt = floor(v.Duration * v.FrameRate);

VidGray = zeros(ny,nx,nt);

frameNum = 1;

while hasFrame(v)

    RGB = readFrame(v);

    %% Converting to grayscale manually
    Red   = double(RGB(:,:,1));
    Green = double(RGB(:,:,2));
    Blue  = double(RGB(:,:,3));

    Gray = 0.2989*Red + ...
        0.5870*Green + ...
        0.1140*Blue;

    %% Store frame
    VidGray(:,:,frameNum) = Gray;

    frameNum = frameNum + 1;

end

%% Figure 1
figure

subplot(1,3,1)
imagesc(VidGray(:,:,1))
axis image
axis off
colormap(gray)
title('Frame 1')

subplot(1,3,2)
imagesc(VidGray(:,:,round(nt/2)))
axis image
axis off
colormap(gray)
title('Middle Frame')

subplot(1,3,3)
imagesc(VidGray(:,:,nt))
axis image
axis off
colormap(gray)
title('Last Frame')

sgtitle('Traffic Video Frames')

end