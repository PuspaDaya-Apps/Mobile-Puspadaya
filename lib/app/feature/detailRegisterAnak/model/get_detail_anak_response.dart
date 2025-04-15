class GetDetailAnakResponse {
  String? message;
  Data? data;

  GetDetailAnakResponse({this.message, this.data});

  GetDetailAnakResponse.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? nik;
  String? namaAnak;
  String? tempatLahir;
  int? anakKe;
  String? tanggalLahir;
  String? jenisKelamin;
  String? beratBadanLahir;
  String? tinggiBadanLahir;
  String? lingkarLenganAtasLahir;
  String? lingkarKepalaLahir;
  String? jarakPosyandu;
  String? caraLahir;
  String? statusKelahiran;
  dynamic statusStunting;
  dynamic statusGizi;
  dynamic statusWasting;
  String? statusOrangTua;
  List<Pengukuran>? pengukuranAnak;
  List<DisabilitasAnak>? disabilitasAnak;
  KartuKeluarga? kartuKeluarga;
  dynamic pengasuhAnak;
  Posyandu2? posyandu;

  Data(
      {this.id,
      this.jarakPosyandu,
      this.pengukuranAnak,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.nik,
      this.namaAnak,
      this.tempatLahir,
      this.anakKe,
      this.tanggalLahir,
      this.jenisKelamin,
      this.beratBadanLahir,
      this.tinggiBadanLahir,
      this.lingkarLenganAtasLahir,
      this.lingkarKepalaLahir,
      this.caraLahir,
      this.statusKelahiran,
      this.statusStunting,
      this.statusGizi,
      this.statusWasting,
      this.statusOrangTua,
      this.disabilitasAnak,
      this.kartuKeluarga,
      this.pengasuhAnak,
      this.posyandu});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    nik = json["nik"];
    namaAnak = json["nama_anak"];
    tempatLahir = json["tempat_lahir"];
    anakKe = json["anak_ke"];
    tanggalLahir = json["tanggal_lahir"];
    jenisKelamin = json["jenis_kelamin"];
    beratBadanLahir = json["berat_badan_lahir"];
    tinggiBadanLahir = json["tinggi_badan_lahir"];
    lingkarLenganAtasLahir = json["lingkar_lengan_atas_lahir"];
    lingkarKepalaLahir = json["lingkar_kepala_lahir"];
    jarakPosyandu = json["jarak_posyandu"];
    caraLahir = json["cara_lahir"];
    statusKelahiran = json["status_kelahiran"];
    pengukuranAnak = json["pengukuran"] == null
        ? null
        : (json["pengukuran"] as List)
            .map((e) => Pengukuran.fromJson(e))
            .toList();
    statusStunting = json["status_stunting"];
    statusGizi = json["status_gizi"];
    statusWasting = json["status_wasting"];
    statusOrangTua = json["status_orang_tua"];
    disabilitasAnak = json["disabilitasAnak"] == null
        ? null
        : (json["disabilitasAnak"] as List)
            .map((e) => DisabilitasAnak.fromJson(e))
            .toList();
    kartuKeluarga = json["kartu_keluarga"] == null
        ? null
        : KartuKeluarga.fromJson(json["kartu_keluarga"]);
    pengasuhAnak = json["pengasuhAnak"];
    posyandu =
        json["posyandu"] == null ? null : Posyandu2.fromJson(json["posyandu"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    _data["nik"] = nik;
    _data["nama_anak"] = namaAnak;
    _data["tempat_lahir"] = tempatLahir;
    _data["anak_ke"] = anakKe;
    _data["tanggal_lahir"] = tanggalLahir;
    _data["jenis_kelamin"] = jenisKelamin;
    _data["berat_badan_lahir"] = beratBadanLahir;
    _data["tinggi_badan_lahir"] = tinggiBadanLahir;
    _data["lingkar_lengan_atas_lahir"] = lingkarLenganAtasLahir;
    _data["lingkar_kepala_lahir"] = lingkarKepalaLahir;
    _data["jarak_posyandu"] = jarakPosyandu;
    _data["cara_lahir"] = caraLahir;
    _data["status_kelahiran"] = statusKelahiran;
    _data["status_stunting"] = statusStunting;
    _data["status_gizi"] = statusGizi;
    _data["status_wasting"] = statusWasting;
    _data["status_orang_tua"] = statusOrangTua;
    if (disabilitasAnak != null) {
      _data["disabilitasAnak"] =
          disabilitasAnak?.map((e) => e.toJson()).toList();
    }
    if (kartuKeluarga != null) {
      _data["kartu_keluarga"] = kartuKeluarga?.toJson();
    }
    _data["pengasuhAnak"] = pengasuhAnak;
    if (posyandu != null) {
      _data["posyandu"] = posyandu?.toJson();
    }
    return _data;
  }
}

class Posyandu2 {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? namaPosyandu;
  dynamic alamat;

  Posyandu2(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.namaPosyandu,
      this.alamat});

  Posyandu2.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    namaPosyandu = json["nama_posyandu"];
    alamat = json["alamat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    _data["nama_posyandu"] = namaPosyandu;
    _data["alamat"] = alamat;
    return _data;
  }
}

