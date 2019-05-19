function raw_csv_to_edge(csvFile,dirRawFolder,dirEdgedFolder,newSize)
  # Read CSV Files
  dataCsv = csv2cell(csvFile);

  # Generate Canny Edge Files
  for i = 2:length(dataCsv)
    filename = dataCsv{i,1};
    img = imread(strcat(dirRawFolder,filename));
    img = rgb2gray(img);
    img = imresize(img,[newSize newSize]);
    [edgeCanny thresCanny] = edge(img,"Canny");
    imwrite(edgeCanny,strcat(dirEdgedFolder,filename));
    endfor
  endfunction