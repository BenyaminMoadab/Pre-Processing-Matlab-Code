%{
I = imread('F:\MRL\DataSet\All DataSet\ImageDataset_makan_100\Color\0.jpg');
Iblur = imgaussfilt(I,1);
Iblur2 = imgaussfilt(I,8);
Iblur3 = Iblur - Iblur2;
montage({I,Iblur3})
title('Original Image (Left) Vs. Gaussian Filtered Image (Right)')
%}

imRGB = imread("F:\MRL\DataSet\All DataSet\ImageDataset_makan_100\Color\77.jpg");
imshow(imRGB)
imLAB = rgb2lab(imRGB);

patch = imcrop(imLAB,[34,171,60,55]);
patchSq = patch.^2;
edist = sqrt(sum(patchSq,3));
patchVar = std2(edist).^2;

DoS = 2*patchVar;
smoothedLAB = imbilatfilt(imLAB,DoS);

smoothedRBG = lab2rgb(smoothedLAB,"Out","uint8");
montage({imRGB,smoothedRBG})
title("Original Image vs. Filtered Image with Degree of Smoothing: " + num2str(DoS))

DoS2 = 4*patchVar;
smoothedLAB2 = imbilatfilt(imLAB,DoS2,7);
smoothedRBG2 = lab2rgb(smoothedLAB2,"Out","uint8");
montage({imRGB,smoothedRBG2})
title("Original Image vs. Filtered Image with Degree of Smoothing: " + num2str(DoS) + " and Spatial Sigma: 7")

