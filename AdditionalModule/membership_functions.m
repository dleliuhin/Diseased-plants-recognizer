%������������� ������� ��������������
%�������� ���������� ���������������� �����������
%����������� ������ ��������� ������ �� ��������� ����
%��������� ����������

clc;
clear;

k=5;%����� ����������� �� �����
%kb_in=2^k;%������� ��� �����������
S=0.05;%��� ������� �������������
x = 0:14;%������ ��������� ��������
%��������� ���������� ��������� ���������� Contrast, Correlation,
%Energy,Homogenity ��� ���������� R (������� �� ��������� ��������� ��� 15
%��������)

Rcon = [0.2457 0.124 0.3154 0.2008 0.3102 0.2077 0.2023 0.1599 0.2013 0.2941 0.3151 0.1268 0.2207 0.33 0.34];
Rcor = [0.9497 0.9439 0.8911 0.8028 0.8128 0.9657 0.937 0.9296 0.8735 0.8784 0.8542 0.9341 0.9049 0.8213 0.935];
Ren = [0.1195 0.2224 0.1504 0.3312 0.1897 0.1092 0.2122 0.2347 0.2263 0.1417 0.1444 0.2764 0.1639 0.1693 0.1583];
Rhom = [0.9005 0.9471 0.8596 0.925 0.8669 0.9064 0.9062 0.923 0.9024 0.8653 0.8514 0.938 0.8938 0.8495 0.9026];

noise1=rand(16);
for j=1:15
Rcon(j)=1-abs(Rcon(j)-Rcon(k)+S*noise1(j));%������� �������������� 1
end
noise2=rand(16);
for j=1:15
Rcor(j)=1-abs(Rcor(j)-Rcor(k)+S*noise2(j));%������� �������������� 2
end
noise3=rand(16);
for j=1:15
Ren(j)=1-abs(Ren(j)-Ren(k)+S*noise3(j));%������� �������������� 3
end
noise4=rand(16);
for j=1:15
Rhom(j)=1-abs(Rhom(j)-Rhom(k)+S*noise4(j));%������� �������������� 4
end
xx = 0:.25:14;
yRcon = spline(x,Rcon,xx);
yRcor = spline(x,Rcor,xx);
yRen = spline(x,Ren,xx);
yRhom = spline(x,Rhom,xx);
figure
subplot (4,1,1);
plot(x,Rcon,'o',xx,yRcon);hold on;plot(xx,0.8,'k');hold off;title('Contrast');subplot(4,1,2); 
plot(x,Rcor,'o',xx,yRcor);title('Correlation');subplot(4,1,3); 
plot(x,Ren,'o',xx,yRen);title('Energy');subplot(4,1,4); 
plot(x,Rhom,'o',xx,yRhom);title('Homogenity'); 

% pause;
% close all;
% clear;