%Программа вычисления 48 статистических ключевых признаков
%цветных текстурных изображений
%Вычисление glcm и статистики для цветовых составляющих
%R,G,B (inter_channel)и для разностных составляющих R-G, R-B, G-B, (intra_channel)
%полученных путем вычитания матриц R, B, G

clc;
clear;
close all;

f = dir('Healthy/*.jpg');
fd = dir('Diseased/*.jpg');

f=[f;fd];

fileName = {f.name};

[h,nh] = initialStats();

for i = 1:length(f(:))

clc;

%Обрабатываться будут изображения mini, полученные из полноформатных
%изображений путем масштабирования с уменьшением размерности 
%примерно в 10 раз, чтобы размерность изображения mini
%была около 300х500 пикселов
%При масштабировании нужно стремиться, чтобы размерность изображения 
% листа растения на всех изображениях была бы одной и той же

if (i <= (length(f(:))/2))
    he = imread(fullfile('Healthy',f(i).name));
else
    he = imread(fullfile('Diseased',f(i).name));%растение
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
he1(:,:,1)=adapthisteq(hef(:,:,1),'cliplimit',0.02,'Distribution','rayleigh');
he1(:,:,2)=adapthisteq(hef(:,:,2),'cliplimit',0.02,'Distribution','rayleigh');
he1(:,:,3)=adapthisteq(hef(:,:,3),'cliplimit',0.02,'Distribution','rayleigh');

featurecolor2R= imhist(he1(:,:,1)); 
featurecolor2G= imhist(he1(:,:,2)); 
featurecolor2B= imhist(he1(:,:,3)); 
% figure,subplot(2,2,1);hist(featurecolor2R,9);title('featurecolor2R');
%        subplot(2,2,2);hist(featurecolor2G,9);title('featurecolor2G');
%        subplot(2,2,3);hist(featurecolor2B,9);title('featurecolor2B');

heff(:,:,1)=adapthisteq(r,'cliplimit',0.02,'Distribution','rayleigh');
heff(:,:,2)=adapthisteq(g,'cliplimit',0.02,'Distribution','rayleigh');
heff(:,:,3)=adapthisteq(b,'cliplimit',0.02,'Distribution','rayleigh');

% figure,subplot(2,3,1);imshow(he);title('orginal image');
%        subplot(2,3,2);imshow(hef);title(' Median fliter');
%        subplot(2,3,3);imshow(heff);title(' adaptive Histogram Equalization');
%        subplot(2,3,5);imshow(he1);title('Median fliter + adaptive Histogram Equalization');

adapthisteqR= imhist(heff(:,:,1)); 
adapthisteqG= imhist(heff(:,:,2)); 
adapthisteqB= imhist(heff(:,:,3)); 
% figure,subplot(2,2,1);hist(adapthisteqR,9);title('adapthisteqR');
%        subplot(2,2,2);hist(adapthisteqG,9);title('adapthisteqG');
%        subplot(2,2,3);hist(adapthisteqB,9);title('adapthisteqB');
     

% figure,subplot(2,2,1);imshow(he1(:,:,1));title('adapthisteq-R');
%        subplot(2,2,2);imshow(he1(:,:,1));title('adapthisteq-G');
%        subplot(2,2,3);imshow(he1(:,:,1));title('adapthisteq-B');
      

