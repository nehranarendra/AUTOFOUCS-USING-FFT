% Read images
imageFiles = dir('C:\Users\naren\OneDrive\Desktop\MATLAB CODES\IMAGES_FOR_AF/*.jpg'); % Change path as needed
num_images = length(imageFiles);

% Define parameters
fft_size = 256; % Size of the FFT window

% Initialize variables
best_focus_score = -inf; % Initial best focus score
best_image_idx = 0; % Index of the best-focused image

% Loop through each image
for idx = 1:num_images
    % Read image
    img = imread(fullfile('C:\Users\naren\OneDrive\Desktop\MATLAB CODES\IMAGES_FOR_AF', imageFiles(idx).name));
    
    % Convert image to grayscale
    img_gray = rgb2gray(img);
    
    % Compute FFT
    fft_img = fft2(double(img_gray), fft_size, fft_size);
    
    % Compute focus score
    focus_score = sum(abs(fft_img(:)));
    
    % Update best focus score if better focus found
    if focus_score > best_focus_score
        best_focus_score = focus_score;
        best_image_idx = idx;
    end
end

% Display the best-focused image
best_image = imread(fullfile('C:\Users\naren\OneDrive\Desktop\MATLAB CODES\IMAGES_FOR_AF', imageFiles(best_image_idx).name));
imshow(best_image);
title('Best-Focused Image');

% Optionally save the best-focused image
imwrite(best_image, 'best_focused_image.jpg');