class KartuKeluarga {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? nomorKartuKeluarga;
  Ibu? ibu;
  Ayah? ayah;

  KartuKeluarga(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.nomorKartuKeluarga,
      this.ibu,
      this.ayah});

  KartuKeluarga.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    nomorKartuKeluarga = json["nomor_kartu_keluarga"];
    ibu = json["ibu"] == null ? null : Ibu.fromJson(json["ibu"]);
    ayah = json["ayah"] == null ? null : Ayah.fromJson(json["ayah"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    _data["nomor_kartu_keluarga"] = nomorKartuKeluarga;
    if (ibu != null) {
      _data["ibu"] = ibu?.toJson();
    }
    if (ayah != null) {
      _data["ayah"] = ayah?.toJson();
    }
    return _data;
  }
}

class Ayah {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? nik;
  String? namaAyah;
  String? tempatLahir;
  String? tanggalLahir;
  String? nomorTelepon;
  String? rt;
  String? rw;
  String? alamat;
  String? golDarah;
  dynamic userId;
  Posyandu1? posyandu;
  KartuKeluarga2? kartuKeluarga;
  List<dynamic>? jenisDisabilitas;

  Ayah(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.nik,
      this.namaAyah,
      this.tempatLahir,
      this.tanggalLahir,
      this.nomorTelepon,
      this.rt,
      this.rw,
      this.alamat,
      this.golDarah,
      this.userId,
      this.posyandu,
      this.kartuKeluarga,
      this.jenisDisabilitas});

  Ayah.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    nik = json["nik"];
    namaAyah = json["nama_ayah"];
    tempatLahir = json["tempat_lahir"];
    tanggalLahir = json["tanggal_lahir"];
    nomorTelepon = json["nomor_telepon"];
    rt = json["rt"];
    rw = json["rw"];
    alamat = json["alamat"];
    golDarah = json["gol_darah"];
    userId = json["user_id"];
    posyandu =
        json["posyandu"] == null ? null : Posyandu1.fromJson(json["posyandu"]);
    kartuKeluarga = json["kartu_keluarga"] == null
        ? null
        : KartuKeluarga2.fromJson(json["kartu_keluarga"]);
    jenisDisabilitas = json["jenis_disabilitas"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    _data["nik"] = nik;
    _data["nama_ayah"] = namaAyah;
    _data["tempat_lahir"] = tempatLahir;
    _data["tanggal_lahir"] = tanggalLahir;
    _data["nomor_telepon"] = nomorTelepon;
    _data["rt"] = rt;
    _data["rw"] = rw;
    _data["alamat"] = alamat;
    _data["gol_darah"] = golDarah;
    _data["user_id"] = userId;
    if (posyandu != null) {
      _data["posyandu"] = posyandu?.toJson();
    }
    if (kartuKeluarga != null) {
      _data["kartu_keluarga"] = kartuKeluarga?.toJson();
    }
    if (jenisDisabilitas != null) {
      _data["jenis_disabilitas"] = jenisDisabilitas;
    }
    return _data;
  }
}

class KartuKeluarga2 {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? nomorKartuKeluarga;

  KartuKeluarga2(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.nomorKartuKeluarga});

  KartuKeluarga2.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    nomorKartuKeluarga = json["nomor_kartu_keluarga"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    _data["nomor_kartu_keluarga"] = nomorKartuKeluarga;
    return _data;
  }
}

class Posyandu1 {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? namaPosyandu;
  dynamic alamat;

  Posyandu1(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.namaPosyandu,
      this.alamat});

  Posyandu1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    namaPosyandu = json["nama_posyandu"];
    alamat = json["alamat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    _data["nama_posyandu"] = namaPosyandu;
    _data["alamat"] = alamat;
    return _data;
  }
}

class Ibu {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? nik;
  String? namaIbu;
  String? tempatLahir;
  String? tanggalLahir;
  String? rt;
  String? rw;
  String? alamat;
  String? nomorTelepon;
  String? golDarah;
  String? jenisKb;
  String? tanggalMelahirkanSebelumnya;
  int? jumlahAnak;
  dynamic userId;
  Posyandu? posyandu;
  KartuKeluarga1? kartuKeluarga;
  List<dynamic>? jenisDisabilitas;

