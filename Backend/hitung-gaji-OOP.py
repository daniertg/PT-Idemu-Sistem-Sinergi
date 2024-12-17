class HitungGaji:
    @staticmethod
    def input_gaji():
        jam_kerja = float(input("Masukkan jumlah jam kerja: "))
        tarif_per_jam = float(input("Masukkan tarif per jam: "))
        return HitungGaji.hitung(jam_kerja, tarif_per_jam)  

    def hitung(jam_kerja, tarif_per_jam):
        return jam_kerja * (tarif_per_jam * 1.5) if jam_kerja >= 40 else jam_kerja * tarif_per_jam


print(f"Total gaji: {HitungGaji.input_gaji()}")

