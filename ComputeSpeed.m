function speed = ComputeSpeed(xpos,ypos,frameRate)
% ComputeSpeed
% Computes vehicle speed in pixels per second from tracked positions.

%% Checking inputs
if nargin < 3
    error('Usage: speed = ComputeSpeed(xpos,ypos,frameRate)');
end

nt = length(xpos);

speed = zeros(nt-1,1);

%% Computing frame-to-frame distance and speed
for t = 1:nt-1

    dx = xpos(t+1) - xpos(t);
    dy = ypos(t+1) - ypos(t);

    distance = sqrt(dx^2 + dy^2);

    speed(t) = distance * frameRate;

end

%% Figure 10: Speed vs Frame
figure
plot(1:nt-1,speed,'LineWidth',2)
xlabel('Frame Number')
ylabel('Speed (pixels/second)')
title('Estimated Vehicle Speed vs Frame')
grid on

end