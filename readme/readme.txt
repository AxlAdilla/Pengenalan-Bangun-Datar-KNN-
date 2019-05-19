Deskripsi: 
- Project Ini akan mengklasifikasi bangun datar dengan 
metode KNN,  

FOLDER :
- Data Latih 
  Berisi gambar bangun datar yang dijadikan objek pelatihan
  didalam data latih terdapat Raw,Edge,Resize
    - Raw berisi Data mentah 
    - Resize berisi Data mentah yang ukurannya telah dinormalisasi
    - Edge berisi Data mentah yang ukurannya telah dinormalisasi dan menggunakan tepi Canny
- Data Uji 
  Berisi gambar bangun datar yang dijadikan objek uji
  didalam data latih terdapat Raw,Edge,Resize
    - Raw berisi Data mentah 
    - Resize berisi Data mentah yang ukurannya telah dinormalisasi
    - Edge berisi Data mentah yang ukurannya telah dinormalisasi dan menggunakan tepi Canny

CSV  :
- data_latih.csv
  berisi nama img dan label untuk data latih
- data_uji.csv
  berisi nama img untuk data uji

File :
- main.m :
  Program Utama 
- raw_csv_to_edge.m :
  - parameter : csvFile,dirRawFolder,dirEdgedFolder,newSize
  - tujuan : menggenerate data tepi dan resize dengan tepi canny di directory Edge 
  - output : image baru  
- raw_csv_resize.m :
  - parameter : csvFile,dirRawFolder,dirResizeFolder,newSize
  - tujuan : menggenerate data tepi dan resize & biner di directory Resize 
  - output : image baru  
- edge_write_csv.m :
  - parameter : csvFile,dirEdgeFolder,dirEdgeCsvFile,newSize
  - tujuan : membuat Integeral Projection dari data Resize / Edge ke file csv
  - output : file csv berisi integralProjection
- create_csv_knn_data.m :
  - parameter : edgeCsvLatihName,edgeCsvUjiName,knnCsvName
  - tujuan : membuat file csv menghitung KNN dari integral Projection uji dan latih
  - output : file csv data knn
- hitungKnn.m :
  - parameter : knnCsvName,csvFileLatih
  - tujuan : menghitung 5 tetangga terdekat 
  - output : overwrite file csv data knn
  
Package yang dibutuhkan:
- image
- io

cara install package : 
- tulis script dibawah di command window octave
   - pkg install -forge image
   - pkg load image
   - pkg install -forge io
   - pkg load io