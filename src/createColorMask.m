function binaryMask = createColorMask(inputImage, targetColor, threshold)
    % Convert the input image to double 
    inputImage = im2double(inputImage);

    % Reshape targetColor to the size of the image 
    targetColorMatrix = ones(size(inputImage)) .* reshape(targetColor, [1, 1, 3]);

    % Calculate the distance of color and image
    colorDistances = sqrt(sum((inputImage - targetColorMatrix).^2, 3));

    % Mask with threshold
    binaryMask = colorDistances <= threshold;
end