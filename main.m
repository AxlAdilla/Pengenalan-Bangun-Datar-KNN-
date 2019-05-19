#directiory file csv latih
csvFileLatih = 'data_latih.csv'; 
#directiory file csv uji
csvFileUji = 'data_uji.csv';
#directiory folder raw image data latih
dirRawFolderLatih = 'data_latih/raw/';
#directiory folder raw image data uji
dirRawFolderUji ='data_uji/raw/';
#ubah resolusi image ke y x y
newSize = 50;
#directory folder resize latih
dirResizedFolderLatih = 'data_latih/resize/';
#directory folder resize uji
dirResizedFolderUji = 'data_uji/resize/';
#directory folder edge latih
dirEdgedFolderLatih = 'data_latih/edge/';
#directory folder edge uji
dirEdgedFolderUji = 'data_uji/edge/';
#fileIntegralProjection dari data latih
dirIntegralProjectionCsvLatih = 'integralProjectionLatih.csv';
#fileIntegralProjection dari data uji
dirIntegralProjectionCsvUji = 'integralProjectionUji.csv';
#file hasil KNN dari CSV
knnCsvName = 'knnData.csv';

#Jika Menggunakan Resize
#=====================================================
raw_csv_resize(csvFileLatih,dirRawFolderLatih,dirResizedFolderLatih,newSize);
raw_csv_resize(csvFileUji,dirRawFolderUji,dirResizedFolderUji,newSize);
edge_write_csv(csvFileLatih,dirResizedFolderLatih,dirIntegralProjectionCsvLatih,newSize);
edge_write_csv(csvFileUji,dirResizedFolderUji,dirIntegralProjectionCsvUji,newSize);
#=====================================================

#Jika Menggunakan Edge
#=====================================================
#raw_csv_to_edge(csvFileLatih,dirRawFolderLatih,dirEdgedFolderLatih,newSize);
#raw_csv_to_edge(csvFileUji,dirRawFolderUji,dirEdgedFolderUji,newSize);
#edge_write_csv(csvFileLatih,dirEdgedFolderLatih,dirIntegralProjectionCsvLatih,newSize);
#edge_write_csv(csvFileUji,dirEdgedFolderUji,dirIntegralProjectionCsvUji,newSize);
#=====================================================

create_csv_knn_data(dirIntegralProjectionCsvLatih,dirIntegralProjectionCsvUji,knnCsvName);
hitungKnn(knnCsvName,csvFileLatih);