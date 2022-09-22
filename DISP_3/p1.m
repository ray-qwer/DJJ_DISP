% bilateral filter
t = [1:101];
x = [ones(1,50), zeros(1, 51)];
an = 0.3;
noise = an * (rand(1, 101) - 0.5);
x1 = x + noise;
subplot(2,1,1);
plot(t, x1);

k1 = 0.1;
k2 = 10;
filter = [1:21];
L = floor(length(filter)/2);
filter = filter - (L+1);
filter = exp(-k1 * filter.^2);
% padding x1
output = zeros(size(x));
x1 = [ones(1,L)*x1(1), x1, ones(1,L)*x1(end) ];
for i = L+1: length(x1)-L
    y = x1(i-L: i+L);
    dominant_filter = exp(-k2*((x1(i) - y).^2));
    c = 1/sum((dominant_filter .* filter));
    output(i-L) = c* sum(y.*filter.*dominant_filter);
end
subplot(2,1,2);
plot(t,output);