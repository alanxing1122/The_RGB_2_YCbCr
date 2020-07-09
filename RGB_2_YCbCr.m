clc;
close;
src=imread('e:\Alanxing\test.png');
%得到以double形式存在的R、G、B分量
r = double(src(:,:,1));
g = double(src(:,:,2));
b = double(src(:,:,3));
% tranforming...
y = floor(0.257*r + 0.564*g + 0.098*b+16); 
 
Cb = floor(-0.148*r - 0.291*g + 0.439*b+128);
Cr = floor(0.439*r- 0.368*g - 0.071*b+12);
%对所得的各个分量进行调整，使之介于[0.255]区间内
y(y> 255)= 255;
y(y<0) = 0;
Cb(Cb> 255) = 255;
Cb(Cb<0) = 0;
Cr(Cr> 255)= 255;
Cr(Cr<0) = 0;
%将Y、Cb、Cr分量化为8位无符号整数并存放在dst矩阵中
dst(:,:,1) = uint8(y);
dst(:,:,2) = uint8(Cb);
dst(:,:,3) = uint8(Cr); 
subplot( 2,2,1),imshow(src),title('原图');
subplot( 2,2,2),imshow(dst),title('自编之rgb到YCBCR');