function hitungKnn(knnCsvName,csvFileLatih)
  knnData = csv2cell(knnCsvName);
  [lenX lenY]=size(knnData);

  arrPoint = zeros(lenX-2,lenY-8);
  [lenArrPoinX lenArrPoinY] = size(arrPoint);
  for i=2:lenX-1  
    for j=2:lenY-7
      arrPoint(i-1,j-1) = knnData{i,j};
    endfor
  endfor

  arrpointnum = num2cell(arrPoint);
  #cell2csv('arrpointnum.csv',arrpointnum);

  [lenXsize lenYsize]=size(arrpointnum);
  SortArrPoint = zeros(lenXsize,lenYsize);
  for i=1:lenXsize
    for j=1:lenYsize
      SortArrPoint(i,:) = sort(arrPoint(i,:));
    endfor
  endfor

  #SortArrPointNum = num2cell(SortArrPoint);
  #cell2csv('SortArrPoint.csv',SortArrPointNum);
  
  dataLatih = csv2cell(csvFileLatih);
  [lenLatihX lenLatihY] = size(dataLatih);

  for i=2:lenX-1
    for j=2:lenY-7
      for k=1:5
        if (knnData{i,j}==SortArrPoint(i-1,k))
            knnData{i,lenLatihX+1+k} = dataLatih{j,2} ;
        endif
      endfor
    endfor
  endfor
  
  cell2csv(knnCsvName,knnData);
endfunction