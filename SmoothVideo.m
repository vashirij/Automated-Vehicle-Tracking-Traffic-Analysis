function VidSmooth = SmoothVideo(VidGray)
% SmoothVideo
% Applies a manually coded 5x5 smoothing convolution kernel
% to every grayscale video frame and displays Figure 2.

[ny,nx,nt] = size(VidGray);

VidSmooth = zeros(ny,nx,nt);

%% 5x5 Gaussian-like smoothing kernel
kernel = [1  4  7  4  1;
    4 16 26 16  4;
    7 26 41 26  7;
    4 16 26 16  4;
    1  4  7  4  1];

kernel = kernel / sum(kernel(:));

ksize = 5;
offset = floor(ksize/2);

%% Applying convolution to every frame
for t = 1:nt

    I = VidGray(:,:,t);
    O = zeros(ny,nx);

    for r = 1+offset:ny-offset
        for c = 1+offset:nx-offset

            total = 0;

            for kr = 1:ksize
                for kc = 1:ksize

                    rr = r + kr - offset - 1;
                    cc = c + kc - offset - 1;

                    total = total + kernel(kr,kc)*I(rr,cc);

                end
            end

            O(r,c) = total;

        end
    end

    VidSmooth(:,:,t) = O;

end

%% Figure 2: Original, Smoothed, Difference
frameNum = round(nt/2);

figure

subplot(1,3,1)
imagesc(VidGray(:,:,frameNum))
axis image
axis off
colormap(gray)
title('Original Frame')

subplot(1,3,2)
imagesc(VidSmooth(:,:,frameNum))
axis image
axis off
colormap(gray)
title('Smoothed Frame')

subplot(1,3,3)
imagesc(VidGray(:,:,frameNum) - VidSmooth(:,:,frameNum))
axis image
axis off
colormap(gray)
title('Difference Image')

sgtitle('Image Smoothing Result')

end