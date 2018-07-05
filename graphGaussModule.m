function graphGaussModule(h,nh,typeApproximation,numbns)
%-----------------Stats_R histogram-----------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.R.Contrast,h.R.Contrast,' stats R.Contrast',typeApproximation,numbns);

subplot(2,2,2);
plotGaussHist(nh.R.Correlation,h.R.Correlation,' stats R.Correlation',typeApproximation,numbns);

subplot(2,2,3);
plotGaussHist(nh.R.Energy,h.R.Energy,' stats R.Energy',typeApproximation,numbns);

subplot(2,2,4);
plotGaussHist(nh.R.Homogeneity,h.R.Homogeneity,' stats R.Energy',typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/R.jpg');
saveas(gcf,'Result/graphGaussResults/R.fig');

%-----------------Stats_G histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.G.Contrast,h.G.Contrast,' stats R.',typeApproximation,numbns);

subplot(2,2,2);
plotGaussHist(nh.G.Correlation,h.G.Correlation,' stats R.Energy',typeApproximation,numbns);

subplot(2,2,3);
plotGaussHist(nh.G.Energy,h.G.Energy,' stats R.Energy',typeApproximation,numbns);

subplot(2,2,4);
plotGaussHist(nh.G.Homogeneity,h.G.Homogeneity,typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/G.jpg');
saveas(gcf,'Result/graphGaussResults/G.fig');

%-----------------Stats_B histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.B.Contrast,h.B.Contrast,typeApproximation,numbns);

subplot(2,2,2);
plotGaussHist(nh.B.Correlation,h.B.Correlation,typeApproximation,numbns);

subplot(2,2,3);
plotGaussHist(nh.B.Energy,h.B.Energy,typeApproximation,numbns);

subplot(2,2,4);
plotGaussHist(nh.B.Homogeneity,h.B.Homogeneity,typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/B.jpg');
saveas(gcf,'Result/graphGaussResults/B.fig');

%-----------------Stats_RG histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.RG.Contrast,h.RG.Contrast,typeApproximation,numbns);

subplot(2,2,2);
plotGaussHist(nh.RG.Correlation,h.RG.Correlation,typeApproximation,numbns);

subplot(2,2,3);
plotGaussHist(nh.RG.Energy,h.RG.Energy,typeApproximation,numbns);

subplot(2,2,4);
plotGaussHist(nh.RG.Homogeneity,h.RG.Homogeneity,typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/RG.jpg');
saveas(gcf,'Result/graphGaussResults/RG.fig');

%-----------------Stats_RB histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.RB.Contrast,h.RB.Contrast,typeApproximation,numbns);

subplot(2,2,2);
plotGaussHist(nh.RB.Correlation,h.RB.Correlation,typeApproximation,numbns);

subplot(2,2,3);
plotGaussHist(nh.RB.Energy,h.RB.Energy,typeApproximation,numbns);

subplot(2,2,4);
plotGaussHist(nh.RB.Homogeneity,h.RB.Homogeneity,typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/RB.jpg');
saveas(gcf,'Result/graphGaussResults/RB.fig');

%-----------------Stats_GB histogram------------------------------
figure;
set(gcf, 'Position', [300, 100, 800, 600]);
subplot(2,2,1);
plotGaussHist(nh.GB.Contrast,h.GB.Contrast,typeApproximation,numbns);

subplot(2,2,2);
plotGaussHist(nh.GB.Correlation,h.GB.Correlation,typeApproximation,numbns);

subplot(2,2,3);
plotGaussHist(nh.GB.Energy,h.GB.Energy,typeApproximation,numbns);

subplot(2,2,4);
plotGaussHist(nh.GB.Homogeneity,h.GB.Homogeneity,typeApproximation,numbns);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
saveas(gcf,'Result/graphGaussResults/GB.jpg');
saveas(gcf,'Result/graphGaussResults/GB.fig');
end