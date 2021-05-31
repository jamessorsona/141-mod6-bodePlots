%% QUIZ 6B
% 
%  Answer the following questions based on the given loaded loop-gain of an
%  amplifier in feedback. Assume that a positive, purely real feedback
%  factor F is used. Always answer with at least 4 significant digits.
% 


%% Given 1
% 
% $$A(s)=\frac{200}{(1+\frac{s}{10000})(1+\frac{s}{1000000})}$$
% 

figure(1);
hold on;
s = tf('s');

% Parameters
poles = [10^4 10^6];
openLoopGain = 200;


% Feedback Factor
F = (( (poles(1)+poles(2))^2 / (4*poles(1)*poles(2)) )-1) / openLoopGain;
% Loop Gain
T = openLoopGain * F;

% Closed Loop Gain
closedLoopGain = openLoopGain / (1+T);
% Absolute frequency where coincident poles occur
pole_ClosedLoop_Critical = (poles(1)+poles(2)) / 2;

% Bode Plot (Open-Loop)
H_open = openLoopGain / ( (1+s/poles(1)) * (1+s/poles(2)) );
bode(H_open);

% Bode Plot (Closed-Loop)
H_closed = closedLoopGain / ( (1+s/(pole_ClosedLoop_Critical) )^2 );
bode(H_closed);

% Bode Plot (Feedback Factor)
bode(1/F, 1, 'g');


hold off;

%%
% 
% # What is the open-loop DC gain? $$A_0=46.0205dB$
% # What is the open-loop bandwidth? $$BW_{open-loop}=10000\frac{rad}{s}$
% # What is $$T_0$ (in linear value) such that the closed-loop poles are
% coincident? $$T_{0,crit}=24.5025$
% # What is the DC closed-loop gain in dB with $$T_0=T_{0,crit}$?
% $$A_{CL,0}=17.8889dB$
% # At what absolute frequency will the coincident poles occur?
% $$\omega_{CL,crit}=50500\frac{rad}{s}$
% # What is the closed-loop bandwidth with the poles being coincident?
% $$BW_{closed-loop,crit}=324359.2056\frac{rad}{s}$
% 



%% Given 2
% 
% $$A(s)=\frac{5000}{(1+\frac{s}{10000})(1+\frac{s}{2000000})}$$
% 

figure(2);
hold on;
s = tf('s');

% Parameters
poles2 = [10^4 2*10^6];
openLoopGain2 = 5000;

% Feedback Factor
F2 = (( (poles2(1)+poles2(2))^2 / (4*poles2(1)*poles2(2)) )-1) / openLoopGain2;
% Loop Gain
T2 = openLoopGain2 * F2;

% Closed Loop Gain
closedLoopGain2 = openLoopGain2 / (1+T2);
% Absolute frequency where coincident poles occur
pole_ClosedLoop_Critical2 = (poles2(1)+poles2(2)) / 2;

% Bode Plot (Open-Loop)
H_open2 = openLoopGain2 / ( (1+s/poles2(1)) * (1+s/poles2(2)) );
bode(H_open2);

% Bode Plot(Closed-Loop)
H_closed2 = closedLoopGain2 / ( (1+s/(pole_ClosedLoop_Critical2) )^2 );
bode(H_closed2);

% Bode Plot (Feedback Factor)
bode(1/F2, 1, 'g');


hold off;

%%
% 
% # What is the open-loop DC gain? $$A_0=73.9794dB$
% # What is the open-loop bandwidth? $$BW_{open-loop}=10000\frac{rad}{s}$
% # What is $$T_0$ (in linear value) such that the closed-loop poles are
% coincident? $$T_{0,crit}=49.5012$
% # What is the DC closed-loop gain in dB with $$T_0=T_{0,crit}$?
% $$A_{CL,0}=39.9133dB$
% # At what absolute frequency will the coincident poles occur?
% $$\omega_{CL,crit}=1005000\frac{rad}{s}$
% # What is the closed-loop bandwidth with the poles being coincident?
% $$BW_{closed-loop,crit}=645502.9771\frac{rad}{s}$
% 
