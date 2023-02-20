clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 15;

%===============================================================================
% Get the name of the image the user wants to use.
baseFileName = '0.jpg'; % Assign the one on the button that they clicked on.
% Get the full filename, with path prepended.
folder = 'F:\MRL\DataSet\All DataSet\ImageDataset_makan_100\Color\'
fullFileName = fullfile(folder, baseFileName);

%===============================================================================
% Read in a demo image.
rgbImage = imread(fullFileName);
% Get the dimensions of the image.  
% numberOfColorBands should be = 1.
[rows, columns, numberOfColorChannels] = size(rgbImage);
if numberOfColorChannels > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  grayImage = rgbImage(:, :, 1); % Take red channel.
else
  grayImage = rgbImage; % It's already gray scale, it's not color.
end
% Display the image.
%subplot(2, 3, 1);
%imshow(grayImage, []);
%axis on;
%caption = sprintf('Original Grayscale Image, %s', baseFileName);
%title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
%drawnow;
%hp = impixelinfo();
figure, imshow(grayImage, []);


% Set up figure properties:
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Get rid of tool bar and pulldown menus that are along top of figure.
set(gcf, 'Toolbar', 'none', 'Menu', 'none');
% Give a name to the title bar.
set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off') 

% Perform a filter on it.
neighborhood = ones(3); % Look in a square window of this size.
% PLAY AROUND WITH THIS PARAMETER TO OPTIMIZE IT.
filteredImage = stdfilt(grayImage, neighborhood);
%subplot(2, 3, 2);
%imshow(filteredImage, []);
%axis on;
%caption = sprintf('Filtered Image');
%
figure, imshow(filteredImage, []);
%{
% Get the histogram of the std image
subplot(2, 3, 3);
histogram(filteredImage);
axis on;
grid on;
caption = sprintf('Histogram of Filtered Image');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');


lowThreshold = 3.5;
% Let the user visually adjust it using
% http://www.mathworks.com/matlabcentral/fileexchange/29372-thresholding-an-image
[lowThreshold, highThreshold, lastThresholdedBand] = threshould(lowThreshold, 255, filteredImage);
% Binarize/threshold the image
binaryImage = filteredImage > lowThreshold;
% Fill holes
binaryImage = imfill(binaryImage, 'holes');
% Take largest blob only.
binaryImage = bwareafilt(binaryImage, 1);
subplot(2, 3, 4);
imshow(binaryImage, []);
axis on;
caption = sprintf('Filtered Image');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');

% Mask the image using bsxfun() function
maskedRgbImage = bsxfun(@times, rgbImage, cast(binaryImage, 'like', rgbImage));
subplot(2, 3, 5);
imshow(maskedRgbImage, []);
axis on;
caption = sprintf('Masked Image');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');

% Take convex hull of image
convexHullMask = bwconvhull(binaryImage);
% Mask the image using bsxfun() function
maskedRgbImage2 = bsxfun(@times, rgbImage, cast(convexHullMask, 'like', rgbImage));
subplot(2, 3, 6);
imshow(maskedRgbImage2, []);
axis on;
caption = sprintf('Masked with Convex Hull');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
%}