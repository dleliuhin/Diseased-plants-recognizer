function [oTestStructure] = setNullTestStats()
%% SETNULLTESTSTATS
% Set *oTestStructure* structure branches as NULL.
%
% * Syntax
%
%   [OTESTSTRUCTURE] = SETNULLTESTSTATS()
%
% * Output
%
% -- oTestStructure - structure for plant leaves.
% 
% * Examples:
%
% Insert function in every loop iteration for setting elements to NULL.
% 
% * See also: 
%   
% INITIALIZECOMPONENTS
%
% * Author: *Dmitrii Leliuhin* 
% * Email: dleliuhin@mail.ru
% * Date: 12/09/2018 18:00:33
% * Version: 1.0 $ 
% * Requirements: PCWIN64, MatLab R2016a   
%
% * Warning:
%
% # Warnings list.
% 
% * TODO:
%
% # Replace dynamic memory allocation *[]* with *zeros()* function.
%

%% Code

oTestStructure.h = initializeComponents();
oTestStructure.nh1 = initializeComponents();
% oTestStructure.nh2 = initializeComponents();
% oTestStructure.nh3 = initializeComponents();
% oTestStructure.nh4 = initializeComponents();
% oTestStructure.nh5 = initializeComponents();
% oTestStructure.nh6 = initializeComponents();
% oTestStructure.nh7 = initializeComponents();
% oTestStructure.nh8 = initializeComponents();
% oTestStructure.nh9 = initializeComponents();
% oTestStructure.nh10 = initializeComponents();
% oTestStructure.nh11 = initializeComponents();
% oTestStructure.nh12 = initializeComponents();
% oTestStructure.nh13 = initializeComponents();
% oTestStructure.nh14 = initializeComponents();
% oTestStructure.nh15 = initializeComponents();

end