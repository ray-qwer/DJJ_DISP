x = [-50:100]*0.1;
an = 10;
noise = an * (rand(1,151)-0.5);
x1 = x + noise;
t = [-50: 100];
subplot(3,1,1);
plot(t, x1);

sigma1 = 0.5;
n = [-10:10];
hn1 = exp(-sigma1*abs(n));
c1 = 1/ sum(hn1);
hn1 = c1 * hn1;
y1 = conv(x1, hn1, 'same');
subplot(3,1,2);
plot(t, y1);

sigma2 = 0.05;
hn2 = exp(-sigma2*abs(n));
c2 = 1/ sum(hn2);
hn2 = c2 * hn2;
y2 = conv(x1, hn2, 'same');
subplot(3,1,3);
plot(t, y2);
