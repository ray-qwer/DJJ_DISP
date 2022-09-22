fig = imread("view.jpg");
fig = rgb2gray(fig);
subplot(3,1,1);
imshow(fig);

% blurred image with noise
L = 10;
k = zeros(21);
for i = [-L:L]
    for j = [-L:L]
        k(i+L+1,j+L+1) = exp(-0.1*(i^2+j^2));
    end
end

k = k*1/sum(k,"all");
blurred = conv2(fig, k, "same");
an = 0.9;
noise = an* (rand(size(fig))-0.5);
blurred = uint8(blurred + noise);
subplot(3,1,2);
imshow(blurred);


% deblur
F = fft2(blurred);
subplot(3,1,2)
k1 = zeros(size(blurred));
[M,N] = size(k1);
k1(1:L+1, 1:L+1) = k(L+1:end, L+1:end);     %2
k1(M-L+1:end,1:L+1) = k(1:L, L+1:end);        %1
k1(1:L+1, N-L+1:end) = k(L+1:end, 1:L);       %4
k1(M-L+1:end, N-L+1:end) = k(1:L, 1:L);         %3

K = fft2(k1);
C = 0.01;
H = 1./ (C ./ conj(K) + K);


% C = 0.2;
deblur_fft = F.*H;
deblur_fig = (abs(ifft2(deblur_fft)));
deblur_fig = uint8(deblur_fig * 255/ max(deblur_fig,[],"all"));
subplot(3,1,3);
imshow(deblur_fig);