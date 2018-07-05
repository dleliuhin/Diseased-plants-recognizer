function graphModule(h,nh,typeApproximation,numbns)
%-----------------Stats_R histogram-----------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotHist(nh.R.Contrast,h.R.Contrast,typeApproximation,numbns);

subplot(2,2,2);
plotHist(nh.R.Correlation,h.R.Correlation,typeApproximation,numbns);

subplot(2,2,3);
plotHist(nh.R.Energy,h.R.Energy,typeApproximation,numbns);

subplot(2,2,4);
plotHist(nh.R.Homogeneity,h.R.Homogeneity,typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'graphResults/R.jpg');
saveas(gcf,'graphResults/R.fig');

%-----------------Stats_G histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotHist(nh.G.Contrast,h.G.Contrast,typeApproximation,numbns);

subplot(2,2,2);
plotHist(nh.G.Correlation,h.G.Correlation,typeApproximation,numbns);

subplot(2,2,3);
plotHist(nh.G.Energy,h.G.Energy,typeApproximation,numbns);

subplot(2,2,4);
plotHist(nh.G.Homogeneity,h.G.Homogeneity,typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'graphResults/G.jpg');
saveas(gcf,'graphResults/G.fig');

%-----------------Stats_B histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotHist(nh.B.Contrast,h.B.Contrast,typeApproximation,numbns);

subplot(2,2,2);
plotHist(nh.B.Correlation,h.B.Correlation,typeApproximation,numbns);

subplot(2,2,3);
plotHist(nh.B.Energy,h.B.Energy,typeApproximation,numbns);

subplot(2,2,4);
plotHist(nh.B.Homogeneity,h.B.Homogeneity,typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'graphResults/B.jpg');
saveas(gcf,'graphResults/B.fig');

%-----------------Stats_RG histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotHist(nh.RG.Contrast,h.RG.Contrast,typeApproximation,numbns);

subplot(2,2,2);
plotHist(nh.RG.Correlation,h.RG.Correlation,typeApproximation,numbns);

subplot(2,2,3);
plotHist(nh.RG.Energy,h.RG.Energy,typeApproximation,numbns);

subplot(2,2,4);
plotHist(nh.RG.Homogeneity,h.RG.Homogeneity,typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'graphResults/RG.jpg');
saveas(gcf,'graphResults/RG.fig');

%-----------------Stats_RB histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotHist(nh.RB.Contrast,h.RB.Contrast,typeApproximation,numbns);

subplot(2,2,2);
plotHist(nh.RB.Correlation,h.RB.Correlation,typeApproximation,numbns);

subplot(2,2,3);
plotHist(nh.RB.Energy,h.RB.Energy,typeApproximation,numbns);

subplot(2,2,4);
plotHist(nh.RB.Homogeneity,h.RB.Homogeneity,typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'graphResults/RB.jpg');
saveas(gcf,'graphResults/RB.fig');

%-----------------Stats_GB histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotHist(nh.GB.Contrast,h.GB.Contrast,typeApproximation,numbns);

subplot(2,2,2);
plotHist(nh.GB.Correlation,h.GB.Correlation,typeApproximation,numbns);

subplot(2,2,3);
plotHist(nh.GB.Energy,h.GB.Energy,typeApproximation,numbns);

subplot(2,2,4);
plotHist(nh.GB.Homogeneity,h.GB.Homogeneity,typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'graphResults/GB.jpg');
saveas(gcf,'graphResults/GB.fig');
end