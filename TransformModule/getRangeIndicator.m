function [ioIndicator] = getRangeIndicator(ioIndicator, iPlotValuesIndicator)
%% GETRANGEINDICATOR 
% Assign range of iPlotValuesIndicator to ioIndicator.
% 
% * Syntax 
% 
%	[IOINDICATOR] = GETRANGEINDICATOR(IOINDICATOR, IPLOTVALUESINDICATOR)
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
% -- ioIndicator - structure which equal the range of iPlotValuesIndicator.
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
% * Date: 12/10/2018 00:59:12 
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

ioIndicator.R.Contrast =      range(iPlotValuesIndicator.R.Contrast.edges);
ioIndicator.R.Correlation =   range(iPlotValuesIndicator.R.Correlation.edges);
ioIndicator.R.Energy =        range(iPlotValuesIndicator.R.Energy.edges);
ioIndicator.R.Homogeneity =   range(iPlotValuesIndicator.R.Homogeneity.edges);

ioIndicator.G.Contrast =      range(iPlotValuesIndicator.G.Contrast.edges);
ioIndicator.G.Correlation =   range(iPlotValuesIndicator.G.Correlation.edges);
ioIndicator.G.Energy =        range(iPlotValuesIndicator.G.Energy.edges);
ioIndicator.G.Homogeneity =   range(iPlotValuesIndicator.G.Homogeneity.edges);

ioIndicator.B.Contrast =      range(iPlotValuesIndicator.B.Contrast.edges);
ioIndicator.B.Correlation =   range(iPlotValuesIndicator.B.Correlation.edges);
ioIndicator.B.Energy =        range(iPlotValuesIndicator.B.Energy.edges);
ioIndicator.B.Homogeneity =   range(iPlotValuesIndicator.B.Homogeneity.edges);

ioIndicator.RG.Contrast =      range(iPlotValuesIndicator.RG.Contrast.edges);
ioIndicator.RG.Correlation =   range(iPlotValuesIndicator.RG.Correlation.edges);
ioIndicator.RG.Energy =        range(iPlotValuesIndicator.RG.Energy.edges);
ioIndicator.RG.Homogeneity =   range(iPlotValuesIndicator.RG.Homogeneity.edges);

ioIndicator.RB.Contrast =      range(iPlotValuesIndicator.RB.Contrast.edges);
ioIndicator.RB.Correlation =   range(iPlotValuesIndicator.RB.Correlation.edges);
ioIndicator.RB.Energy =        range(iPlotValuesIndicator.RB.Energy.edges);
ioIndicator.RB.Homogeneity =   range(iPlotValuesIndicator.RB.Homogeneity.edges);

ioIndicator.GB.Contrast =      range(iPlotValuesIndicator.GB.Contrast.edges);
ioIndicator.GB.Correlation =   range(iPlotValuesIndicator.GB.Correlation.edges);
ioIndicator.GB.Energy =        range(iPlotValuesIndicator.GB.Energy.edges);
ioIndicator.GB.Homogeneity =   range(iPlotValuesIndicator.GB.Homogeneity.edges);

end
