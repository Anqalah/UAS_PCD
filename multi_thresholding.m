clc;clear;close all;
 
Img = imread('logountad.png');
figure, imshow(Img), title('Citra Asli');

red = Img(:,:,1);
figure, imshow(red), title('Citra Grayscale');
seg_I = imquantize(red,[100 240]);
 
RGB = label2rgb(seg_I);
figure,imshow(RGB), title('Citra Segmentasi Red');

segmented_images = cell(1,3);
rgb_label = repmat(seg_I,[1 1 3]);
 
nRegions = 3;
 
for k = 1:nRegions
    color = Img;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
    figure,imshow(segmented_images{k}), title(strcat(['objects in region ',num2str(k)]));
end