function [segmented_image, color_palette] = kmeans_segmentation(image, n_clusters)
    % Convert the image to double 
    image = im2double(image);

    % Reshape the image into a 2D matrix
    [height, width, num_channels] = size(image);
    reshaped_image = reshape(image, height * width, num_channels);

    % K-means clustering
    [idx, centroids] = kmeans(reshaped_image, n_clusters);

    % Assign each pixel to its corresponding cluster centroid
    segmented_image = zeros(size(reshaped_image));
    for i = 1:n_clusters
        cluster_pixels = reshaped_image(idx == i, :);
        segmented_image(idx == i, :) = repmat(centroids(i, :), size(cluster_pixels, 1), 1);
    end

    % Reshape the segmented and return
    segmented_image = reshape(segmented_image, height, width, num_channels);

    % Extract color palette from the centroids and return
    color_palette = centroids;
end
