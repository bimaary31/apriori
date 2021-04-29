library(arules)

transaksi <- read.transactions('D:/Market Basket Ball/file.txt', format=single, sep='\t', cols=c(1,2), skip=1))
inspect(transaksi)
print(transaksi)

#menampilkan data item transaksi
transaksi@itemInfo

#Menampilkan Daftar Kode Transaksi
transaksi@itemsetInfo

#Menghasilkan model Market Basket Analysis
mba <- apriori(transaksi,parameter = list(supp = 0.1, confidence = 0.5))

#Jumlah transaksi yang sering terjadi
itemFrequency(transaksi, type="absolute")

#mengetahui Top 3
data_item <- sort(data_item, decreasing = TRUE)


#Mengambil 3 item pertama
data_item <- data_item[1:3]
#Konversi data_item menjadi data frame dengan kolom Nama_Produk dan Jumlah
data_item <- data.frame("Nama Produk"=names(data_item), "Jumlah"=data_item, row.names=NULL)

print(data_item)

#Tampilan item frequency plot
itemFrequencyPlot(transaksi)

#melihat itemset per transaksi
inspect(transaksi)

#MENGHASILKAN RULES
apriori(transaksi)

#Melihat rules
mba <- apriori(transaksi)
inspect(mba)

#Filter rhs dengan item "Sirup" dan tampilkan
inspect(subset(mba, rhs %in% "Sirup"))

inspect(subset(mba, lhs %in% "Gula"))

inspect(subset(mba,lhs %in% "Pet Food" & rhs %in% "Sirup"))

#Mnghasilkan conffidance dan support
apriori(transaksi,parameter = list(supp = 0.1, confidence = 0.5))

#inspeksi rules yangdihasikan
mba <- apriori(transaksi,parameter = list(supp = 0.1, confidence = 0.5))
inspect(mba)

inspect(subset(mba, lhs %in% "Teh Celup" | rhs %in% "Teh Celup"))
inspect(subset(mba,(lhs %in% "Teh Celup" | rhs %in% "Teh Celup") & lift>1))
inspect(subset(mba,(lhs %ain% c("Pet Food", "Gula"))))


