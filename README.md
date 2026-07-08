# Automated-Vehicle-Tracking-Traffic-Analysis
Computer vision project for automated vehicle tracking and traffic analysis in MATLAB using image processing, template matching, trajectory tracking, and speed estimation.
## Features
- Video reading and grayscale conversion
- Gaussian-like smoothing filter
- Manual vehicle template selection
- Normalized template matching
- Vehicle trajectory tracking
- Speed estimation from frame positions
- Fourier analysis of speed signal

## Technologies Used
- MATLAB
- Image Processing
- Template Matching
- Discrete Fourier Transform
- Video Processing

## Project Pipeline
1. Read traffic video
2. Convert frames to grayscale
3. Smooth video frames
4. Select vehicle template
5. Perform template matching
6. Track vehicle position
7. Estimate speed
8. Analyze speed using DFT

## Results
Add screenshots here:
- Selected vehicle template
- Correlation map
- Vehicle trajectory
- Speed plot
- DFT spectrum

## How to Run
1. Open MATLAB.
2. Place `TrafficVideo.mp4` in the project folder.
3. Run:

```matlab
Main_Project\
Author
James Vashiri

## Git commands

```bash
git init
git add .
git commit -m "Initial commit: MATLAB vehicle tracking project"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/Automated-Vehicle-Tracking-Traffic-Analysis-MATLAB.git
git push -u origin main
