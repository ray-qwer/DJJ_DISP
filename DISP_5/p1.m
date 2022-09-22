% i
x = [-10:0.1:10];
y = x;
[X,Y] = meshgrid(x,y);
I = zeros(size(X));

rx= 6;
ry= 9;
center = [0,0];
I = (((X-center(1)).^2/rx^2+(Y-center(2)).^2/ry^2) < 1)*255;
imagesc(x,y,I);
colormap gray;

% ii
L0 = sum(I ~=0,'all');
L1 = sum(abs(I),'all');
L2 = sqrt(sum(abs(I).^2,'all'));
Linf = max(I,[],'all');

% iii
m = sum(I, 'all');
sz = size(I);
x = [0:sz(2)-1];
y = [0:sz(1)-1];
[X,Y] = meshgrid(x,y);
X = X - mean(x);
Y = Y - mean(y);
m11 = sum(X .* Y .* I, 'all') / m;
m20 = sum((X.^2) .* 1 .* I, 'all') /m;
m02 = sum(1 .* (Y.^2) .*I, "all") /m;
