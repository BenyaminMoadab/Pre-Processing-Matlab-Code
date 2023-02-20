BW1 = imread('F:\MRL\DataSet\DataSet-01\GT\10-20-10-01-125.png');
figure;imshow(BW1)
SE = strel("disk",7);
BW2 = imerode(BW1,SE);
figure;imshow(BW2)