  Ibu(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.nik,
      this.namaIbu,
      this.tempatLahir,
      this.tanggalLahir,
      this.rt,
      this.rw,
      this.alamat,
      this.nomorTelepon,
      this.golDarah,
      this.jenisKb,
      this.tanggalMelahirkanSebelumnya,
      this.jumlahAnak,
      this.userId,
      this.posyandu,
      this.kartuKeluarga,
      this.jenisDisabilitas});

  Ibu.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    nik = json["nik"];
    namaIbu = json["nama_ibu"];
    tempatLahir = json["tempat_lahir"];
    tanggalLahir = json["tanggal_lahir"];
    rt = json["rt"];
    rw = json["rw"];
    alamat = json["alamat"];
    nomorTelepon = json["nomor_telepon"];
    golDarah = json["gol_darah"];
    jenisKb = json["jenis_kb"];
    tanggalMelahirkanSebelumnya = json["tanggal_melahirkan_sebelumnya"];
    jumlahAnak = json["jumlah_anak"];
    userId = json["user_id"];
    posyandu =
        json["posyandu"] == null ? null : Posyandu.fromJson(json["posyandu"]);
    kartuKeluarga = json["kartu_keluarga"] == null
        ? null
        : KartuKeluarga1.fromJson(json["kartu_keluarga"]);
    jenisDisabilitas = json["jenis_disabilitas"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    _data["nik"] = nik;
    _data["nama_ibu"] = namaIbu;
    _data["tempat_lahir"] = tempatLahir;
    _data["tanggal_lahir"] = tanggalLahir;
    _data["rt"] = rt;
    _data["rw"] = rw;
    _data["alamat"] = alamat;
    _data["nomor_telepon"] = nomorTelepon;
    _data["gol_darah"] = golDarah;
    _data["jenis_kb"] = jenisKb;
    _data["tanggal_melahirkan_sebelumnya"] = tanggalMelahirkanSebelumnya;
    _data["jumlah_anak"] = jumlahAnak;
    _data["user_id"] = userId;
    if (posyandu != null) {
      _data["posyandu"] = posyandu?.toJson();
    }
    if (kartuKeluarga != null) {
      _data["kartu_keluarga"] = kartuKeluarga?.toJson();
    }
    if (jenisDisabilitas != null) {
      _data["jenis_disabilitas"] = jenisDisabilitas;
    }
    return _data;
  }
}

class KartuKeluarga1 {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? nomorKartuKeluarga;

  KartuKeluarga1(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.nomorKartuKeluarga});

  KartuKeluarga1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    nomorKartuKeluarga = json["nomor_kartu_keluarga"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    _data["nomor_kartu_keluarga"] = nomorKartuKeluarga;
    return _data;
  }
}

class Posyandu {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? namaPosyandu;
  dynamic alamat;

  Posyandu(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.namaPosyandu,
      this.alamat});

  Posyandu.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    namaPosyandu = json["nama_posyandu"];
    alamat = json["alamat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    _data["nama_posyandu"] = namaPosyandu;
    _data["alamat"] = alamat;
    return _data;
  }
}

class DisabilitasAnak {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? namaDisabilitas;

  DisabilitasAnak(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.namaDisabilitas});

  DisabilitasAnak.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    namaDisabilitas = json["nama_disabilitas"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    _data["nama_disabilitas"] = namaDisabilitas;
    return _data;
  }
}


class Pengukuran {
    String? tanggalPengukuran;
    String? beratBadan;
    String? tinggiBadan;
    String? lingkarLenganAtas;
    String? lingkarKepala;
    String? namaKader;
    String? statusStunting;
    String? statusGizi;

    Pengukuran({this.tanggalPengukuran, this.beratBadan, this.tinggiBadan, this.lingkarLenganAtas, this.lingkarKepala, this.namaKader, this.statusStunting, this.statusGizi});

    Pengukuran.fromJson(Map<String, dynamic> json) {
        tanggalPengukuran = json["tanggal_pengukuran"];
        beratBadan = json["berat_badan"];
        tinggiBadan = json["tinggi_badan"];
        lingkarLenganAtas = json["lingkar_lengan_atas"];
        lingkarKepala = json["lingkar_kepala"];
        namaKader = json["nama_kader"];
        statusStunting = json["status_stunting"];
        statusGizi = json["status_gizi"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["tanggal_pengukuran"] = tanggalPengukuran;
        _data["berat_badan"] = beratBadan;
        _data["tinggi_badan"] = tinggiBadan;
        _data["lingkar_lengan_atas"] = lingkarLenganAtas;
        _data["lingkar_kepala"] = lingkarKepala;
        _data["nama_kader"] = namaKader;
        _data["status_stunting"] = statusStunting;
        _data["status_gizi"] = statusGizi;
        return _data;
    }
}