% Sample data
inputImage = imread('img/akirakurusu.jpg');
targetColor = [0.7152    0.0237    0.0295];   % Example target color
threshold = 0.5;                 % Example threshold value
outputColor = [1.0 1.0 1.0];   % Example output color

% Call the colorManipulation function
outputImage = colorManipulation(inputImage, targetColor, threshold, outputColor);

% Display the original and manipulated images side by side
figure;

subplot(1, 2, 1);
imshow(inputImage);
title('Original Image');

subplot(1, 2, 2);
imshow(outputImage);
title('Manipulated Image');
