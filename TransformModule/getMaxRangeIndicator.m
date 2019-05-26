function [ioIndicator] = getMaxRangeIndicator(ioIndicator, ...
                                              iPlotValuesIndicator)
%% GETMAXRANGEINDICATOR 
% Assign maximal range of iPlotValuesIndicator to ioIndicator.
% 
% * Syntax 
% 
%	[IOINDICATOR] = GETMAXRANGEINDICATOR(IOINDICATOR, IPLOTVALUESINDICATOR)
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
% -- ioIndicator - structure which equal the 
%                  maximal range of iPlotValuesIndicator.
% 
% * Examples: 
% 
% Provide sample usage code here
% 
% * See also: 
% 
% No relatons.
% 
% * Author: Dmitrii Leliuhin 
% * Email: dleliuhin@mail.ru 
% * Date: 12/10/2018 00:51:58 
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

ioIndicator.R.Contrast =      max(iPlotValuesIndicator.R.Contrast.edges);
ioIndicator.R.Correlation =   max(iPlotValuesIndicator.R.Correlation.edges);
ioIndicator.R.Energy =        max(iPlotValuesIndicator.R.Energy.edges);
ioIndicator.R.Homogeneity =   max(iPlotValuesIndicator.R.Homogeneity.edges);

ioIndicator.G.Contrast =      max(iPlotValuesIndicator.G.Contrast.edges);
ioIndicator.G.Correlation =   max(iPlotValuesIndicator.G.Correlation.edges);
ioIndicator.G.Energy =        max(iPlotValuesIndicator.G.Energy.edges);
ioIndicator.G.Homogeneity =   max(iPlotValuesIndicator.G.Homogeneity.edges);

ioIndicator.B.Contrast =      max(iPlotValuesIndicator.B.Contrast.edges);
ioIndicator.B.Correlation =   max(iPlotValuesIndicator.B.Correlation.edges);
ioIndicator.B.Energy =        max(iPlotValuesIndicator.B.Energy.edges);
ioIndicator.B.Homogeneity =   max(iPlotValuesIndicator.B.Homogeneity.edges);

ioIndicator.RG.Contrast =      max(iPlotValuesIndicator.RG.Contrast.edges);
ioIndicator.RG.Correlation =   max(iPlotValuesIndicator.RG.Correlation.edges);
ioIndicator.RG.Energy =        max(iPlotValuesIndicator.RG.Energy.edges);
ioIndicator.RG.Homogeneity =   max(iPlotValuesIndicator.RG.Homogeneity.edges);

ioIndicator.RB.Contrast =      max(iPlotValuesIndicator.RB.Contrast.edges);
ioIndicator.RB.Correlation =   max(iPlotValuesIndicator.RB.Correlation.edges);
ioIndicator.RB.Energy =        max(iPlotValuesIndicator.RB.Energy.edges);
ioIndicator.RB.Homogeneity =   max(iPlotValuesIndicator.RB.Homogeneity.edges);

ioIndicator.GB.Contrast =      max(iPlotValuesIndicator.GB.Contrast.edges);
ioIndicator.GB.Correlation =   max(iPlotValuesIndicator.GB.Correlation.edges);
ioIndicator.GB.Energy =        max(iPlotValuesIndicator.GB.Energy.edges);
ioIndicator.GB.Homogeneity =   max(iPlotValuesIndicator.GB.Homogeneity.edges);

end
