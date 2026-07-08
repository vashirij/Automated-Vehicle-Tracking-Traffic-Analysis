function [xpos,ypos,rvals] = TrackVehicle(VidGray,Template)

[ny,nx,nt] = size(VidGray);
[a,b] = size(Template);

xpos = zeros(nt,1);
ypos = zeros(nt,1);
rvals = zeros(nt,1);

%% Starting from known template position
load Template.mat row1 row2 col1 col2

startRow = row1;
startCol = col1;

searchRadius = 120;

for t = 1:nt

    I = VidGray(:,:,t);

    %% Searching only near previous location
    rmin = max(1,startRow-searchRadius);
    rmax = min(ny-a,startRow+searchRadius);
    cmin = max(1,startCol-searchRadius);
    cmax = min(nx-b,startCol+searchRadius);

    SearchImage = I(rmin:rmax+a, cmin:cmax+b);

    [~,localRow,localCol,bestR] = TemplateMatchNoFigure(SearchImage,Template);

    bestRow = rmin + localRow - 1;
    bestCol = cmin + localCol - 1;

    xpos(t) = bestCol + b/2;
    ypos(t) = bestRow + a/2;
    rvals(t) = bestR;

    %% Updating location for next frame
    startRow = bestRow;
    startCol = bestCol;

    disp(['Frame ',num2str(t),' of ',num2str(nt), ...
          ', r = ',num2str(bestR)])

end

%% Figure 5: Tracking examples
framesToShow = round(linspace(1,nt,6));

figure

for k = 1:length(framesToShow)

    t = framesToShow(k);
    I = VidGray(:,:,t);

    subplot(2,3,k)
    imagesc(I)
    axis image
    axis off
    colormap(gray)
    title(['Frame ',num2str(t)])

    hold on
    rectangle('Position',[xpos(t)-b/2,ypos(t)-a/2,b,a], ...
              'EdgeColor','r','LineWidth',2)
    plot(xpos(t),ypos(t),'r+','MarkerSize',10,'LineWidth',2)
    hold off

end

sgtitle('Vehicle Tracking Across Frames')

%% Figure 6: Trajectory overlay
figure
imagesc(VidGray(:,:,round(nt/2)))
axis image
axis off
colormap(gray)
title('Vehicle Trajectory')
hold on
plot(xpos,ypos,'r.-','LineWidth',2,'MarkerSize',14)
hold off

%% Figure 7: X position vs frame
figure
plot(1:nt,xpos,'LineWidth',2)
xlabel('Frame Number')
ylabel('X Position / Column')
title('Vehicle X Position vs Frame')
grid on

%% Figure 8: Y position vs frame
figure
plot(1:nt,ypos,'LineWidth',2)
xlabel('Frame Number')
ylabel('Y Position / Row')
title('Vehicle Y Position vs Frame')
grid on

%% Figure 9: Correlation Coefficient vs Frame
figure
plot(1:nt,rvals,'LineWidth',2)

xlabel('Frame Number')
ylabel('Correlation Coefficient')

title('Correlation Coefficient vs Frame')

grid on

end