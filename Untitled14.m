%{

A = imread('F:\MRL\DataSet\All DataSet\ImageDataset_makan_100\Color\0.jpg');
figure
imshow(A)
title('Original Image')

sigma = 0.2;
alpha = 0.3;

t_speed = timeit(@() locallapfilt(A, sigma, alpha, 'NumIntensityLevels', 20))  

B_speed = locallapfilt(A, sigma, alpha, 'NumIntensityLevels', 20);
figure
imshow(B_speed)
title(['Enhanced with 20 intensity levels in ' num2str(t_speed) ' sec'])

%}

A = imread('F:\MRL\DataSet\All DataSet\ImageDataset_makan_100\Color\0.jpg');
%A = imresize(A, 0.25);
figure
imshow(A)
title('Original Image')

sigma = 0.2;
alpha = 7.0;

numLevels = 50;

B = locallapfilt(A, sigma, alpha, 'NumIntensityLevels', numLevels);

figure
imshow(B)
title('After smoothing details')



HSV = rgb2hsv(B);
H = HSV(:,:,1); %Hue
%figure,imshow(H);colorbar;

H( H > mean2(H) ) = 1;
HSV(:,:,1) = H;
C = hsv2rgb(HSV);
figure,imshow(C);title('Hue Modified');



