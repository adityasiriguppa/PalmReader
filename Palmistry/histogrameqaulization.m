Input=out2;
% function Output = alg_h(Input)
% To know number of row and column (total number of pixels)
[row, column, d] = size(Input);
i=0;
while(i<d)  %note that the loop is for using with RGB images
i=i+1;
% Calculate of the histogram
histo=imhist(Input(:,:,i));
% Convert Input in double
Input(:,:,i) = double (Input(:,:,i));
% Calculate probability of grey level pixel
probability=histo./(row*column);
% Accumulated probability and weights
equalizer = cumsum(probability)*256;
%Replace grey level pixels in function of equalizer
Output(:,:,i)=equalizer(Input(:,:,i)+1);
end
%Convert to 8 bits unsigned intiger data
Input = uint8(Input); Output = uint8(Output);
[y1,x]=imhist(Input(:,:,1)); [y2,x]=imhist(Input(:,:,2)); [y3,x]=imhist(Input(:,:,3));
plot(x,y1,'r', x,y2,'g', x,y3,'b');
 
figure;
[y4,x]=imhist(Output(:,:,1)); [y5,x]=imhist(Output(:,:,2)); [y6,x]=imhist(Output(:,:,3));
plot(x,y4,'r', x,y5,'g', x,y6,'b');
 
figure;subplot(1,2,1);
imshow(Input);title('Original image');
subplot(1,2,2);imshow(Output);title('After histogram equalisation');
 
% end
