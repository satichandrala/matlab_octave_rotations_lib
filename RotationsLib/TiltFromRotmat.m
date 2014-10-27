% TiltFromRotmat.m - Philipp Allgeuer - 22/10/14
% Converts a rotation matrix to the corresponding tilt angles representation.
%
% function [Tilt] = TiltFromRotmat(Rotmat)
%
% The output ranges are:
% Fused yaw:        psi   is in (-pi,pi]
% Tilt axis angle:  gamma is in (-pi,pi]
% Tilt angle:       alpha is in [0,pi]
% 
% Rotmat ==> Input rotation matrix
% Tilt   ==> Equivalent tilt angles rotation

% Main function
function [Tilt] = TiltFromRotmat(Rotmat)

	% Calculate the tilt angle alpha
	calpha = max(min(Rotmat(3,3),1.0),-1.0); % Note: If Rotmat is valid then this should only trim at most a few eps...
	alpha = acos(calpha);
	
	% Calculate the tilt axis angle
	gamma = atan2(-Rotmat(3,1),Rotmat(3,2));
	
	% Calculate and wrap the fused yaw
	psi = atan2(Rotmat(1,3),-Rotmat(2,3)) - gamma;
	psi = pi - mod(pi - psi, 2*pi);
	
	% Return the tilt angles representation
	Tilt = [psi gamma alpha];

end
% EOF