function [ioIndicator] = getStdIndicator(ioIndicator, iPlotValuesIndicator)
%% GETSTDINDICATOR 
% Assign std of iPlotValuesIndicator to ioIndicator.
% 
% * Syntax 
% 
%	[IOINDICATOR] = GETSTDINDICATOR(IOINDICATOR, IPLOTVALUESINDICATOR)
% 
% * Input 
% 
% -- ioIndicator - structure which need to set up a 
%                  new value - iPlotValuesIndicator.
%
% -- iPlotValuesIndicator - structure of values for plotting graphics
%                           including R, G, B, RG, RB, GB components.
%                           Every component contains Contrast, 
%                           Correlation, Energy, Homogeneity properties.
% 
% * Output 
% 
% -- ioIndicator - structure which equal the std of iPlotValuesIndicator.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% No relations.
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 12/10/2018 00:57:50 
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a 
% 
% * Warning: 
% 
% # No Warnings. 
% 
% * TODO: 
% 
% # TODO list. 
% 

%% Code 

ioIndicator.R.Contrast =      std(iPlotValuesIndicator.R.Contrast.edges);
ioIndicator.R.Correlation =   std(iPlotValuesIndicator.R.Correlation.edges);
ioIndicator.R.Energy =        std(iPlotValuesIndicator.R.Energy.edges);
ioIndicator.R.Homogeneity =   std(iPlotValuesIndicator.R.Homogeneity.edges);

ioIndicator.G.Contrast =      std(iPlotValuesIndicator.G.Contrast.edges);
ioIndicator.G.Correlation =   std(iPlotValuesIndicator.G.Correlation.edges);
ioIndicator.G.Energy =        std(iPlotValuesIndicator.G.Energy.edges);
ioIndicator.G.Homogeneity =   std(iPlotValuesIndicator.G.Homogeneity.edges);

ioIndicator.B.Contrast =      std(iPlotValuesIndicator.B.Contrast.edges);
ioIndicator.B.Correlation =   std(iPlotValuesIndicator.B.Correlation.edges);
ioIndicator.B.Energy =        std(iPlotValuesIndicator.B.Energy.edges);
ioIndicator.B.Homogeneity =   std(iPlotValuesIndicator.B.Homogeneity.edges);

ioIndicator.RG.Contrast =     std(iPlotValuesIndicator.RG.Contrast.edges);
ioIndicator.RG.Correlation =  std(iPlotValuesIndicator.RG.Correlation.edges);
ioIndicator.RG.Energy =       std(iPlotValuesIndicator.RG.Energy.edges);
ioIndicator.RG.Homogeneity =  std(iPlotValuesIndicator.RG.Homogeneity.edges);

ioIndicator.RB.Contrast =     std(iPlotValuesIndicator.RB.Contrast.edges);
ioIndicator.RB.Correlation =  std(iPlotValuesIndicator.RB.Correlation.edges);
ioIndicator.RB.Energy =       std(iPlotValuesIndicator.RB.Energy.edges);
ioIndicator.RB.Homogeneity =  std(iPlotValuesIndicator.RB.Homogeneity.edges);

ioIndicator.GB.Contrast =     std(iPlotValuesIndicator.GB.Contrast.edges);
ioIndicator.GB.Correlation =  std(iPlotValuesIndicator.GB.Correlation.edges);
ioIndicator.GB.Energy =       std(iPlotValuesIndicator.GB.Energy.edges);
ioIndicator.GB.Homogeneity =  std(iPlotValuesIndicator.GB.Homogeneity.edges);

end
