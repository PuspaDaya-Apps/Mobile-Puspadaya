import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/createRegisterOrangTua/view/create_register_ayah.dart';
import 'package:puspadaya/app/feature/createRegisterOrangTua/view/create_register_ibu.dart';
import 'package:puspadaya/app/feature/detailRegisterOrangTua/bloc/detail_register_orang_tua_bloc.dart';
import 'package:puspadaya/app/feature/detailRegisterOrangTua/model/get_orangtua_detail_response.dart';
import 'package:puspadaya/app/feature/updateRegisterOrangTua/bloc/update_register_orang_tua_bloc.dart';
import 'package:puspadaya/app/feature/updateRegisterOrangTua/view/update_register_ayah.dart';
import 'package:puspadaya/app/feature/updateRegisterOrangTua/view/update_register_ibu.dart';
// import 'package:puspadaya/app/feature/alamat/model/get_provinsi_response.dart'
//     as ProvinsiModel;
// import 'package:puspadaya/app/feature/alamat/model/get_kabupaten_response.dart'
//     as KabupatenModel;
// import 'package:puspadaya/app/feature/alamat/model/get_kecamatan_response.dart'
//     as KecamatanModel;
// import 'package:puspadaya/app/feature/alamat/model/get_desa_kelurahan_response.dart'
//     as DesaKelurahanModel;
// import 'package:puspadaya/app/feature/alamat/model/get_dusun_response.dart'
//     as DusunModel;

import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/text_field_widget2.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../model/data_wilayah_model.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../alamat/bloc/alamatSaveCubit/alamat_save_cubit.dart';
import '../../alatUkur/detail/view/detail_alat_ukur.dart';
import '../../createRegisterAnak/cubit/generate_kk_cubit.dart';
import '../../createRegisterAnak/cubit/generate_nik_cubit.dart';
import '../model/patch_orang_tua_body.dart' as PatchOrangTua;

class UpdateRegisterOrangTua extends StatelessWidget {
  final String ayahId;
  const UpdateRegisterOrangTua({super.key, required this.ayahId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlamatSaveCubit>(
          create: (BuildContext context) => AlamatSaveCubit(),
        ),
        BlocProvider<UpdateRegisterOrangTuaBloc>(
          create: (BuildContext context) => UpdateRegisterOrangTuaBloc(),
        ),
        BlocProvider<DetailRegisterOrangTuaBloc>(
          create: (BuildContext context) => DetailRegisterOrangTuaBloc(),
        ),
      ],
      child: UpdateRegisterOrangTuaView(
        ayahId: ayahId,
      ),
    );
  }
}

class UpdateRegisterOrangTuaView extends StatefulWidget {
  final String ayahId;
  const UpdateRegisterOrangTuaView({super.key, required this.ayahId});

  @override
  State<UpdateRegisterOrangTuaView> createState() =>
      _UpdateRegisterOrangTuaViewState();
}

