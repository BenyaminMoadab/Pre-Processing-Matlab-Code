original = imread('F:\MRL\DataSet\DataSet-01\GT\10-20-10-01-125.png');
imshow(original);

se = strel('disk',0);
afterOpening = imopen(original,se);
figure
imshow(afterOpening,[]);