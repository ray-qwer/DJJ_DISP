tmp = [-5: 5];
x1 = ones(size(tmp));
x2 = tmp* 1/floor(length(tmp)/2);
x3 = -x2;
x4 = sin((tmp+floor(length(tmp)/2))*2*pi/11);
pad = zeros(size(tmp));

x = [pad, x1, pad, x2, pad, x3, pad, x4, pad];
t = [1: length(x)];
subplot(2,1,1);
plot(t, x);

output = zeros(size(x));
match = x2;
match = match - mean(match);
sigma_mf = sqrt(sum(match.^2));
L = floor(length(match)/2);
x_pad = [zeros(1, L), x, zeros(1, L)];
for i = [L+1: length(x_pad)-L]
    part = x_pad(i-L:i+L);
    part = part - mean(part);
    sigma_localX = sqrt(sum(part.^2))
    if sigma_localX == 0
        y(i-L) = 0;
    else
        % y(i-L) = sum(conv(x_pad(i-L:i+L), match, "same")) / (sigma_localX * sigma_mf);
        y(i-L) = sum(part.*x2) / (sigma_localX * sigma_mf);
    end
end
subplot(2,1,2);
plot(t, y);