class _UpdateRegisterOrangTuaViewState
    extends State<UpdateRegisterOrangTuaView>
    with SingleTickerProviderStateMixin {
  final _formAyahkey = GlobalKey<FormState>();
  final _formIbukey = GlobalKey<FormState>();

  final _ayahScrollController = ScrollController();
  final _ibuScrollController = ScrollController();

  late TabController _tabController;

  // ! ayah

  // Controller untuk Data Ayah dan Data Ibu
  // ? ayah controller
  final TextEditingController kkAyahController = TextEditingController();
  final TextEditingController nikAyahController = TextEditingController();
  final TextEditingController namaAyahController = TextEditingController();
  final TextEditingController tempatLahirAyahController =
      TextEditingController();
  final TextEditingController tanggalLahirAyahController =
      TextEditingController();
  final TextEditingController alamatAyahController = TextEditingController();
  final TextEditingController teleponAyahController = TextEditingController();
  final TextEditingController rTAyahController = TextEditingController();
  final TextEditingController rWAyahController = TextEditingController();

  //? ayah selected
  List<DataKabupatenKota> dataKabupatenKotaAyah = [];
  List<DataKecamatan> dataKecamatanAyah = [];
  List<DataDesaKelurahan> dataDesaKelurahanAyah = [];
  List<DataDusun> dataDusunAyah = [];

  DataKabupatenKota? selectedKabupatenAyah;
  DataKecamatan? selectedKecamatanAyah;
  DataDesaKelurahan? selectedDesaAyah;
  DataDusun? selectedDusunAyah;

  String selectedGolDarahAyah = '-';

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAyah = [];
  List<String> selectedDisabilityLabelsAyah = [];

  String rawKartuKeluargaAyah = '';

  // !ayah fokus node
  final FocusNode kkAyahFocusNode = FocusNode();
  final FocusNode nikAyahFocusNode = FocusNode();
  final FocusNode namaAyahFocusNode = FocusNode();
  final FocusNode tempatLahirAyahFocusNode = FocusNode();
  final FocusNode tanggalLahirAyahFocusNode = FocusNode();
  final FocusNode alamatAyahFocusNode = FocusNode();
  final FocusNode teleponAyahFocusNode = FocusNode();
  final FocusNode rtAyahFocusNode = FocusNode();
  final FocusNode rwAyahFocusNode = FocusNode();

  final FocusNode selectedKabupatenAyahFocusNode = FocusNode();
  final FocusNode selectedKecamatanAyahFocusNode = FocusNode();
  final FocusNode selectedDesaAyahFocusNode = FocusNode();
  final FocusNode selectedDusunAyahFocusNode = FocusNode();
  final FocusNode selectedGolDarahAyahFocusNode = FocusNode();

  //! validate formKeyController
  // ? Ayah
  final GlobalKey<FormFieldState> kkAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> nikAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> namaAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tempatLahirAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tanggalLahirAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> alamatAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> teleponAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> rtAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> rwAyahKey = GlobalKey<FormFieldState>();

  // ? Ayah selected formkey
  final GlobalKey<FormFieldState> selectedKabupatenAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedKecamatanAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedDesaAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedDusunAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedGolDarahAyahKey =
      GlobalKey<FormFieldState>();

  //? function handler controler ayah

  Future<void> _selectDateAyah(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime initialDate = DateTime(2000); // Set initial date to the year 1945
    DateTime firstDate = DateTime(1950); // Set the first date to the year 1945
    DateTime lastDate = now; // Set the last date to the current date

    DateTime? pickedDate = await showDatePicker(
      cancelText: "Batalkan",
      confirmText: "OK",
      currentDate: now,
      helpText: "Pilih Tanggal",
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        tanggalLahirAyahController.text =
            "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _toggleDisabilityAyah(int index) {
    setState(() {
      selectedDisabilitiesAyah[index] = !selectedDisabilitiesAyah[index];
      if (selectedDisabilitiesAyah[index]) {
        selectedDisabilityLabelsAyah.add(disabilities[index]);
      } else {
        selectedDisabilityLabelsAyah.remove(disabilities[index]);
      }
    });
  }

  void _removeDisabilityAyah(String label) {
    setState(() {
      selectedDisabilityLabelsAyah.remove(label);
      int index = disabilities.indexOf(label);
      if (index != -1) {
        selectedDisabilitiesAyah[index] = false;
      }
    });
  }

  bool _isGenerateAyahValid() {
    logger.d(
        'tempatLahirAyahController.text is ${tempatLahirAyahController.text}');
    logger.d(
        'tanggalLahirAyahController.text is ${tanggalLahirAyahController.text}');
    logger.d('selectedKabupatenAyah is $selectedKabupatenAyah');
    logger.d('selectedKecamatanAyah is $selectedKecamatanAyah');
    return tempatLahirAyahController.text.isNotEmpty &&
        tanggalLahirAyahController.text.isNotEmpty &&
        selectedKabupatenAyah !=
            null && // Check if selectedKabupatenAyah is not null
        selectedKecamatanAyah !=
            null; // Check if selectedDusunAyahId is not null
  }

  void _handleKabupatenAyahChanged(DataKabupatenKota value) {
    setState(() {
      selectedKabupatenAyah = value;
      dataKecamatanAyah.clear();
      dataKecamatanAyah.addAll(value.kecamatan);
      //clear list
      dataDesaKelurahanAyah.clear();
      dataDusunAyah.clear();

      //clear data
      selectedKecamatanAyah = null;
      selectedDesaAyah = null;
      selectedDusunAyah = null;
      logger.d('set selectedKabupatenAyah to $selectedKabupatenAyah');
    });
  }

  void _handleKecamatanAyahChanged(DataKecamatan value) {
    setState(() {
      selectedKecamatanAyah = value;
      dataDesaKelurahanAyah.clear();
      dataDesaKelurahanAyah.addAll(value.desaKelurahan);

      //clear list
      dataDusunAyah.clear();

      //clear data
      selectedDesaAyah = null;
      selectedDusunAyah = null;
    });
  }

  void _handleDesaAyahChanged(DataDesaKelurahan value) {
    setState(() {
      selectedDesaAyah = value;
      dataDusunAyah.clear();
      dataDusunAyah.addAll(value.dusun);

      //clear data
      selectedDusunAyah = null;
    });
  }

  void _handleDusunAyahChanged(DataDusun value) {
    setState(() {
      selectedDusunAyah = value;
    });
  }

  void _handleGolonganDarahAyahChanged(dynamic value) {
    setState(() {
      selectedGolDarahAyah = value;
    });
  }

  bool submitAyahForm() {
    logger.d('submit form');
    // Langkah 1: Jalankan validasi form
    if (_formAyahkey.currentState!.validate()) {
      // ! form valid save to local
      // widget.onSaveData({'nik_ayah': });
      logger.d('form ayah valid');

      // logger.d('ayah data is ${widget.cubit.getAyahData().toJson()}');

      // widget.onNext();
      _tabController.animateTo(1);
      return true;
    } else {
      // JIKA FORM TIDAK VALID
      print('Form tidak valid. Mencari error pertama...');

      // Buat daftar field Anda secara berurutan sesuai tampilan di UI
      // Ini PENTING agar scroll menuju ke error PALING ATAS
      final Map<GlobalKey<FormFieldState>, FocusNode> fieldMap = {
        kkAyahKey: kkAyahFocusNode,
        nikAyahKey: nikAyahFocusNode,
        namaAyahKey: namaAyahFocusNode,
        tempatLahirAyahKey: tempatLahirAyahFocusNode,
        tanggalLahirAyahKey: tanggalLahirAyahFocusNode,
        teleponAyahKey: teleponAyahFocusNode,
        rtAyahKey: rtAyahFocusNode,
        rwAyahKey: rwAyahFocusNode,
        alamatAyahKey: alamatAyahFocusNode,
        selectedKabupatenAyahKey: selectedKabupatenAyahFocusNode,
        selectedKecamatanAyahKey: selectedKecamatanAyahFocusNode,
        selectedDesaAyahKey: selectedDesaAyahFocusNode,
        selectedDusunAyahKey: selectedDusunAyahFocusNode,
        selectedGolDarahAyahKey: selectedGolDarahAyahFocusNode
      };
      // logger.d(fieldMap);

      // Cari field pertama yang memiliki error
      for (var entry in fieldMap.entries) {
        final key = entry.key;
        final focusNode = entry.value;

        logger.d(
            'key is ${key}, context current is ${key.currentContext}, has error ${key.currentState?.hasError}');
        // Cek apakah field ini punya error
        if (key.currentState?.hasError ?? false) {
          // Jika ya, scroll ke field ini

          print('Field ${entry.key} has error: ${key.currentState?.hasError}');
          print('Current context: ${key.currentContext}');
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Scrollable.ensureVisible(
              key.currentContext!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: 0.3,
            );
            focusNode.requestFocus();
          });

          // Hentikan loop karena kita hanya butuh fokus ke error pertama
          break;
        }
      }
      return false;
    }
  }

  // ! ibu
  //? ibu controller
  final TextEditingController kkIbuController = TextEditingController();
  final TextEditingController nikIbuController = TextEditingController();
  final TextEditingController namaIbuController = TextEditingController();
  final TextEditingController tempatLahirIbuController =
      TextEditingController();
  final TextEditingController tanggalLahirIbuController =
      TextEditingController();
  final TextEditingController alamatIbuController = TextEditingController();
  final TextEditingController teleponIbuController = TextEditingController();
  final TextEditingController rTIbuController = TextEditingController();
  final TextEditingController rWIbuController = TextEditingController();
  final TextEditingController tanggalKelahiranAnakSebelumnyaIbuController =
      TextEditingController();
  final TextEditingController jumlahAnakIbuController =
      TextEditingController(text: '0');

  // focus node ibu
  final FocusNode kkIbuFocusNode = FocusNode();
  final FocusNode nikIbuFocusNode = FocusNode();
  final FocusNode namaIbuFocusNode = FocusNode();
  final FocusNode tempatLahirIbuFocusNode = FocusNode();
  final FocusNode tanggalLahirIbuFocusNode = FocusNode();
  final FocusNode alamatIbuFocusNode = FocusNode();
  final FocusNode teleponIbuFocusNode = FocusNode();
  final FocusNode rtIbuFocusNode = FocusNode();
  final FocusNode rwIbuFocusNode = FocusNode();
  final FocusNode tanggalKelahiranAnakSebelumnyaIbuFocusNode = FocusNode();
  final FocusNode jumlahAnakIbuFocusNode = FocusNode();
  final FocusNode selectedKabupatenIbuFocusNode = FocusNode();
  final FocusNode selectedKecamatanIbuFocusNode = FocusNode();
  final FocusNode selectedDesaIbuFocusNode = FocusNode();
  final FocusNode selectedDusunIbuFocusNode = FocusNode();
  final FocusNode selectedJenisKBIbuFocusNode = FocusNode();
  final FocusNode selectedGolDarahIbuFocusNode = FocusNode();

  //? selected
  List<DataKabupatenKota> dataKabupatenKotaIbu = [];
  List<DataKecamatan> dataKecamatanIbu = [];
  List<DataDesaKelurahan> dataDesaKelurahanIbu = [];
  List<DataDusun> dataDusunIbu = [];

  DataKabupatenKota? selectedKabupatenIbu;
  DataKecamatan? selectedKecamatanIbu;
  DataDesaKelurahan? selectedDesaIbu;
  DataDusun? selectedDusunIbu;

  String selectedJenisKBIbu = '-';
  String selectedGolDarahIbu = '-';

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesIbu = [];
  List<String> selectedDisabilityLabelsIbu = [];

  String rawKartuKeluargaIbu = '';

  // ? validate Ibu key
  final GlobalKey<FormFieldState> kkIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> nikIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> namaIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tempatLahirIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tanggalLahirIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> alamatIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> teleponIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> rtIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> rwIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tanggalKelahiranAnakSebelumnyaIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> jumlahAnakIbuKey =
      GlobalKey<FormFieldState>();
