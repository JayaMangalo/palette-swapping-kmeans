% Load an example image
inputImage = imread('img/akirakurusu.jpg');

% Sample data
targetColor = [0.7152    0.0237    0.0295];   % Example target color
threshold = 0.1;                 % Example threshold value

% Call the function
binaryMask = createColorMask(inputImage, targetColor, threshold);

% Display the sizes of targetColorMatrix and inputImage
disp('Size of targetColorMatrix:');
disp(size(binaryMask));

% Display the binary mask
figure;
imshow(binaryMask);
title('Binary Mask');