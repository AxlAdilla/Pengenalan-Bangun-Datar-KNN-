function create_csv_knn_data(edgeCsvLatihName,edgeCsvUjiName,knnCsvName)
  # Hitung K-Nearest Neighbor
  dataLatih = csv2cell(edgeCsvLatihName);
  dataUji = csv2cell(edgeCsvUjiName);
  [lenLatihX lenLatihY] = size(dataLatih);
  [lenUjiX lenUjiY] = size(dataUji);
  knnData = cell(lenUjiX,lenLatihX+6);
  knnData{1,1} = "filename";
  knnData{1,lenLatihX+6} = "filename";
  knnData{1,lenLatihX+1} = "Label 1";
  knnData{1,lenLatihX+2} = "Label 2";
  knnData{1,lenLatihX+3} = "Label 3";
  knnData{1,lenLatihX+4} = "Label 4";
  knnData{1,lenLatihX+5} = "Label 5";

  for i=2:lenLatihX
    fileName = dataLatih{i,1};
    knnData{1,i} = fileName;
  endfor

  for i=2:lenUjiX
    knnData{i,lenLatihX+6} = dataUji{i,1};
    knnData{i,1} = dataUji{i,1};
    for y=2:lenLatihX
      errSquare = 0;
      for j=2:lenUjiY-1
        intLatih = dataLatih{y,j};
        intUji = dataUji{i,j};
        errSquare = (intLatih - intUji).^2 + errSquare;
      endfor
      knnData{i,y} = sqrt(errSquare);
    endfor
  endfor
  cell2csv(knnCsvName,knnData);
endfunction