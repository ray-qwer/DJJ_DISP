img = imread("lena.png");
img = (rgb2gray(img));

sz = size(img);
filter = [-1,0,1];
Y = conv2(img,filter,'same');
X = conv2(img,filter','same');

wxy = [-10:10];
sigma = 3;
[WX, WY] = meshgrid(wxy,wxy);
w = exp(-(WX.^2 + WY.^2)/(2*sigma^2));

A = conv2(X.^2, w, 'same');
B = conv2(Y.^2, w, 'same');
C = conv2(X.*Y, w, 'same');

k = 0.05;
Tr = A+B;
Det = A.*B - C.^2;
R = Det - k.*(Tr.^2);
m = -1:1;
n = -1:1;
th = max(R(:))/100;
loc = zeros(0,2);
for i = [2:sz(1)-1]
    for j = [2:sz(2)-1]
        if R(i,j) > th &&...
                sum((R(i,j) > R(i+m,j+n)),"all") == 8

                loc = cat(1,loc,[i j]);
        end
    end
end

imshow(img);
hold on;
plot(loc(:,2),loc(:,1),'c*');
