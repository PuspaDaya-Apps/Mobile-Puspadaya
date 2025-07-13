import '../../../model/data_wilayah_model.dart';

class AlamatOrangTua {
  DataKabupatenKota? kabupaten;
  DataKecamatan? kecamatan;
  DataDesaKelurahan? desa;
  DataDusun? dusun;

  AlamatOrangTua({
    this.kabupaten,
    this.kecamatan,
    this.desa,
    this.dusun
  });
}