%% FOR GNU OCTAVE 
pkg load signal;

%% Open Loop Parameters
z = [];
p = [-10^4 -10^6]';
Gain = 200;
k = Gain * prod(p);

[num,den] = zp2tf(z,p,k);
H = tf(num,den);

bode(H);

%% Closed Loop (Coincident Poles)

T = 24.5025;

z = [];
p = [-505*10^3 -505*10^3]' .* (1+T);
Gain = 200 / (1+T);
k = Gain * prod(p);

[num,den] = zp2tf(z,p,k);
H = tf(num,den);

bode(H);

