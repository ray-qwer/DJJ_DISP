img  = imread("lena.png");
img = rgb2gray(img);

theta = 30/180 * pi;
rotate_matrix = ([cos(theta) sin(theta);-sin(theta) cos(theta);]);
imgr = image_process(img, rotate_matrix);
figure(1);
imshow(imgr);

shearing = [1 0.3;0 1];
imgs = image_process(img, shearing);
figure(2);
imshow(imgs);

% tic
% img = imrotate(img,-30, "bilinear","crop");
% subplot(2,1,2);
% imshow(img);
% toc

function img_o = image_process(img, m)
    sz = size(img);
    img_o = zeros(sz);
    mid = floor(sz/2);
    imgp = padarray(img,[1,1],'replicate','both');
    invM = inv(m);
    for i = [1:sz(1)]
        for j = [1:sz(2)]
            xy = (invM * ([i,j]-mid)') + mid';
            x1 = xy(1); y1 = xy(2);
            if x1 > 0  && y1 > 0  && x1 < sz(1) && y1 < sz(2)
                % bilinear
                x0 = floor(x1); y0 = floor(y1);
                a = x1 - x0; b= y1 - y0;
                a1 = (1-a); b1 = (1-b);
                img_o(i,j) = a1*b1*imgp(x0+1, y0+1) + a*b1*imgp(x0+2, y0+1) + a1*b*imgp(x0+1,y0+2) + a*b*imgp(x0+2, y0+2);
            end
        end
    end
    img_o = uint8(img_o);
end