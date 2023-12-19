function outputImage = colorManipulation(inputImage, targetColor, threshold, outputColor)
    % Convert the input image to double 
    inputImage = im2double(inputImage);

    % Create a binary mask based on color similarity
    binaryMask = createColorMask(inputImage, targetColor, threshold);

    % Convert targetColor and outputColor to double for consistent data types
    targetColorMatrix = ones(size(inputImage)) .* reshape(targetColor, [1, 1, 3]);
    outputColorMatrix = ones(size(inputImage)) .* reshape(outputColor, [1, 1, 3]);

    % Calculate deviation of input and targetColor
    deviationMatrix = targetColorMatrix - inputImage;

    % Calculate the output color transformation
    targetToOutput = outputColorMatrix - targetColorMatrix;

    % Calculate new image
    outputImage = inputImage + bsxfun(@times, deviationMatrix, binaryMask) + bsxfun(@times, targetToOutput, binaryMask);

    % Normalize pixels
    outputImage = max(0, min(1, outputImage));
end
