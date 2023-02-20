
% MATLAB code for Histogram Equalisation
% on RGB image.
% read the image
k=imread("F:\MRL\DataSet\All DataSet\ImageDataset_makan_100\Color\0.jpg");

% Display original image.
imtool(k,[]);

% Apply histogram equalisation.
% on Red channel
k(:,:,1)=histeq(k(:,:,1));

% on Green channel
k(:,:,2)=histeq(k(:,:,2));

% on Blue channel
k(:,:,3)=histeq(k(:,:,3));

% Display enhanced image.
imtool(k,[]);

