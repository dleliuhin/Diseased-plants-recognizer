%��������� ���������� 48 �������������� �������� ���������
%������� ���������� �����������
%���������� glcm � ���������� ��� �������� ������������
%R,G,B (inter_channel)� ��� ���������� ������������ R-G, R-B, G-B, (intra_channel)
%���������� ����� ��������� ������ R, B, G

clc;
clear;
close all;

%This works only for Windows!!!
%Change adding subfolders as your system configurations
addpath(strcat(pwd,'\TransformModule'),strcat(pwd,'\AdditionalModule'),'-end');
savepath;
addpath(strcat(pwd,'\GraphicalModule'),strcat(pwd,'\ReadnWriteModule'),'-end');
savepath;

f = dir('Material/Healthy/*.jpg');
fd = dir('Material/Diseased/*.jpg');

f=[f;fd];

fileName = {f.name};

[h,nh] = initialStats();

for i = 1:length(f(:))

clc;

%�������������� ����� ����������� mini, ���������� �� ��������������
%����������� ����� ��������������� � ����������� ����������� 
%�������� � 10 ���, ����� ����������� ����������� mini
%���� ����� 100*300 ��������
%��� ��������������� ����� ����������, ����� ����������� ����������� 
% ����� �������� �� ���� ������������ ���� �� ����� � ��� ��

if (i <= (length(f(:))/2))
    he = imread(fullfile('Material/Healthy',f(i).name));
else
    he = imread(fullfile('Material/Diseased',f(i).name));%��������
end

%he = imrotate(he, 90);
%he = imread('1h_mini.bmp');%�������� ��������
%he = imresize(he,[255 255]);
%he=imcrop(he);%��������� �������, ���������� ������ ������������� ����
%(��� ��� �����), ��� ����, ����� �������������� ������� �������

%��������� r,g,b ���������
r=he(:,:,1);
g=he(:,:,2);
b=he(:,:,3);

%���������� inter_channel_matrix
rgb_image=im2double(he);%�������������� ��������� ����������� � ������ double
figure, imshow(he);

fR = rgb_image (:, :, 1);
fG = rgb_image (:, :, 2);
fB = rgb_image (:, :, 3);

%���������� intra_channel_matrix ����� ��������� ������
fRG=fR-fG;
fRB=fR-fB;
fGB=fG-fB;

% figure;subplot(2,2,1);hist(fR,11);title('fR');
%        subplot(2,2,2);hist(fG,11);title('fG');
%        subplot(2,2,3);hist(fB,11);title('fB');

hef(:,:,1)=medfilt2(r);%��������� ����������
hef(:,:,2)=medfilt2(g);
hef(:,:,3)=medfilt2(b);

%��������� ����������� �����������
% he1(:,:,1)=adapthisteq(hef(:,:,1),'cliplimit',0.02,'Distribution','rayleigh');
% he1(:,:,2)=adapthisteq(hef(:,:,2),'cliplimit',0.02,'Distribution','rayleigh');
% he1(:,:,3)=adapthisteq(hef(:,:,3),'cliplimit',0.02,'Distribution','rayleigh');
% 
% featurecolor.2R= imhist(he1(:,:,1)); 
% featurecolor.2G= imhist(he1(:,:,2)); 
% featurecolor.2B= imhist(he1(:,:,3)); 
% figure,subplot(2,2,1);hist(featurecolor2R,9);title('featurecolor2R');
%        subplot(2,2,2);hist(featurecolor2G,9);title('featurecolor2G');
%        subplot(2,2,3);hist(featurecolor2B,9);title('featurecolor2B');

% heff(:,:,1)=adapthisteq(r,'cliplimit',0.02,'Distribution','rayleigh');
% heff(:,:,2)=adapthisteq(g,'cliplimit',0.02,'Distribution','rayleigh');
% heff(:,:,3)=adapthisteq(b,'cliplimit',0.02,'Distribution','rayleigh');

% figure,subplot(2,3,1);imshow(he);title('orginal image');
%        subplot(2,3,2);imshow(hef);title(' Median fliter');
%        subplot(2,3,3);imshow(heff);title(' adaptive Histogram Equalization');
%        subplot(2,3,5);imshow(he1);title('Median fliter + adaptive Histogram Equalization');

% adapthisteqR= imhist(heff(:,:,1)); 
% adapthisteqG= imhist(heff(:,:,2)); 
% adapthisteqB= imhist(heff(:,:,3)); 
% figure,subplot(2,2,1);hist(adapthisteqR,9);title('adapthisteqR');
%        subplot(2,2,2);hist(adapthisteqG,9);title('adapthisteqG');
%        subplot(2,2,3);hist(adapthisteqB,9);title('adapthisteqB');
     
% figure,subplot(2,2,1);imshow(he1(:,:,1));title('adapthisteq-R');
%        subplot(2,2,2);imshow(he1(:,:,1));title('adapthisteq-G');
%        subplot(2,2,3);imshow(he1(:,:,1));title('adapthisteq-B');

%���������� glcm � ���������� ��� �������� ������������
%R,G,B (inter_channel)
glcm = graycomatrix(hef(:,:,1), 'Offset',[2 0;0 2]);%���������� ������� glcm
stats.R = graycoprops(glcm);%���������� �������������� ������������� glcm
glcm = graycomatrix(hef(:,:,2), 'Offset',[2 0;0 2]);%���������� ������� glcm
stats.G = graycoprops(glcm);%���������� �������������� ������������� glcm
glcm = graycomatrix(hef(:,:,3), 'Offset',[2 0;0 2]);%���������� ������� glcm
stats.B = graycoprops(glcm);%���������� �������������� ������������� glcm

%���������� glcm � ���������� ��� ���������� ������������ RG, RB, GB, (intra_channel)
%���������� ����� ��������� ������ fR, fB, fG
glcm = graycomatrix(fRG, 'Offset',[2 0;0 2]);%���������� ������� glcm
stats.RG = graycoprops(glcm);%���������� �������������� ������������� glcm
glcm = graycomatrix(fRB, 'Offset',[2 0;0 2]);%���������� ������� glcm
stats.RB = graycoprops(glcm);%���������� �������������� ������������� glcm
glcm = graycomatrix(fGB, 'Offset',[2 0;0 2]);%���������� ������� glcm
stats.GB = graycoprops(glcm);%���������� �������������� ������������� glcms   

if(i <= (length(f(:))/2))        
    h=rewriteHealthy(h,stats);
else
    nh=rewriteDiseased(nh,stats);        
end

%writeXlsxData(fileName,i,stats);

% pause;
clear stats r g b rgb_image;
clear fR fG fB fRG fRB fGB glcm;
clear he hef;
close all;
end

[h,nh] = checkStatsNan(h,nh);

%-----------------------Finding averages attributes-------------------

averAtrb(h,nh);

%----------------------Aligning ranges of arrays--------------------

%[h,nh]=alignRanges(h,nh);

%����������� ���-�� �������� �� �����������
numbns = 13;
%-----------------------Finding supremums--------------------------------

sup=writeXlsxSup(numbns,h,nh);

numbns = 5;
typeApproximation = 'gauss1';
coefStd = 1;

%Plot graphical results using Gaussian method
graphGaussModule(h,nh,typeApproximation,numbns,coefStd)
close all;

%Plot graphical results using Spline method
graphSplineModule(h,nh,numbns)
close all;