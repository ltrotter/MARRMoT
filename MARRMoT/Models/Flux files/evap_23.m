function [func] = evap_23(~)
% evap_23
% combines evap_5 (evaporation) and evap_6 (transpiration)
%
% Copyright (C) 2021 Clara Brandes
% This program is free software (GNU GPL v3) and distributed WITHOUT ANY
% WARRANTY. See <https://www.gnu.org/licenses/> for details.
%
% Anonymous function
% ------------------
% Description:  Transpiration from vegetation at the potential rate if 
%               storage is above field capacity and scaled by relative 
%               storage if not (similar to evap_6), addition of 
%               Evaporation from bare soil scaled by relative storage
%               (similar to evap_5)
% Constraints:  Ea <= Ep
%               Ea <= S/dt
% @(Inputs):    p1   - fraction vegetated area [-] (0...1)
%               p2   - field capacity coefficient[-]
%               S    - current storage [mm]
%               Smax - maximum storage [mm]
%               Ep   - potential evapotranspiration rate [mm/d]
%               dt   - time step size [d]

func = @(p1,p2,S,Smax,Ep,dt) min([p1.*Ep+(1-p1).*S./Smax.*Ep, p1*Ep*S./(p2*Smax)+(1-p1).*S./Smax.*Ep,S/dt]);

end
