function [oStats] = findGlcmStatistic(iHe)
%% FINDGLCMSTATISTIC 
% Find a glcm statistics of image *iHe* based on R,G,B,RG,RB,GB
% components.
% 
% * Syntax 
% 
%	[OSTATS] = FINDGLCMSTATISTIC(IHE)
% 
% * Input 
% 
% -- iHe - image which glcm statistics want to find.
% 
% * Output 
% 
% -- oStats - finded glcm statistics of image.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% List related files here 
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 21/10/2018 20:10:14 
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a 
% 
% * Warning: 
% 
% # Warnings list. 
% 
% * TODO: 
% 
% # TODO list. 
% 

%% Code 

%% Getting R, G, B, RG, RB, GB components
% Extracting r,g,b components from image
r = iHe(:, :, 1);
g = iHe(:, :, 2);
b = iHe(:, :, 3);

% Calculating inter_channel_matrix
rgb_image = im2double(iHe);
% Display current image on the screen
%figure, imshow(iHe);

% Adding to R, G, B arrays image values
fR = rgb_image(:, :, 1);
fG = rgb_image(:, :, 2);
fB = rgb_image(:, :, 3);

% Calculating intra_channel_matrix by subtracting matrices
fRG = fR - fG;
fRB = fR - fB;
fGB = fG - fB;

% Median filtering of R, G, B components
iHef(:, :, 1) = medfilt2(r);
iHef(:, :, 2) = medfilt2(g);
iHef(:, :, 3) = medfilt2(b);

%% Calculating glcm and statistics for color components
% R,G,B (inter_channel)

% Calculating the glcm matrices for R, G, B components
% Calculating the statistical characteristics of glcm's
glcm = graycomatrix(iHef(:, :, 1), 'Offset',[2 0; 0 2]);
oStats.R = graycoprops(glcm);
glcm = graycomatrix(iHef(:, :, 2), 'Offset',[2 0; 0 2]);
oStats.G = graycoprops(glcm);
glcm = graycomatrix(iHef(:, :, 3), 'Offset',[2 0; 0 2]);
oStats.B = graycoprops(glcm);

%% Calculating glcm and statistics for difference components
% RG, RB, GB (intra_channel)

% Calculating the glcm matrices for RG, RB, GB components
% Calculating the statistical characteristics of glcm's
glcm = graycomatrix(fRG, 'Offset', [2 0; 0 2]);
oStats.RG = graycoprops(glcm);
glcm = graycomatrix(fRB, 'Offset', [2 0; 0 2]);
oStats.RB = graycoprops(glcm);
glcm = graycomatrix(fGB, 'Offset', [2 0; 0 2]);
oStats.GB = graycoprops(glcm);

end
