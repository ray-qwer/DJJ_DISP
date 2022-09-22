img = imread("lena.png");
img = rgb2gray(img);
figure();
imshow(img);

large = [1.5,1.6];
sz_ori = size(img);
sz_new = [ceil(sz_ori(1)*large(1)), ceil(sz_ori(2)*large(2))];

I = zeros(sz_new);
for i = 2:sz_new(1)-1
    for j = 2:sz_new(2)-1
        i_1 = i/large(1);
        j_1 = j/large(2);
        i_0 = floor(i_1);
        j_0 = floor(j_1);
        a = i_1 - i_0;
        b = j_1 - j_0;
        I(i,j) = (1-a)*(1-b)*img(i_0,j_0) + a*(1-b)*img(i_0+1, j_0) + (1-a)*b*img(i_0, j_0+1) + a*b*img(i_0+1, j_0+1);
    end
end
I = uint8(I(2:end-1,2:end-1));
figure();
imshow(I);