for k = 17:30
  jpgFilename = sprintf('t%d.jpg', k);
  fullFileName = fullfile('C:\Users\praharsha\Desktop\sreekar\sreekar\images', jpgFilename);
  if exist(fullFileName, 'file')
    imageData = imread(fullFileName );
  else
    warningMessage = sprintf('Warning: image file does not exist:\n%s', fullFileName);
    uiwait(warndlg(warningMessage));
  end
 imshow(imageData);
end
