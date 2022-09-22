img = imread("obama_256.png");
img = rgb2gray(img);
subplot(2,3,1);
imshow(img);

img_e = img;
for i = 1:3
    img_e = erosion(img_e);
end
subplot(2,3,2);
imshow(img_e);

img_d = img;
for i = 1:3
    img_d = dilation(img_d);
end
subplot(2,3,3);
imshow(img_d);

img_o = img;
img_o = opening(img_o);
subplot(2,3,4);
imshow(img_o);

img_c = img;
img_c = closing(img_c);
subplot(2,3,5);
imshow(img_c);



function o_img = erosion(img)
    s = size(img);
    o_img = img;
    for i = 2:s(1)-1
        for j = 2:s(2)-1
            o_img(i,j) = min([img(i,j), img(i-1,j), img(i+1, j), img(i, j-1), img(i, j+1)]);
        end
    end
end

function o_img = dilation(img)
    s = size(img);
    o_img = img;
    for i = 2:s(1)-1
        for j = 2:s(2)-1
            o_img(i,j) = max([img(i,j), img(i-1,j), img(i+1, j), img(i, j-1), img(i, j+1)]);
        end
    end
end

function o_img = opening(img)
    o_img = img;
    for i = 1:3
        o_img = erosion(o_img);
    end
    for i = 1:3
        o_img = dilation(o_img);
    end
end

function o_img = closing(img)
    o_img = img;
    for i = 1:3
        o_img = dilation(o_img);
    end
    for i = 1:3
        o_img = erosion(o_img);
    end
end
