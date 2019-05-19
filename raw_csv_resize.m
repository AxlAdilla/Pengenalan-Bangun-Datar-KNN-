function raw_csv_resize(csvFile,dirRawFolder,dirEdgedFolder,newSize)
  # Read CSV Files
  dataCsv = csv2cell(csvFile);

  # Generate Canny Edge Files
  for i = 2:length(dataCsv)
    filename = dataCsv{i,1};
    img = imread(strcat(dirRawFolder,filename));
    img = rgb2gray(img);
    img = im2bw(img);
    img = imresize(img,[newSize newSize]);
    
    imwrite(img,strcat(dirEdgedFolder,filename));
    endfor
  endfunction