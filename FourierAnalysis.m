function FourierAnalysis(speed)

% FourierAnalysis
% Computes DFT of vehicle speed signal

n = length(speed);

%% DFT

F = fft(speed);

Mag = abs(F);

freq = 0:n-1;

%% Figure 11: Speed Signal

figure
plot(speed,'LineWidth',2)

xlabel('Frame Number')
ylabel('Speed (pixels/sec)')
title('Vehicle Speed Signal')

grid on

%% Figure 12: Fourier Magnitude Spectrum

figure
plot(freq,Mag,'LineWidth',2)

xlabel('Frequency Index')
ylabel('Magnitude')

title('DFT Magnitude Spectrum of Vehicle Speed')

grid on

end