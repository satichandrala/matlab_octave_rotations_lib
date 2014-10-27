% TiltInv.m - Philipp Allgeuer - 22/10/14
% Calculates the inverse of a tilt angles rotation.
%
% function [Tinv] = TiltInv(T)
%
% T    ==> Input tilt angles rotation
% Tinv ==> Inverse tilt angles rotation

% Main function
function [Tinv] = TiltInv(T)

	% Calculate and wrap the inverse tilt axis angle
	gammainv = T(1) + T(2) - pi;
	gammainv = pi - mod(pi - gammainv, 2*pi);
	
	% Construct the inverse rotation
	Tinv = [-T(1) gammainv T(3)];

end
% EOF