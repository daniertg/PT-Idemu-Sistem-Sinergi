# Memasukkan input jumlah jam kerja dan tarif per jam
jam_kerja = float(input("Masukkan jumlah jam kerja: "))
tarif_per_jam = float(input("Masukkan tarif per jam: "))

# Menghitung gaji yang diterima
gaji = 0
if jam_kerja >= 40:
    gaji = jam_kerja * (tarif_per_jam * 1.5)
    print("gaji yang diterima: ", gaji)
else :
    gaji = jam_kerja * tarif_per_jam
    print("gaji yang diterima: ", gaji)