//!selected

// ? Ibu
  final GlobalKey<FormFieldState> selectedKabupatenIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedKecamatanIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedDesaIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedDusunIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedJenisKBIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedGolDarahIbuKey =
      GlobalKey<FormFieldState>();

  //? function handler controler Ibu

  Future<void> _selectDateIbu(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime initialDate = DateTime(2000); // Set initial date to the year 1945
    DateTime firstDate = DateTime(1950); // Set the first date to the year 1945
    DateTime lastDate = now; // Set the last date to the current date

    DateTime? pickedDate = await showDatePicker(
      cancelText: "Batalkan",
      confirmText: "OK",
      currentDate: now,
      helpText: "Pilih Tanggal",
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        tanggalLahirIbuController.text =
            "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectDateKelahiranSebelumnyaIbu(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        tanggalKelahiranAnakSebelumnyaIbuController.text =
            "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
    // Jika pickedDate adalah null, tidak melakukan apa-apa
  }

  void _removeDisabilityIbu(String label) {
    setState(() {
      selectedDisabilityLabelsIbu.remove(label);
      int index = disabilities.indexOf(label);
      if (index != -1) {
        selectedDisabilitiesIbu[index] = false;
      }
    });
  }

  void _toggleDisabilityIbu(int index) {
    setState(() {
      selectedDisabilitiesIbu[index] = !selectedDisabilitiesIbu[index];
      if (selectedDisabilitiesIbu[index]) {
        selectedDisabilityLabelsIbu.add(disabilities[index]);
      } else {
        selectedDisabilityLabelsIbu.remove(disabilities[index]);
      }
    });
  }

  bool _isGenerateIbuValid() {
    return tempatLahirIbuController.text.isNotEmpty &&
        tanggalLahirIbuController.text.isNotEmpty &&
        selectedKabupatenIbu !=
            null && // Check if selectedKabupatenIbu is not null
        selectedKecamatanIbu != null; // Check if selectedDusunIbuId is not null
  }

  void _handleKabupatenIbuChanged(DataKabupatenKota value) {
    setState(() {
      selectedKabupatenIbu = value;
      dataKecamatanIbu.clear();
      dataKecamatanIbu.addAll(value.kecamatan);
      //clear list
      dataDesaKelurahanIbu.clear();
      dataDusunIbu.clear();

      //clear data
      selectedKecamatanIbu = null;
      selectedDesaIbu = null;
      selectedDusunIbu = null;
      logger
          .d('set selectedKabupatenIbu to ${selectedKabupatenIbu?.id ?? '-'}');
    });
  }

  void _handleKecamatanIbuChanged(DataKecamatan value) {
    setState(() {
      selectedKecamatanIbu = value;
      dataDesaKelurahanIbu.clear();
      dataDesaKelurahanIbu.addAll(value.desaKelurahan);

      //clear list
      dataDusunIbu.clear();

      //clear data
      selectedDesaIbu = null;
      selectedDusunIbu = null;
    });
  }

  void _handleDesaIbuChanged(DataDesaKelurahan value) {
    setState(() {
      selectedDesaIbu = value;
      dataDusunIbu.clear();
      dataDusunIbu.addAll(value.dusun);

      //clear data
      selectedDusunIbu = null;
    });
  }

  void _handleDusunIbuChanged(DataDusun value) {
    setState(() {
      selectedDusunIbu = value;
    });
  }

  void _handleJenisKBChanged(dynamic value) {
    setState(() {
      selectedJenisKBIbu = value;
    });
  }

  void _handleGolonganDarahIbuChanged(dynamic value) {
    setState(() {
      selectedGolDarahIbu = value;
    });
  }

  bool submitIbuForm() {
    // Langkah 1: Jalankan validasi form
    if (_formIbukey.currentState!.validate()) {
      // JIKA FORM VALID
      // Lakukan aksi selanjutnya, seperti menyimpan data atau pindah halaman
      logger.d('form valid dari ibu');
      // _goToNextTab(); // Contoh aksi
      // logger.d(_formAyahkey.currentState!.validate());

      // Validate the form
      debugPrint("Data Ayah");

      debugPrint("Data Ibu");
      PatchOrangTua.PatchOrangTuaBody dataOrangTua =
          PatchOrangTua.PatchOrangTuaBody(
        ayah: PatchOrangTua.Ayah(
          alamat: alamatAyahController.text,
          nomorKartuKeluarga: kkAyahController.text == rawKartuKeluargaAyah
              ? null
              : kkAyahController.text,
          dusunId: selectedDusunAyah!.id,
          golDarah: selectedGolDarahAyah,
          namaAyah: namaAyahController.text,
          nik: nikAyahController.text,
          nomorTelepon: teleponAyahController.text.isNotEmpty
              ? teleponAyahController.text
              : null,
          rt: rTAyahController.text,
          rw: rWAyahController.text,
          tempatLahir: tempatLahirAyahController.text,
          tanggalLahir: tanggalLahirAyahController.text,
          jenisDisabilitas: selectedDisabilityLabelsAyah.map((e) {
            return PatchOrangTua.JenisDisabilitas(namaDisabilitas: e);
          }).toList(),
        ),
        ibu: PatchOrangTua.Ibu(
          tanggalMelahirkanSebelumnya:
              tanggalKelahiranAnakSebelumnyaIbuController.text != ""
                  ? tanggalKelahiranAnakSebelumnyaIbuController.text
                  : null,
          jumlahAnak: jumlahAnakIbuController.text != ""
              ? int.parse(jumlahAnakIbuController.text)
              : 0,
          jenisKb: selectedJenisKBIbu,
          alamat: alamatIbuController.text,
          nomorKartuKeluarga: kkIbuController.text == rawKartuKeluargaIbu
              ? null
              : kkIbuController.text,
          dusunId: selectedDusunIbu!.id,
          golDarah: selectedGolDarahIbu,
          namaIbu: namaIbuController.text,
          nik: nikIbuController.text,
          nomorTelepon: teleponIbuController.text.isNotEmpty
              ? teleponIbuController.text
              : null,
          rt: rTIbuController.text,
          rw: rWIbuController.text,
          tempatLahir: tempatLahirIbuController.text,
          tanggalLahir: tanggalLahirIbuController.text,
          jenisDisabilitas: selectedDisabilityLabelsIbu.map((e) {
            return PatchOrangTua.JenisDisabilitas(namaDisabilitas: e);
          }).toList(),
        ),
      );

      logger.d(dataOrangTua.ayah.golDarah);

      context.read<UpdateRegisterOrangTuaBloc>().add(SendUpdateRegisterOrangTua(
          ayahId: widget.ayahId, patchOrangTuaBody: dataOrangTua));
      return true;
    } else {
      // JIKA FORM TIDAK VALID
      logger.d('Form tidak valid. Mencari error pertama...');

      // Buat daftar field Anda secara berurutan sesuai tampilan di UI
      // Ini PENTING agar scroll menuju ke error PALING ATAS
      final Map<GlobalKey<FormFieldState>, FocusNode> fieldMap = {
        kkIbuKey: kkIbuFocusNode,
        nikIbuKey: nikIbuFocusNode,
        namaIbuKey: namaIbuFocusNode,
        tempatLahirIbuKey: tempatLahirIbuFocusNode,
        tanggalLahirIbuKey: tanggalLahirIbuFocusNode,
        rtIbuKey: rtIbuFocusNode,
        rwIbuKey: rwIbuFocusNode,
        selectedKabupatenIbuKey: selectedKabupatenIbuFocusNode,
        selectedKecamatanIbuKey: selectedKecamatanIbuFocusNode,
        selectedDesaIbuKey: selectedDesaIbuFocusNode,
        selectedDusunIbuKey: selectedDusunIbuFocusNode,
        alamatIbuKey: alamatIbuFocusNode,
        teleponIbuKey: teleponIbuFocusNode,
        selectedJenisKBIbuKey: selectedJenisKBIbuFocusNode,
        selectedGolDarahIbuKey: selectedGolDarahIbuFocusNode,
        tanggalKelahiranAnakSebelumnyaIbuKey:
            tanggalKelahiranAnakSebelumnyaIbuFocusNode,
        jumlahAnakIbuKey: jumlahAnakIbuFocusNode,
      };
      // logger.d(fieldMap);

      // Cari field pertama yang memiliki error
      for (var entry in fieldMap.entries) {
        final key = entry.key;
        final focusNode = entry.value;

        logger.d(
            'key is ${key}, context current is ${key.currentContext}, has error ${key.currentState?.hasError}');
        // Cek apakah field ini punya error
        if (key.currentState?.hasError ?? false) {
          // Jika ya, scroll ke field ini

          print('Field ${entry.key} has error: ${key.currentState?.hasError}');
          print('Current context: ${key.currentContext}');
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Scrollable.ensureVisible(
              key.currentContext!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: 0.3,
            );
            focusNode.requestFocus();
          });

          // Hentikan loop karena kita hanya butuh fokus ke error pertama
          break;
        }
      }
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    logger.d('trigger fetch');
    context.read<AlamatSaveCubit>().getDataWilayah();

    context
        .read<DetailRegisterOrangTuaBloc>()
        .add(FeathingDetailRegisterOrangTua(ayahId: widget.ayahId));
    // Inisialisasi selectedDisabilitiesIbu dengan panjang yang sama dengan disabilities
    selectedDisabilitiesAyah =
        List<bool>.from(List.filled(disabilities.length, false));
    selectedDisabilitiesIbu =
        List<bool>.from(List.filled(disabilities.length, false));

    // final List<ProvinsiModel.Datum> selectProvinsi = [];

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        // Cek jika pindah dari tab Ayah (0) ke tab Ibu (1)
        if (_tabController.previousIndex == 0 && _tabController.index == 1) {
          // Trigger penyimpanan otomatis form Ayah
          logger.d('trigger submit ayah form when pindah ke ibu');
          bool valid = submitAyahForm();
          if (!valid) {
            // Batalkan pindah tab: kembali ke tab Ayah
            _tabController.animateTo(0);
          }
        } else if (_tabController.previousIndex == 1 &&
            _tabController.index == 0) {
          // Trigger penyimpanan otomatis form Ibu
          logger.d('trigger submit ayah form when pindah ke ibu');
          if (_formIbukey.currentState!.validate()) {
            // Jika form Ibu valid, lanjutkan ke tab Ayah
            logger.d('form ibu valid');
            _tabController.animateTo(0);
          } else {
            // JIKA FORM TIDAK VALID
            logger.d('Form tidak valid. Mencari error pertama...');

            // Buat daftar field Anda secara berurutan sesuai tampilan di UI
            // Ini PENTING agar scroll menuju ke error PALING ATAS
            final Map<GlobalKey<FormFieldState>, FocusNode> fieldMap = {
              kkIbuKey: kkIbuFocusNode,
              nikIbuKey: nikIbuFocusNode,
              namaIbuKey: namaIbuFocusNode,
              tempatLahirIbuKey: tempatLahirIbuFocusNode,
              tanggalLahirIbuKey: tanggalLahirIbuFocusNode,
              rtIbuKey: rtIbuFocusNode,
              rwIbuKey: rwIbuFocusNode,
              selectedKabupatenIbuKey: selectedKabupatenIbuFocusNode,
              selectedKecamatanIbuKey: selectedKecamatanIbuFocusNode,
              selectedDesaIbuKey: selectedDesaIbuFocusNode,
              selectedDusunIbuKey: selectedDusunIbuFocusNode,
              alamatIbuKey: alamatIbuFocusNode,
              teleponIbuKey: teleponIbuFocusNode,
              selectedJenisKBIbuKey: selectedJenisKBIbuFocusNode,
              selectedGolDarahIbuKey: selectedGolDarahIbuFocusNode,
              tanggalKelahiranAnakSebelumnyaIbuKey:
                  tanggalKelahiranAnakSebelumnyaIbuFocusNode,
              jumlahAnakIbuKey: jumlahAnakIbuFocusNode,
            };
            // logger.d(fieldMap);

            // Cari field pertama yang memiliki error
            for (var entry in fieldMap.entries) {
              final key = entry.key;
              final focusNode = entry.value;

              logger.d(
                  'key is ${key}, context current is ${key.currentContext}, has error ${key.currentState?.hasError}');
              // Cek apakah field ini punya error
              if (key.currentState?.hasError ?? false) {
                // Jika ya, scroll ke field ini

                print(
                    'Field ${entry.key} has error: ${key.currentState?.hasError}');
                print('Current context: ${key.currentContext}');
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Scrollable.ensureVisible(
                    key.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    alignment: 0.3,
                  );
                  focusNode.requestFocus();
                });

                // Hentikan loop karena kita hanya butuh fokus ke error pertama
                break;
              }
            }
            _tabController.animateTo(1);
          }
        }
        // submitIbuForm();
      }
    });
  }

  @override
  void dispose() {
    // Dispose TabController
    _tabController.dispose();
    //! ayah dispose
    kkAyahController.dispose();
    nikAyahController.dispose();
    namaAyahController.dispose();
    tempatLahirAyahController.dispose();
    tanggalLahirAyahController.dispose();
    alamatAyahController.dispose();
    teleponAyahController.dispose();
    rTAyahController.dispose();
    rWAyahController.dispose();
    // Fokus node dispose
    kkAyahFocusNode.dispose();
    nikAyahFocusNode.dispose();
    namaAyahFocusNode.dispose();
    tempatLahirAyahFocusNode.dispose();
    tanggalLahirAyahFocusNode.dispose();
    alamatAyahFocusNode.dispose();
    teleponAyahFocusNode.dispose();
    rtAyahFocusNode.dispose();
    rwAyahFocusNode.dispose();
    selectedKabupatenAyahFocusNode.dispose();
    selectedKecamatanAyahFocusNode.dispose();
    selectedDesaAyahFocusNode.dispose();
    selectedDusunAyahFocusNode.dispose();
    selectedGolDarahAyahFocusNode.dispose();
    selectedKabupatenAyahKey.currentState?.dispose();
    selectedKecamatanAyahKey.currentState?.dispose();
    selectedDesaAyahKey.currentState?.dispose();
    selectedDusunAyahKey.currentState?.dispose();
    selectedGolDarahAyahKey.currentState?.dispose();
    //? ayah form key dispose
    kkAyahKey.currentState?.dispose();
    nikAyahKey.currentState?.dispose();
    namaAyahKey.currentState?.dispose();
    tempatLahirAyahKey.currentState?.dispose();
    tanggalLahirAyahKey.currentState?.dispose();
    alamatAyahKey.currentState?.dispose();
    teleponAyahKey.currentState?.dispose();
    rtAyahKey.currentState?.dispose();
    rwAyahKey.currentState?.dispose();
    //? ayah selected dispose
    selectedKabupatenAyahKey.currentState?.dispose();
    selectedKecamatanAyahKey.currentState?.dispose();
    selectedDesaAyahKey.currentState?.dispose();
    selectedDusunAyahKey.currentState?.dispose();
    selectedGolDarahAyahKey.currentState?.dispose();
    //? ayah selected dispose
    kkAyahKey.currentState?.dispose();
    nikAyahKey.currentState?.dispose();
    namaAyahKey.currentState?.dispose();
    tempatLahirAyahKey.currentState?.dispose();
    tanggalLahirAyahKey.currentState?.dispose();
    alamatAyahKey.currentState?.dispose();
    teleponAyahKey.currentState?.dispose();

    //! ibu dispose
    kkIbuController.dispose();
    nikIbuController.dispose();
    namaIbuController.dispose();
    tempatLahirIbuController.dispose();
    tanggalLahirIbuController.dispose();
    alamatIbuController.dispose();
    teleponIbuController.dispose();
    rTIbuController.dispose();
    rWIbuController.dispose();
    tanggalKelahiranAnakSebelumnyaIbuController.dispose();
    jumlahAnakIbuController.dispose();

    // Fokus node dispose
    kkIbuFocusNode.dispose();
    nikIbuFocusNode.dispose();
    namaIbuFocusNode.dispose();
    tempatLahirIbuFocusNode.dispose();
    tanggalLahirIbuFocusNode.dispose();
    alamatIbuFocusNode.dispose();
    teleponIbuFocusNode.dispose();
    rtIbuFocusNode.dispose();
    rwIbuFocusNode.dispose();
    tanggalKelahiranAnakSebelumnyaIbuFocusNode.dispose();
    jumlahAnakIbuFocusNode.dispose();
    selectedKabupatenIbuFocusNode.dispose();
    selectedKecamatanIbuFocusNode.dispose();
    selectedDesaIbuFocusNode.dispose();
    selectedDusunIbuFocusNode.dispose();
    selectedJenisKBIbuFocusNode.dispose();
    selectedGolDarahIbuFocusNode.dispose();
    selectedKabupatenIbuKey.currentState?.dispose();
    selectedKecamatanIbuKey.currentState?.dispose();
    selectedDesaIbuKey.currentState?.dispose();
    selectedDusunIbuKey.currentState?.dispose();
    selectedJenisKBIbuKey.currentState?.dispose();
    selectedGolDarahIbuKey.currentState?.dispose();
    //? ibu form key dispose
    kkIbuKey.currentState?.dispose();
    nikIbuKey.currentState?.dispose();
    namaIbuKey.currentState?.dispose();
    tempatLahirIbuKey.currentState?.dispose();
    tanggalLahirIbuKey.currentState?.dispose();
    alamatIbuKey.currentState?.dispose();
    teleponIbuKey.currentState?.dispose();
    rtIbuKey.currentState?.dispose();
    rwIbuKey.currentState?.dispose();
    tanggalKelahiranAnakSebelumnyaIbuKey.currentState?.dispose();
    jumlahAnakIbuKey.currentState?.dispose();
    //? ibu selected dispose
    selectedKabupatenIbuKey.currentState?.dispose();
    selectedKecamatanIbuKey.currentState?.dispose();
    selectedDesaIbuKey.currentState?.dispose();
    selectedDusunIbuKey.currentState?.dispose();
    selectedJenisKBIbuKey.currentState?.dispose();
    selectedGolDarahIbuKey.currentState?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Tambah Data Orang Tua',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height / 1.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: BlocSelector<DetailRegisterOrangTuaBloc,
                DetailRegisterOrangTuaState, GetOrangtuaDetailResponseModel?>(
              selector: (state) {
                if (state is DetailRegisterOrangTuaSuccess) {
                  return state.getOrangTuaDetailResponse;
                }
                return null;
              },
              builder: (context, detailData) {
                if (detailData == null) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    child: Center(
                      child: SpinKitThreeBounce(
                        color: bluePrimaryMain,
                        size: 50.0,
                      ),
                    ),
                  ); // Jika data masih loading
                }
                //? Set Data Ayah
                if (kkAyahController.text.isEmpty) {
                  kkAyahController.text =
                      detailData.data.ayah.kartuKeluarga.nomorKartuKeluarga;
                  rawKartuKeluargaAyah =
                      detailData.data.ayah.kartuKeluarga.nomorKartuKeluarga;
                  nikAyahController.text = detailData.data.ayah.nik;
                  namaAyahController.text = detailData.data.ayah.namaAyah;
                  tempatLahirAyahController.text =
                      detailData.data.ayah.tempatLahir;
                  tanggalLahirAyahController.text = DateFormat('yyyy-MM-dd')
                      .format(detailData.data.ayah.tanggalLahir);
                  alamatAyahController.text = detailData.data.ayah.alamat;

                  if (detailData.data.ayah.nomorTelepon != "0") {
                    teleponAyahController.text =
                        detailData.data.ayah.nomorTelepon ?? "-";
                  }

                  rTAyahController.text = detailData.data.ayah.rt;
                  rWAyahController.text = detailData.data.ayah.rw;
                  selectedGolDarahAyah = detailData.data.ayah.golDarah;
                  selectedDisabilityLabelsAyah = detailData
                      .data.ayah.jenisDisabilitas!
                      .map((e) => e.namaDisabilitas)
                      .toList();
                }

                //? Set Data Ibu
                if (kkIbuController.text.isEmpty) {
                  kkIbuController.text =
                      detailData.data.ibu.kartuKeluarga.nomorKartuKeluarga;
                  rawKartuKeluargaIbu =
                      detailData.data.ibu.kartuKeluarga.nomorKartuKeluarga;
                  nikIbuController.text = detailData.data.ibu.nik;
                  namaIbuController.text = detailData.data.ibu.nama;
                  tempatLahirIbuController.text =
                      detailData.data.ibu.tempatLahir;
                  tanggalLahirIbuController.text = DateFormat('yyyy-MM-dd')
                      .format(detailData.data.ibu.tanggalLahir);
                  alamatIbuController.text = detailData.data.ibu.alamat;
                  tanggalKelahiranAnakSebelumnyaIbuController.text =
                      detailData.data.ibu.tanggalMelahirkanSebelumnya != null
                          ? detailData.data.ibu.tanggalMelahirkanSebelumnya!
                          : "";
                  if (detailData.data.ibu.nomorTelepon != "0") {
                    teleponIbuController.text =
                        detailData.data.ibu.nomorTelepon ?? "-";
                  }

                  rTIbuController.text = detailData.data.ibu.rt;
                  rWIbuController.text = detailData.data.ibu.rw;
                  jumlahAnakIbuController.text =
                      detailData.data.ibu.jumlahAnak.toString();
                  selectedGolDarahIbu = detailData.data.ibu.golDarah;
                  selectedJenisKBIbu = detailData.data.ibu.jenisKB;
                  selectedDisabilityLabelsIbu = detailData
                      .data.ibu.jenisDisabilitas!
                      .map((e) => e.namaDisabilitas)
                      .toList();
                }
                return Column(
                  children: [
                    BlocListener<UpdateRegisterOrangTuaBloc,
                        UpdateRegisterOrangTuaState>(
                      listener: (context, state) {
                        if (state is UpdateRegisterOrangTuaFailedState) {
                          showTopSnackBar(
                            Overlay.of(context),
                            animationDuration:
                                const Duration(milliseconds: 600),
                            displayDuration: const Duration(milliseconds: 2200),
                            reverseAnimationDuration:
                                const Duration(milliseconds: 300),
                            TopSnackbarWidget().error(state.error),
                          );
                        }
                        if (state is UpdateRegisterOrangTuaSuccesState) {
                          Navigator.pop(context, 1);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: backgroundWhite20,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TabBar(
                          isScrollable: false,
                          padding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorAnimation: TabIndicatorAnimation.elastic,
                          dividerHeight: 0,
                          controller: _tabController,
                          indicator: BoxDecoration(
                            color: bluePrimaryMain,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          unselectedLabelColor: textSecondary1,
                          labelColor: Colors.white,
                          tabs: [
                            Tab(text: 'Data Ayah'),
                            Tab(text: 'Data Ibu'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    BlocBuilder<AlamatSaveCubit, AlamatSaveState>(
                      // buildWhen: (previous, current) => current is ShowAllSection,
                      builder: (context, state) {
                        logger.d('state is ${state.toString()}');
                        debugPrint(state.toString());
                        if (state is GetAlamatProccessState) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: Center(
                              child: SpinKitThreeBounce(
                                color: bluePrimaryMain,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        if (state is GetAlamatSuccessState) {
                          if (dataKabupatenKotaAyah.isEmpty ||
                              dataKabupatenKotaIbu.isEmpty) {
                            //ayah
                            dataKabupatenKotaAyah.addAll(
                                state.dataWilayahModel.provinsi.kabupatenKota);
                            selectedKabupatenAyah =
                                dataKabupatenKotaAyah.firstWhere((element) =>
                                    element.id ==
                                    detailData.data.ayah.dusun.desaKelurahan
                                        .kecamatan.kabupaten.id);

                            dataKecamatanAyah
                                .addAll(selectedKabupatenAyah!.kecamatan);
                            selectedKecamatanAyah =
                                dataKecamatanAyah.firstWhere((element) =>
                                    element.id ==
                                    detailData.data.ayah.dusun.desaKelurahan
                                        .kecamatan.id);
                            dataDesaKelurahanAyah
                                .addAll(selectedKecamatanAyah!.desaKelurahan);
                            selectedDesaAyah = dataDesaKelurahanAyah.firstWhere(
                                (element) =>
                                    element.id ==
                                    detailData
                                        .data.ayah.dusun.desaKelurahan.id);
                            dataDusunAyah.addAll(selectedDesaAyah!.dusun);
                            selectedDusunAyah = dataDusunAyah.firstWhere(
                                (element) =>
                                    element.id ==
                                    detailData.data.ayah.dusun.id);

                            //ibu
                            dataKabupatenKotaIbu.addAll(
                                state.dataWilayahModel.provinsi.kabupatenKota);
                            selectedKabupatenIbu =
                                dataKabupatenKotaIbu.firstWhere((element) =>
                                    element.id ==
                                    detailData.data.ibu.dusun.desaKelurahan
                                        .kecamatan.kabupaten.id);

                            dataKecamatanIbu
                                .addAll(selectedKabupatenIbu!.kecamatan);
                            selectedKecamatanIbu = dataKecamatanIbu.firstWhere(
                                (element) =>
                                    element.id ==
                                    detailData.data.ibu.dusun.desaKelurahan
                                        .kecamatan.id);
                            dataDesaKelurahanIbu
                                .addAll(selectedKecamatanIbu!.desaKelurahan);
                            selectedDesaIbu = dataDesaKelurahanIbu.firstWhere(
                                (element) =>
                                    element.id ==
                                    detailData.data.ibu.dusun.desaKelurahan.id);
                            dataDusunIbu.addAll(selectedDesaIbu!.dusun);
                            selectedDusunIbu = dataDusunIbu.firstWhere(
                                (element) =>
                                    element.id == detailData.data.ibu.dusun.id);
                          }

                          return Expanded(
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _tabController,
                              children: [
                                // !AYAH
                                UpdateRegisterAyah(
                                  formAyahkey: _formAyahkey,
                                  ayahScrollController: _ayahScrollController,
                                  kkAyahController: kkAyahController,
                                  nikAyahController: nikAyahController,
                                  namaAyahController: namaAyahController,
                                  tempatLahirAyahController:
                                      tempatLahirAyahController,
                                  tanggalLahirAyahController:
                                      tanggalLahirAyahController,
                                  alamatAyahController: alamatAyahController,
                                  teleponAyahController: teleponAyahController,
                                  rTAyahController: rTAyahController,
                                  rWAyahController: rWAyahController,
                                  selectedKabupatenAyah: selectedKabupatenAyah,
                                  selectedKecamatanAyah: selectedKecamatanAyah,
                                  selectedDesaAyah: selectedDesaAyah,
                                  selectedDusunAyah: selectedDusunAyah,
                                  selectedGolDarahAyah: selectedGolDarahAyah,
                                  selectedDisabilitiesAyah:
                                      selectedDisabilitiesAyah,
                                  selectedDisabilityLabelsAyah:
                                      selectedDisabilityLabelsAyah,
                                  selectedKabupatenAyahFocusNode:
                                      selectedKabupatenAyahFocusNode,
                                  selectedKecamatanAyahFocusNode:
                                      selectedKecamatanAyahFocusNode,
                                  selectedDesaAyahFocusNode:
                                      selectedDesaAyahFocusNode,
                                  selectedDusunAyahFocusNode:
                                      selectedDusunAyahFocusNode,
                                  selectedGolDarahAyahFocusNode:
                                      selectedGolDarahAyahFocusNode,
                                  selectedKabupatenAyahKey:
                                      selectedKabupatenAyahKey,
                                  selectedKecamatanAyahKey:
                                      selectedKecamatanAyahKey,
                                  selectedDesaAyahKey: selectedDesaAyahKey,
                                  selectedDusunAyahKey: selectedDusunAyahKey,
                                  selectedGolDarahAyahKey:
                                      selectedGolDarahAyahKey,
                                  kkAyahKey: kkAyahKey,
                                  nikAyahKey: nikAyahKey,
                                  namaAyahKey: namaAyahKey,
                                  tempatLahirAyahKey: tempatLahirAyahKey,
                                  tanggalLahirAyahKey: tanggalLahirAyahKey,
                                  alamatAyahKey: alamatAyahKey,
                                  teleponAyahKey: teleponAyahKey,
                                  rtAyahKey: rtAyahKey,
                                  rwAyahKey: rwAyahKey,
                                  tanggalLahirAyahFocusNode:
                                      tanggalLahirAyahFocusNode,
                                  alamatAyahFocusNode: alamatAyahFocusNode,
                                  teleponAyahFocusNode: teleponAyahFocusNode,
                                  rtAyahFocusNode: rtAyahFocusNode,
                                  rwAyahFocusNode: rwAyahFocusNode,
                                  dataKabupatenKotaAyah: dataKabupatenKotaAyah,
                                  dataKecamatanAyah: dataKecamatanAyah,
                                  dataDesaKelurahanAyah: dataDesaKelurahanAyah,
                                  dataDusunAyah: dataDusunAyah,
                                  kkAyahFocusNode: kkAyahFocusNode,
                                  nikAyahFocusNode: nikAyahFocusNode,
                                  namaAyahFocusNode: namaAyahFocusNode,
                                  tempatLahirAyahFocusNode:
                                      tempatLahirAyahFocusNode,
                                  onSelectDate: _selectDateAyah,
                                  removeDisability: _removeDisabilityAyah,
                                  toggleDisabilityAyah: _toggleDisabilityAyah,
                                  isGenerateAyahValid: _isGenerateAyahValid,
                                  dataWilayahModel: state.dataWilayahModel,
                                  handleKabupatenAyahChanged:
                                      _handleKabupatenAyahChanged,
                                  handleKecamatanAyahChanged:
                                      _handleKecamatanAyahChanged,
                                  handleDesaAyahChanged: _handleDesaAyahChanged,
                                  handleDusunAyahChanged:
                                      _handleDusunAyahChanged,
                                  handleGolDarahAyahChanged:
                                      _handleGolonganDarahAyahChanged,
                                  submitAyahForm: submitAyahForm,
                                ),

                                //!IBU
                                UpdateRegisterIbu(
                                    formIbukey: _formIbukey,
                                    ibuScrollController: _ibuScrollController,
                                    kkIbuController: kkIbuController,
                                    nikIbuController: nikIbuController,
                                    namaIbuController: namaIbuController,
                                    tempatLahirIbuController:
                                        tempatLahirIbuController,
                                    tanggalLahirIbuController:
                                        tanggalLahirIbuController,
                                    alamatIbuController: alamatIbuController,
                                    teleponIbuController: teleponIbuController,
                                    rTIbuController: rTIbuController,
                                    rWIbuController: rWIbuController,
                                    selectedJenisKB: selectedJenisKBIbu,
                                    jumlahAnakIbuController:
                                        jumlahAnakIbuController,
                                    tanggalKelahiranAnakSebelumnyaIbuController:
                                        tanggalKelahiranAnakSebelumnyaIbuController,
                                    dataKabupatenKotaIbu: dataKabupatenKotaIbu,
                                    selectedKabupatenIbu: selectedKabupatenIbu,
                                    selectedDesaIbu: selectedDesaIbu,
                                    selectedDusunIbu: selectedDusunIbu,
                                    selectedGolDarahIbu: selectedGolDarahIbu,
                                    selectedKecamatanIbu: selectedKecamatanIbu,
                                    selectedDisabilitiesIbu:
                                        selectedDisabilitiesIbu,
                                    selectedDisabilityLabelsIbu:
                                        selectedDisabilityLabelsIbu,
                                    dataKecamatanIbu: dataKecamatanIbu,
                                    dataDesaKelurahanIbu: dataDesaKelurahanIbu,
                                    dataDusunIbu: dataDusunIbu,
                                    kkIbuKey: kkIbuKey,
                                    nikIbuKey: nikIbuKey,
                                    namaIbuKey: namaIbuKey,
                                    tempatLahirIbuKey: tempatLahirIbuKey,
                                    tanggalLahirIbuKey: tanggalLahirIbuKey,
                                    alamatIbuKey: alamatIbuKey,
                                    teleponIbuKey: teleponIbuKey,
                                    rtIbuKey: rtIbuKey,
                                    rwIbuKey: rwIbuKey,
                                    jenisKBKey: selectedJenisKBIbuKey,
                                    jumlahAnakIbuKey: jumlahAnakIbuKey,
                                    tanggalKelahiranAnakSebelumnyaIbuKey:
                                        tanggalKelahiranAnakSebelumnyaIbuKey,
                                    selectedKabupatenIbuKey:
                                        selectedKabupatenIbuKey,
                                    selectedKecamatanIbuKey:
                                        selectedKecamatanIbuKey,
                                    selectedDesaIbuKey: selectedDesaIbuKey,
                                    selectedDusunIbuKey: selectedDusunIbuKey,
                                    selectedGolDarahIbuKey:
                                        selectedGolDarahIbuKey,
                                    kkIbuFocusNode: kkIbuFocusNode,
                                    nikIbuFocusNode: nikIbuFocusNode,
                                    namaIbuFocusNode: namaIbuFocusNode,
                                    tempatLahirIbuFocusNode:
                                        tempatLahirIbuFocusNode,
                                    tanggalLahirIbuFocusNode:
                                        tanggalLahirIbuFocusNode,
                                    alamatIbuFocusNode: alamatIbuFocusNode,
                                    teleponIbuFocusNode: teleponIbuFocusNode,
                                    rtIbuFocusNode: rtIbuFocusNode,
                                    rwIbuFocusNode: rwIbuFocusNode,
                                    jenisKBFocusNode:
                                        selectedJenisKBIbuFocusNode,
                                    jumlahAnakIbuFocusNode:
                                        jumlahAnakIbuFocusNode,
                                    tanggalKelahiranAnakSebelumnyaIbuFocusNode:
                                        tanggalKelahiranAnakSebelumnyaIbuFocusNode,
                                    selectedKabupatenIbuFocusNode:
                                        selectedKabupatenIbuFocusNode,
                                    selectedKecamatanIbuFocusNode:
                                        selectedKecamatanIbuFocusNode,
                                    selectedDesaIbuFocusNode:
                                        selectedDesaIbuFocusNode,
                                    selectedDusunIbuFocusNode:
                                        selectedDusunIbuFocusNode,
                                    selectedGolDarahIbuFocusNode:
                                        selectedGolDarahIbuFocusNode,
                                    onSelectDate: _selectDateIbu,
                                    removeDisability: _removeDisabilityIbu,
                                    toggleDisabilityIbu: _toggleDisabilityIbu,
                                    isGenerateIbuValid: _isGenerateIbuValid,
                                    dataWilayahModel: state.dataWilayahModel,
                                    handleKabupatenIbuChanged:
                                        _handleKabupatenIbuChanged,
                                    handleKecamatanIbuChanged:
                                        _handleKecamatanIbuChanged,
                                    handleDesaIbuChanged: _handleDesaIbuChanged,
                                    handleDusunIbuChanged:
                                        _handleDusunIbuChanged,
                                    handleGolDarahIbuChanged:
                                        _handleGolonganDarahIbuChanged,
                                    handleJenisKBChanged: _handleJenisKBChanged,
                                    onSelectDateKelahiranSebelumnya:
                                        _selectDateKelahiranSebelumnyaIbu,
                                    submitIbuForm: submitIbuForm)
                              ],
                            ),
                          );
                        }
                        // Handle other states...
                        return Container(); // Ganti dengan widget yang sesuai
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DialogDisabilitas extends StatefulWidget {
  final List<String> disabilities;
  final List<bool> selectedDisabilities;
  final Function(int) onToggleDisability;
  final Function(String) onAddCustomDisability;

  const DialogDisabilitas({
    Key? key,
    required this.disabilities,
    required this.selectedDisabilities,
    required this.onToggleDisability,
    required this.onAddCustomDisability,
  }) : super(key: key);

  @override
  State<DialogDisabilitas> createState() => _DialogDisabilitasState();
}

class _DialogDisabilitasState extends State<DialogDisabilitas> {
  bool isOtherChecked = false;
  TextEditingController otherDisabilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.zero,
      content: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pilih Disabilitas',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.calHeightMultiplier(16),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(6)),

            // Checklist untuk disabilitas yang tersedia
            ...List.generate(widget.disabilities.length, (index) {
              return CheckboxListWidget(
                isChecked: widget.selectedDisabilities[index],
                label: widget.disabilities[index],
                onChanged: (bool? value) {
                  setState(() {
                    widget.onToggleDisability(index);
                  });
                },
              );
            }),

            // Checkbox untuk opsi "Lainnya"
            // Checkbox untuk opsi "Lainnya"
            CheckboxListWidget(
              isChecked: isOtherChecked,
              label: "Lainnya",
              onChanged: (bool? value) {
                setState(() {
                  isOtherChecked = value ?? false;
                  if (!isOtherChecked) {
                    otherDisabilityController.clear();
                  }
                });
              },
            ),

            // TextField muncul jika "Lainnya" dipilih
            if (isOtherChecked)
              TextField(
                controller: otherDisabilityController,
                decoration: InputDecoration(
                  hintText: "Masukkan jenis disabilitas lainnya",
                  border: OutlineInputBorder(),
                ),
              ),

            SizedBox(height: SizeConfig.calHeightMultiplier(16)),

            ButtonPrimary(
              mainButtonMessage: 'Simpan',
              mainButton: () {
                if (isOtherChecked &&
                    otherDisabilityController.text.isNotEmpty) {
                  widget.onAddCustomDisability(otherDisabilityController.text);
                }
                Navigator.pop(context);
              },
              color: bluePrimaryMain,
            ),
          ],
        ),
      ),
    );
  }
}
