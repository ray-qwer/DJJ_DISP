[x, fs] = audioread("rick.wav");
x1 = x(:,1)';
dt = 1/fs;
X = fft(x1);
X = abs(X)*dt;
L = length(X);

X = [X(floor(L/2)+1:end) X(1:floor(L/2))];

freq = [0:L-1] - floor(L/2);
freq = freq * fs/L;
plot(freq, X);
