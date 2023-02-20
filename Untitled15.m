 A = imread('F:\MRL\DataSet\All DataSet\ImageDataset_makan_100\Color\0.jpg');

figure,imshow(A);title('Original Image');

HSV = rgb2hsv(A);
H = HSV(:,:,1); %Hue
%figure,imshow(H);colorbar;

H( H > mean2(H) ) = 1;
HSV(:,:,1) = H;
C = hsv2rgb(HSV);
figure,imshow(C);title('Hue Modified');



redChannel = C(:, :, 1);
greenChannel = C(:, :, 2);
blueChannel = C(:, :, 3);

% Median Filter the channels:
redMF = medfilt2(redChannel, [7 7]);
greenMF = medfilt2(greenChannel, [7 7]);
blueMF = medfilt2(blueChannel, [7 7]);

rgbFixed = cat(3, redMF, greenMF, blueMF);

figure, imshow(rgbFixed);