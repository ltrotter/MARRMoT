function [out] = baseflow_8(p1,p2,S,Smax)
%baseflow_8 

% Copyright (C) 2019, 2021 Wouter J.M. Knoben, Luca Trotter
% This file is part of the Modular Assessment of Rainfall-Runoff Models
% Toolbox (MARRMoT).
% MARRMoT is a free software (GNU GPL v3) and distributed WITHOUT ANY
% WARRANTY. See <https://www.gnu.org/licenses/> for details.

% Flux function
% ------------------
% Description:  Exponential scaled outflow from a deficit store
% Constraints:  S <= Smax
% @(Inputs):    p1   - base outflow rate [mm/d]
%               p2   - exponential scaling parameter [-]
%               S    - current storage [mm]
%               Smax - maximum contributing storage [mm]

out = p1.*(exp(p2.*min(1,max(S,0)./Smax))-1);

end

