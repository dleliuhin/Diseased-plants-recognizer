function [ioIndicator] = getMinRangeIndicator(ioIndicator, ...
                                              iPlotValuesIndicator)
%% GETMINRANGEINDICATOR 
% Assign minimal range of iPlotValuesIndicator to ioIndicator.
% 
% * Syntax 
% 
%	[IOINDICATOR] = GETMINRANGEINDICATOR(IOINDICATOR, IPLOTVALUESINDICATOR)
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
%                  minimal range of iPlotValuesIndicator.
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
% * Date: 12/10/2018 00:44:01 
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

ioIndicator.R.Contrast =      min(iPlotValuesIndicator.R.Contrast.edges);
ioIndicator.R.Correlation =   min(iPlotValuesIndicator.R.Correlation.edges);
ioIndicator.R.Energy =        min(iPlotValuesIndicator.R.Energy.edges);
ioIndicator.R.Homogeneity =   min(iPlotValuesIndicator.R.Homogeneity.edges);

ioIndicator.G.Contrast =      min(iPlotValuesIndicator.G.Contrast.edges);
ioIndicator.G.Correlation =   min(iPlotValuesIndicator.G.Correlation.edges);
ioIndicator.G.Energy =        min(iPlotValuesIndicator.G.Energy.edges);
ioIndicator.G.Homogeneity =   min(iPlotValuesIndicator.G.Homogeneity.edges);

ioIndicator.B.Contrast =      min(iPlotValuesIndicator.B.Contrast.edges);
ioIndicator.B.Correlation =   min(iPlotValuesIndicator.B.Correlation.edges);
ioIndicator.B.Energy =        min(iPlotValuesIndicator.B.Energy.edges);
ioIndicator.B.Homogeneity =   min(iPlotValuesIndicator.B.Homogeneity.edges);

ioIndicator.RG.Contrast =      min(iPlotValuesIndicator.RG.Contrast.edges);
ioIndicator.RG.Correlation =   min(iPlotValuesIndicator.RG.Correlation.edges);
ioIndicator.RG.Energy =        min(iPlotValuesIndicator.RG.Energy.edges);
ioIndicator.RG.Homogeneity =   min(iPlotValuesIndicator.RG.Homogeneity.edges);

ioIndicator.RB.Contrast =      min(iPlotValuesIndicator.RB.Contrast.edges);
ioIndicator.RB.Correlation =   min(iPlotValuesIndicator.RB.Correlation.edges);
ioIndicator.RB.Energy =        min(iPlotValuesIndicator.RB.Energy.edges);
ioIndicator.RB.Homogeneity =   min(iPlotValuesIndicator.RB.Homogeneity.edges);

ioIndicator.GB.Contrast =      min(iPlotValuesIndicator.GB.Contrast.edges);
ioIndicator.GB.Correlation =   min(iPlotValuesIndicator.GB.Correlation.edges);
ioIndicator.GB.Energy =        min(iPlotValuesIndicator.GB.Energy.edges);
ioIndicator.GB.Homogeneity =   min(iPlotValuesIndicator.GB.Homogeneity.edges);

end
