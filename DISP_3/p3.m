obama = imread("obama_256.png");
obama = rgb2gray(obama);
subplot(3,1,1);
imshow(obama);

cj = imread("chung_jung_256.jpg");
cj = rgb2gray(cj);
subplot(3,1,2);
imshow(cj);

% 2d fourier transform
o_fft = fft2(obama);
c_fft = fft2(cj);


% filter, recommend to do mask then multiply them
size_o = size(o_fft);
th = size_o(1)/30;
low_filter = zeros(size_o);
for p = [1:size_o(1)]
    for q = [1:size_o(2)]
        if p + q-2 <= th || p + size_o(2) - q <= th || size_o(1) - p + q <= th || size_o(1) + size_o(2) +2 - p - q <= th
            % low frequency
           low_filter(p,q) = 1;
        end
    end
end
high_filter = ones(size_o) - low_filter;

o_fft = low_filter .* o_fft;
c_fft = high_filter .* c_fft;

new_fft = c_fft + o_fft;
new_fig = uint8(abs(ifft2(new_fft)));
% new_fig = abs(new_fig);
subplot(3,1,3);
imshow(new_fig);