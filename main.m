%Программа вычисления 48 статистических ключевых признаков
%цветных текстурных изображений
%Вычисление glcm и статистики для цветовых составляющих
%R,G,B (inter_channel)и для разностных составляющих R-G, R-B, G-B, (intra_channel)
%полученных путем вычитания матриц R, B, G

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

%Обрабатываться будут изображения mini, полученные из полноформатных
%изображений путем масштабирования с уменьшением размерности 
%примерно в 10 раз, чтобы размерность изображения mini
%была около 100*300 пикселов
%При масштабировании нужно стремиться, чтобы размерность изображения 
% листа растения на всех изображениях была бы одной и той же

if (i <= (length(f(:))/2))
    he = imread(fullfile('Material/Healthy',f(i).name));
else
    he = imread(fullfile('Material/Diseased',f(i).name));%растение
end

%he = imrotate(he, 90);
%he = imread('1h_mini.bmp');%здоровое растение
%he = imresize(he,[255 255]);
%he=imcrop(he);%вырезание области, содержащей только анализируемый лист
%(или его часть), для того, чтобы минимизировать фоновую область

%выделение r,g,b компонент
r=he(:,:,1);
g=he(:,:,2);
b=he(:,:,3);

%вычисление inter_channel_matrix
rgb_image=im2double(he);%преобразование элементов изображения в формат double
figure, imshow(he);

fR = rgb_image (:, :, 1);
fG = rgb_image (:, :, 2);
fB = rgb_image (:, :, 3);

%вычисление intra_channel_matrix путем вычитания матриц
fRG=fR-fG;
fRB=fR-fB;
fGB=fG-fB;

% figure;subplot(2,2,1);hist(fR,11);title('fR');
%        subplot(2,2,2);hist(fG,11);title('fG');
%        subplot(2,2,3);hist(fB,11);title('fB');

hef(:,:,1)=medfilt2(r);%медианная фильтрация
hef(:,:,2)=medfilt2(g);
hef(:,:,3)=medfilt2(b);

%адативная эквализация гистограммы
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

%Вычисление glcm и статистики для цветовых составляющих
%R,G,B (inter_channel)
glcm = graycomatrix(hef(:,:,1), 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats.R = graycoprops(glcm);%вычисление статистических характеристик glcm
glcm = graycomatrix(hef(:,:,2), 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats.G = graycoprops(glcm);%вычисление статистических характеристик glcm
glcm = graycomatrix(hef(:,:,3), 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats.B = graycoprops(glcm);%вычисление статистических характеристик glcm

%Вычисление glcm и статистики для разностных составляющих RG, RB, GB, (intra_channel)
%полученных путем вычитания матриц fR, fB, fG
glcm = graycomatrix(fRG, 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats.RG = graycoprops(glcm);%вычисление статистических характеристик glcm
glcm = graycomatrix(fRB, 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats.RB = graycoprops(glcm);%вычисление статистических характеристик glcm
glcm = graycomatrix(fGB, 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats.GB = graycoprops(glcm);%вычисление статистических характеристик glcms   

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

%Оптимальное кол-во столбцов на гистограмме
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