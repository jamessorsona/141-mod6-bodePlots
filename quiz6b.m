%% Open Loop (My attempt)
poles = [10^4 10^6];
openLoopGain = 200;

F = (( (poles(1)+poles(2))^2 / (4*poles(1)*poles(2)) )-1) / openLoopGain;
T = openLoopGain * F;

closedLoopGain = openLoopGain / (1+T);
pole_ClosedLoop_Critical = (poles(1)+poles(2)) / 2;


s = tf('s');
H_open = openLoopGain / ( (1+s/poles(1)) * (1+s/poles(2)) );
bode(H_open);

hold on;

H_closed = closedLoopGain / ( (1+s/(pole_ClosedLoop_Critical) )^2 );
bode(H_closed);

bode(1/F, 1, 'g');
hold off;


%% Open Loop (Other attempt)
poles = [10^4 2*10^6];
openLoopGain = 5000;

F = (( (poles(1)+poles(2))^2 / (4*poles(1)*poles(2)) )-1) / openLoopGain;
T = openLoopGain * F;

closedLoopGain = openLoopGain / (1+T);
pole_ClosedLoop_Critical = (poles(1)+poles(2)) / 2;


s = tf('s');
H_open = openLoopGain / ( (1+s/poles(1)) * (1+s/poles(2)) );
bode(H_open);

hold on;

H_closed = closedLoopGain / ( (1+s/(pole_ClosedLoop_Critical) )^2 );
bode(H_closed);

bode(1/F, 1, 'g');
hold off;

%% sample
a = 10^(110/20);

s = tf('s');
H = a/( (1+s/100)*(1+s/10*10^6)*(1+s/50*10^6) );
bode(H);