%Вычисление glcm и статистики для цветовых составляющих
%R,G,B (inter_channel)
glcm = graycomatrix(hef(:,:,1), 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats_R = graycoprops(glcm);%вычисление статистических характеристик glcm
glcm = graycomatrix(hef(:,:,2), 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats_G = graycoprops(glcm);%вычисление статистических характеристик glcm
glcm = graycomatrix(hef(:,:,3), 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats_B = graycoprops(glcm);%вычисление статистических характеристик glcm

%Вычисление glcm и статистики для разностных составляющих RG, RB, GB, (intra_channel)
%полученных путем вычитания матриц fR, fB, fG
glcm = graycomatrix(fRG, 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats_RG = graycoprops(glcm);%вычисление статистических характеристик glcm
glcm = graycomatrix(fRB, 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats_RB = graycoprops(glcm);%вычисление статистических характеристик glcm
glcm = graycomatrix(fGB, 'Offset',[2 0;0 2]);%вычисление матрицы glcm
stats_GB = graycoprops(glcm);%вычисление статистических характеристик glcm
    

if(i <= (length(f(:))/2))        
    hR.Contrast(end+1) = stats_R.Contrast(1);
    hR.Correlation(end+1) = stats_R.Correlation(1);
    hR.Energy(end+1) = stats_R.Energy(1);
    hR.Homogeneity(end+1) = stats_R.Homogeneity(1); 
    
    hG.Contrast(end+1) = stats_G.Contrast(1);
    hG.Correlation(end+1) = stats_G.Correlation(1);
    hG.Energy(end+1) = stats_G.Energy(1);
    hG.Homogeneity(end+1) = stats_G.Homogeneity(1);    
    
    hB.Contrast(end+1) = stats_G.Contrast(1);
    hB.Correlation(end+1) = stats_G.Correlation(1);
    hB.Energy(end+1) = stats_G.Energy(1);
    hB.Homogeneity(end+1) = stats_G.Homogeneity(1);    
    
    hRG.Contrast(end+1) = stats_RG.Contrast(1);
    hRG.Correlation(end+1) = stats_RG.Correlation(1);
    hRG.Energy(end+1) = stats_RG.Energy(1);
    hRG.Homogeneity(end+1) = stats_RG.Homogeneity(1);    
    
    hRB.Contrast(end+1) = stats_RB.Contrast(1);
    hRB.Correlation(end+1) = stats_RB.Correlation(1);
    hRB.Energy(end+1) = stats_RB.Energy(1);
    hRB.Homogeneity(end+1) = stats_RB.Homogeneity(1);
    
    hGB.Contrast(end+1) = stats_GB.Contrast(1);
    hGB.Correlation(end+1) = stats_GB.Correlation(1);
    hGB.Energy(end+1) = stats_GB.Energy(1);
    hGB.Homogeneity(end+1) = stats_GB.Homogeneity(1);    
else
    nhR.Contrast(end+1) = stats_R.Contrast(1);
    nhR.Correlation(end+1) = stats_R.Correlation(1);
    nhR.Energy(end+1) = stats_R.Energy(1);
    nhR.Homogeneity(end+1) = stats_R.Homogeneity(1);
    
    nhG.Contrast(end+1) = stats_G.Contrast(1);
    nhG.Correlation(end+1) = stats_G.Correlation(1);
    nhG.Energy(end+1) = stats_G.Energy(1);
    nhG.Homogeneity(end+1) = stats_G.Homogeneity(1);    
    
    nhB.Contrast(end+1) = stats_B.Contrast(1);
    nhB.Correlation(end+1) = stats_B.Correlation(1);
    nhB.Energy(end+1) = stats_B.Energy(1);
    nhB.Homogeneity(end+1) = stats_B.Homogeneity(1);    
    
    nhRG.Contrast(end+1) = stats_RG.Contrast(1);
    nhRG.Correlation(end+1) = stats_RG.Correlation(1);
    nhRG.Energy(end+1) = stats_RG.Energy(1);
    nhRG.Homogeneity(end+1) = stats_RG.Homogeneity(1);    
    
    nhRB.Contrast(end+1) = stats_RB.Contrast(1);
    nhRB.Correlation(end+1) = stats_RB.Correlation(1);
    nhRB.Energy(end+1) = stats_RB.Energy(1);
    nhRB.Homogeneity(end+1) = stats_RB.Homogeneity(1);
    
    nhGB.Contrast(end+1) = stats_GB.Contrast(1);
    nhGB.Correlation(end+1) = stats_GB.Correlation(1);
    nhGB.Energy(end+1) = stats_GB.Energy(1);
    nhGB.Homogeneity(end+1) = stats_GB.Homogeneity(1);        
end

xlswrite('Results.xlsx', fileName(i), 1, strcat('A',num2str(2+(i-1)*4)));

xlswrite('Results.xlsx', stats_R.Contrast, 1, strcat('C',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats_R.Correlation, 1, strcat('C',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats_R.Energy, 1, strcat('C',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats_R.Homogeneity, 1, strcat('C',num2str(5+(i-1)*4)));

xlswrite('Results.xlsx', stats_G.Contrast, 1, strcat('E',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats_G.Correlation, 1, strcat('E',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats_G.Energy, 1, strcat('E',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats_G.Homogeneity, 1, strcat('E',num2str(5+(i-1)*4)));

xlswrite('Results.xlsx', stats_B.Contrast, 1, strcat('G',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats_B.Correlation, 1, strcat('G',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats_B.Energy, 1, strcat('G',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats_B.Homogeneity, 1, strcat('G',num2str(5+(i-1)*4)));

xlswrite('Results.xlsx', stats_RG.Contrast, 1, strcat('I',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats_RG.Correlation, 1, strcat('I',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats_RG.Energy, 1, strcat('I',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats_RG.Homogeneity, 1, strcat('I',num2str(5+(i-1)*4)));

xlswrite('Results.xlsx', stats_RB.Contrast, 1, strcat('K',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats_RB.Correlation, 1, strcat('K',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats_RB.Energy, 1, strcat('K',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats_RB.Homogeneity, 1, strcat('K',num2str(5+(i-1)*4)));

xlswrite('Results.xlsx', stats_GB.Contrast, 1, strcat('M',num2str(2+(i-1)*4)));
xlswrite('Results.xlsx', stats_GB.Correlation, 1, strcat('M',num2str(3+(i-1)*4)));
xlswrite('Results.xlsx', stats_GB.Energy, 1, strcat('M',num2str(4+(i-1)*4)));
xlswrite('Results.xlsx', stats_GB.Homogeneity, 1, strcat('M',num2str(5+(i-1)*4)));

% pause;
clear stats_R stats_G stats_B stats_GB stats_RB stats_RG;
clear adapthisteqB adapthisteqG adapthisteqR g r rgb_image;
clear b fB fG fGB fR fRB fRG g glcm;
clear featurecolor2B featurecolor2G featurecolor2R; 
clear he he1 hef heff featurecolor2B featurecolor2G featurecolor2R; 
close all;
end

%-----------------------Finding averages attributes-------------------

averAtrb(hR,hG,hB,hRG,hRB,hGB,nhR,nhG,nhB,nhRG,nhRB,nhGB);

%----------------------Aligning ranges of arrays--------------------
[h_R_Contrast1,nh_R_Contrast1]=histdimcompare(h_R_Contrast1,nh_R_Contrast1);
[h_R_Correlation1,nh_R_Correlation1]=histdimcompare(h_R_Correlation1,nh_R_Correlation1);
[h_R_Energy1,nh_R_Energy1]=histdimcompare(h_R_Energy1,nh_R_Energy1);
[h_R_Homogeneity1,nh_R_Homogeneity1]=histdimcompare(h_R_Homogeneity1,nh_R_Homogeneity1);

[h_G_Contrast1,nh_G_Contrast1]=histdimcompare(h_G_Contrast1,nh_G_Contrast1);
[h_G_Correlation1,nh_G_Correlation1]=histdimcompare(h_G_Correlation1,nh_G_Correlation1);
[h_G_Energy1,nh_G_Energy1]=histdimcompare(h_G_Energy1,nh_G_Energy1);
[h_G_Homogeneity1,nh_G_Homogeneity1]=histdimcompare(h_G_Homogeneity1,nh_G_Homogeneity1);

[h_B_Contrast1,nh_B_Contrast1]=histdimcompare(h_B_Contrast1,nh_B_Contrast1);
[h_B_Correlation1,nh_B_Correlation1]=histdimcompare(h_B_Correlation1,nh_B_Correlation1);
[h_B_Energy1,nh_B_Energy1]=histdimcompare(h_B_Energy1,nh_B_Energy1);
[h_B_Homogeneity1,nh_B_Homogeneity1]=histdimcompare(h_B_Homogeneity1,nh_B_Homogeneity1);

[h_RG_Contrast1,nh_RG_Contrast1]=histdimcompare(h_RG_Contrast1,nh_RG_Contrast1);
[h_RG_Correlation1,nh_RG_Correlation1]=histdimcompare(h_RG_Correlation1,nh_RG_Correlation1);
[h_RG_Energy1,nh_RG_Energy1]=histdimcompare(h_RG_Energy1,nh_RG_Energy1);
[h_RG_Homogeneity1,nh_RG_Homogeneity1]=histdimcompare(h_RG_Homogeneity1,nh_RG_Homogeneity1);

[h_RB_Contrast1,nh_RB_Contrast1]=histdimcompare(h_RB_Contrast1,nh_RB_Contrast1);
[h_RB_Correlation1,nh_RB_Correlation1]=histdimcompare(h_RB_Correlation1,nh_RB_Correlation1);
[h_RB_Energy1,nh_RB_Energy1]=histdimcompare(h_RB_Energy1,nh_RB_Energy1);
[h_RB_Homogeneity1,nh_RB_Homogeneity1]=histdimcompare(h_RB_Homogeneity1,nh_RB_Homogeneity1);

[h_GB_Contrast1,nh_GB_Contrast1]=histdimcompare(h_GB_Contrast1,nh_GB_Contrast1);
[h_GB_Correlation1,nh_GB_Correlation1]=histdimcompare(h_GB_Correlation1,nh_GB_Correlation1);
[h_GB_Energy1,nh_GB_Energy1]=histdimcompare(h_GB_Energy1,nh_GB_Energy1);
[h_GB_Homogeneity1,nh_GB_Homogeneity1]=histdimcompare(h_GB_Homogeneity1,nh_GB_Homogeneity1);

%Оптимальное кол-во столбцов на гистограмме
numbns = 15;

%-----------------------Finding supremums--------------------------------
xlswrite('Results.xlsx', numbns, 1, strcat('R',num2str(1)));
sup_R_Contrast1 = findsupremum(h_R_Contrast1,nh_R_Contrast1,numbns);
xlswrite('Results.xlsx', sup_R_Contrast1, 1, strcat('R',num2str(3)));
sup_R_Correlation1 = findsupremum(h_R_Correlation1,nh_R_Correlation1,numbns);
xlswrite('Results.xlsx', sup_R_Correlation1, 1, strcat('R',num2str(4)));
sup_R_Energy1 = findsupremum(h_R_Energy1,nh_R_Energy1,numbns);
xlswrite('Results.xlsx', sup_R_Energy1, 1, strcat('R',num2str(5)));
sup_R_Homogeneity1 = findsupremum(h_R_Homogeneity1,nh_R_Homogeneity1,numbns);
xlswrite('Results.xlsx', sup_R_Homogeneity1, 1, strcat('R',num2str(6)));

sup_G_Contrast1 = findsupremum(h_G_Contrast1,nh_G_Contrast1,numbns);
xlswrite('Results.xlsx', sup_G_Contrast1, 1, strcat('T',num2str(3)));
sup_G_Correlation1 = findsupremum(h_G_Correlation1,nh_G_Correlation1,numbns);
xlswrite('Results.xlsx', sup_G_Correlation1, 1, strcat('T',num2str(4)));
sup_G_Energy1 = findsupremum(h_G_Energy1,nh_G_Energy1,numbns);
xlswrite('Results.xlsx', sup_G_Energy1, 1, strcat('T',num2str(5)));
sup_G_Homogeneity1 = findsupremum(h_G_Homogeneity1,nh_G_Homogeneity1,numbns);
xlswrite('Results.xlsx', sup_G_Homogeneity1, 1, strcat('T',num2str(6)));

sup_B_Contrast1 = findsupremum(h_B_Contrast1,nh_B_Contrast1,numbns);
xlswrite('Results.xlsx', sup_B_Contrast1, 1, strcat('V',num2str(3)));
sup_B_Correlation1 = findsupremum(h_B_Correlation1,nh_B_Correlation1,numbns);
xlswrite('Results.xlsx', sup_B_Correlation1, 1, strcat('V',num2str(4)));
sup_B_Energy1 = findsupremum(h_B_Energy1,nh_B_Energy1,numbns);
xlswrite('Results.xlsx', sup_B_Energy1, 1, strcat('V',num2str(5)));
sup_B_Homogeneity1 = findsupremum(h_B_Homogeneity1,nh_B_Homogeneity1,numbns);
xlswrite('Results.xlsx', sup_B_Homogeneity1, 1, strcat('V',num2str(6)));

sup_RG_Contrast1 = findsupremum(h_RG_Contrast1,nh_RG_Contrast1,numbns);
xlswrite('Results.xlsx', sup_RG_Contrast1, 1, strcat('X',num2str(3)));
sup_RG_Correlation1 = findsupremum(h_RG_Correlation1,nh_RG_Correlation1,numbns);
xlswrite('Results.xlsx', sup_RG_Correlation1, 1, strcat('X',num2str(4)));
sup_RG_Energy1 = findsupremum(h_RG_Energy1,nh_RG_Energy1,numbns);
xlswrite('Results.xlsx', sup_RG_Energy1, 1, strcat('X',num2str(5)));
sup_RG_Homogeneity1 = findsupremum(h_RG_Homogeneity1,nh_RG_Homogeneity1,numbns);
xlswrite('Results.xlsx', sup_RG_Homogeneity1, 1, strcat('X',num2str(6)));

sup_RB_Contrast1 = findsupremum(h_RB_Contrast1,nh_RB_Contrast1,numbns);
xlswrite('Results.xlsx', sup_RB_Contrast1, 1, strcat('Z',num2str(3)));
sup_RB_Correlation1 = findsupremum(h_RB_Correlation1,nh_RB_Correlation1,numbns);
xlswrite('Results.xlsx', sup_RB_Correlation1, 1, strcat('Z',num2str(4)));
sup_RB_Energy1 = findsupremum(h_RB_Energy1,nh_RB_Energy1,numbns);
xlswrite('Results.xlsx', sup_RB_Energy1, 1, strcat('Z',num2str(5)));
sup_RB_Homogeneity1 = findsupremum(h_RB_Homogeneity1,nh_RB_Homogeneity1,numbns);
xlswrite('Results.xlsx', sup_RB_Homogeneity1, 1, strcat('Z',num2str(6)));

sup_GB_Contrast1 = findsupremum(h_GB_Contrast1,nh_GB_Contrast1,numbns);
xlswrite('Results.xlsx', sup_GB_Contrast1, 1, strcat('AB',num2str(3)));
sup_GB_Correlation1 = findsupremum(h_GB_Correlation1,nh_GB_Correlation1,numbns);
xlswrite('Results.xlsx', sup_GB_Correlation1, 1, strcat('AB',num2str(4)));
sup_GB_Energy1 = findsupremum(h_GB_Energy1,nh_GB_Energy1,numbns);
xlswrite('Results.xlsx', sup_GB_Energy1, 1, strcat('AB',num2str(5)));
sup_GB_Homogeneity1 = findsupremum(h_GB_Homogeneity1,nh_GB_Homogeneity1,numbns);
xlswrite('Results.xlsx', sup_GB_Homogeneity1, 1, strcat('AB',num2str(6)));

%-----------------Stats_R histogram-----------------------------------
%Оптимальное кол-во столбцов на гистограмме
typeApproximation = 'gauss2';

figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
%histogram(nh_R_Contrast1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_R_Contrast1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_R.Contrast','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
%legend(nh_pl,'points','Больное растение');
hold on;
%histogram(h_R_Contrast1,'FaceColor','b','NumBins',numbns);
[h_num, h_edges] = histcounts(h_R_Contrast1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение','Location','Best');
%annotation('textbox',[.1 .2 .2 .2],'String',['Супремум: ', num2str(round(sup_R_Contrast1,3))],'HorizontalAlignment','left');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,2);
%histogram(nh_R_Correlation1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_R_Correlation1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_R.Correlation','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_R_Correlation1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_R_Correlation1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение','Location','Best');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,3);
%histogram(nh_R_Energy1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_R_Energy1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_R.Energy','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_R_Energy1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_R_Energy1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение','Location','Best');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,4);
%histogram(nh_R_Homogeneity1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_R_Homogeneity1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_R.Homogeneity','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_R_Homogeneity1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_R_Homogeneity1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение','Location','Best');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'R.jpg');
saveas(gcf,'R.fig');

%-----------------Stats_G histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
%histogram(nh_G_Contrast1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_G_Contrast1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_G.Contrast','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_G_Contrast1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_G_Contrast1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,2);
%histogram(nh_G_Correlation1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_G_Correlation1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_G.Correlation','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_G_Correlation1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_G_Correlation1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,3);
%histogram(nh_G_Energy1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_G_Energy1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_G.Energy','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_G_Energy1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_G_Energy1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,4);
%histogram(nh_G_Homogeneity1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_G_Homogeneity1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_G.Homogeneity','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_G_Homogeneity1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_G_Homogeneity1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'G.jpg');
saveas(gcf,'G.fig');

%-----------------Stats_B histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
%histogram(nh_B_Contrast1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_B_Contrast1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_B.Contrast','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_B_Contrast1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_B_Contrast1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,2);
%histogram(nh_B_Correlation1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_B_Correlation1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_B.Correlation','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_B_Correlation1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_B_Correlation1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,3);
%histogram(nh_B_Energy1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_B_Energy1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]); 
title('Гистограмма stats_B.Energy','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_B_Energy1,'FaceColor','b','NumBins',numbns);
[h_num, h_edges] = histcounts(h_B_Energy1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,4);
%histogram(nh_B_Homogeneity1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_B_Homogeneity1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]); 
title('Гистограмма stats_B.Homogeneity','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_B_Homogeneity1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_B_Homogeneity1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'B.jpg');
saveas(gcf,'B.fig');

%-----------------Stats_RG histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
%histogram(nh_RG_Contrast1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_RG_Contrast1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_RG.Contrast','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_RG_Contrast1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_RG_Contrast1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,2);
%histogram(nh_RG_Correlation1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_RG_Correlation1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_RG.Correlation','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_RG_Correlation1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_RG_Correlation1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,3);
%histogram(nh_RG_Energy1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_RG_Energy1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_RG.Energy','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_RG_Energy1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_RG_Energy1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,4);
%histogram(nh_RG_Homogeneity1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_RG_Homogeneity1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_RG.Homogeneity','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_RG_Homogeneity1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_RG_Homogeneity1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'RG.jpg');
saveas(gcf,'RG.fig');

%-----------------Stats_RB histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
%histogram(nh_RB_Contrast1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_RB_Contrast1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_RB.Contrast','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_RB_Contrast1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_RB_Contrast1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,2);
%histogram(nh_RB_Correlation1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_RB_Correlation1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_RB.Correlation','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_RB_Correlation1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_RB_Correlation1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,3);
%histogram(nh_RB_Energy1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_RB_Energy1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_RB.Energy','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_RB_Energy1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_RB_Energy1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,4);
%histogram(nh_RB_Homogeneity1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_RB_Homogeneity1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_RB.Homogeneity','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_RB_Homogeneity1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_RB_Homogeneity1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'RB.jpg');
saveas(gcf,'RB.fig');

%-----------------Stats_GB histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
%histogram(nh_GB_Contrast1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_GB_Contrast1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_GB.Contrast','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_GB_Contrast1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_GB_Contrast1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,2);
%histogram(nh_GB_Correlation1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_GB_Correlation1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_GB.Correlation','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_GB_Correlation1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_GB_Correlation1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,3);
%histogram(nh_GB_Energy1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_GB_Energy1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_GB.Energy','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_GB_Energy1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_GB_Energy1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];

subplot(2,2,4);
%histogram(nh_GB_Homogeneity1,'FaceColor','r','NumBins',numbns);
[nh_num, nh_edges] = histcounts(nh_GB_Homogeneity1, numbns);
nh_edges = findInterBins(nh_edges);
nh_num = nh_num'; nh_edges = nh_edges';
nh_f = fit(nh_edges, nh_num, typeApproximation);
plot(nh_f,'r-',nh_edges, nh_num,'r.');
xlim([0,1]); ylim([0,inf]);
title('Гистограмма stats_GB.Homogeneity','fontsize',10);
xlabel('x'); ylabel('f(x)', 'rotation', 1);
hold on;
%histogram(h_GB_Homogeneity1,'FaceColor','b','NumBins',numbns); 
[h_num, h_edges] = histcounts(h_GB_Homogeneity1, numbns);
h_edges = findInterBins(h_edges);
h_num = h_num'; h_edges = h_edges';
h_f = fit(h_edges, h_num, typeApproximation);
plot(h_f,'b-',h_edges, h_num,'b.');
legend('points','Больное растение','points','Здоровое растение');
hold off;
nh_num = []; nh_edges = []; h_num = []; h_edges = [];
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'GB.jpg');
saveas(gcf,'GB.fig');

close all;