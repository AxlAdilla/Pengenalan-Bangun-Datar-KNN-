function edge_write_csv(csvFile,dirEdgeFolder,dirEdgeCsvFile,newSize)
  # Read CSV Files
  dataCsv = csv2cell(csvFile);
  
  #CreateCellToGenerateCSV
  integralProjectionCsv = cell(length(dataCsv)+1,(newSize*2)+2);
  integralProjectionCsv{1,1}="Filename";
  integralProjectionCsv{1,(newSize*2)+2}="Label"; 
  
  # Generate Integral Projection Files
  for x = 2:length(dataCsv)
    filename = dataCsv{x,1};
    labelCsv = dataCsv{x,2};
    img = imread(strcat(dirEdgeFolder,filename));
    [lenX lenY]=size(img);
    countHorizontal=zeros(1,lenY);
    countVertical=zeros(1,lenX);
    for j = 1:lenY
      for i = 1:lenX
        if(img(i,j)==1)
          countHorizontal(j) = countHorizontal(j)+1;
        endif
        if(img(j,i)==1)
          countVertical(j) = countVertical(j)+1;
        endif
      endfor
      integralProjectionCsv{x,j+1} = countHorizontal(j);
      integralProjectionCsv{x,newSize+1+j} = countVertical(j);
    endfor
    integralProjectionCsv{x,1} = filename;
    integralProjectionCsv{x,(newSize*2)+2} = labelCsv;
  endfor
  cell2csv(dirEdgeCsvFile,integralProjectionCsv);
endfunction