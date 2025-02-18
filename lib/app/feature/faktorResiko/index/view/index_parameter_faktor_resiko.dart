import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/faktorResiko/detail/faktor_resiko_asi_ekslusif.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/shadow.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../create/faktor_resiko_BBLR.dart';
import '../../create/faktor_resiko_IMD.dart';
import '../../create/faktor_resiko_asi_ekslusif.dart';
import '../../create/faktor_resiko_imunisasi.dart';
import '../../create/faktor_resiko_lahir_kembar.dart';
import '../../detail/faktor_resiko_IMD.dart';
import '../../detail/faktor_resiko_bblr.dart';
import '../../detail/faktor_resiko_imunisasi.dart';
import '../../detail/faktor_resiko_lahir_kembar.dart';
import '../model/parameter_faktor_resiko_model.dart';

class IndexParameterFaktorResiko extends StatelessWidget {
  final String id;
  final String bulan;
  const IndexParameterFaktorResiko(
      {super.key, required this.id, required this.bulan});

  @override
  Widget build(BuildContext context) {
    return IndexParameterFaktorResikoView(
      id: id,
      bulan: bulan,
    );
  }
}

class IndexParameterFaktorResikoView extends StatefulWidget {
  final String id;
  final String bulan;
  const IndexParameterFaktorResikoView(
      {super.key, required this.id, required this.bulan});

  @override
  State<IndexParameterFaktorResikoView> createState() =>
      _IndexParameterFaktorResikoViewState();
}

class _IndexParameterFaktorResikoViewState
    extends State<IndexParameterFaktorResikoView> {
  List<ParameterFaktorResikoModel> parameterFaktorResikoItem = [
    ParameterFaktorResikoModel(
      page: 'bblr',
      judul: 'BBLR',
      keterangan: 'BBLR pada Anak',
      status: true,
      terakhirDiIsi: DateTime.now(),
    ),
    ParameterFaktorResikoModel(
      page: 'imunisasi',
      judul: 'imunisasi',
      keterangan: 'imunisasi pada Anak',
      status: true,
      terakhirDiIsi: DateTime.now(),
    ),
    ParameterFaktorResikoModel(
      page: 'lahir-kembar',
      judul: 'Lahir Kembar',
      keterangan: 'Lahir Kembar pada Anak',
      status: true,
      terakhirDiIsi: DateTime.now(),
    ),
    ParameterFaktorResikoModel(
      page: 'imd',
      judul: 'IMD',
      keterangan: 'IMD pada Anak',
      status: true,
      terakhirDiIsi: DateTime.now(),
    ),
    ParameterFaktorResikoModel(
      page: 'asi-ekslusif',
      judul: 'Asi Ekslusif',
      keterangan: 'Asi Ekslusif pada Anak',
      status: true,
      terakhirDiIsi: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Faktor Resiko Permasalahan Gizi',
        background: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16), // Add some margin
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialogPetunjuk();
                  },
                );
              },
              child: Icon(
                FontAwesomeIcons.circleExclamation, // Font Awesome icon
                color: greenPrimaryMain, // Icon color
                size: 24, // Icon size
              ),
            ),
          ),
        ],
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: ListView.builder(
        itemCount: parameterFaktorResikoItem.length,
        itemBuilder: (context, index) {
          ParameterFaktorResikoModel parameter =
              parameterFaktorResikoItem[index];
          return Padding(
            padding:
                const EdgeInsets.only(bottom: 5, top: 5, left: 16, right: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: shadowSm,
              ),
              child: ExpansionTile(
                collapsedShape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
                leading: parameter.status
                    ? Icon(
                        FontAwesomeIcons.circleCheck,
                        color: greenPrimaryMain,
                        size: 24,
                      )
                    : Icon(
                        FontAwesomeIcons.circleExclamation, // Font Awesome icon
                        color: goldPrimaryMain, // Icon color
                        size: 24,
                      ),
                title: Text(parameter.judul),
                childrenPadding:
                    EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 16),
                children: [
                  Container(
                    alignment: Alignment.centerLeft, // Align text to the left
                    child: Text(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      'Terakhir Diisi : ${DateFormat('d MMMM y', 'id_ID').format(parameter.terakhirDiIsi)}',
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    alignment: Alignment.centerLeft, // Align text to the left
                    child: Text(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      'Keterangan : ${parameter.keterangan}',
                    ),
                  ),
                  SizedBox(height: 16),
                  parameter.status
                      ? ButtonPrimary(
                          color: greenPrimaryMain,
                          mainButton: () =>
                              gateNavigatoToDetail(context, parameter.page),
                          mainButtonMessage: 'Lihat Data',
                        )
                      : ButtonPrimary(
                          color: greenPrimaryMain,
                          mainButton: () =>
                              gateNavigatoToCreate(context, parameter.page),
                          mainButtonMessage: 'Lakukan Pendataan',
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AlertDialogPetunjuk extends StatelessWidget {
  const AlertDialogPetunjuk({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: false,
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                textAlign: TextAlign.center,
                'Petunjuk',
                style: AppTextStyles.primaryTextMedium.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Di dalam halaman faktor resiko permasalahan gizi terdapat daftar resiko yang memiliki bentuk kotak dengan ikon penanda masing-masing.",
            ),
            SizedBox(
              height: 16,
            ),
            ExpansionTile(
              collapsedShape: RoundedRectangleBorder(
                side: BorderSide(
                  color: stroke10,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: stroke10,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              leading: Icon(
                FontAwesomeIcons.circleExclamation, // Font Awesome icon
                color: goldPrimaryMain, // Icon color
                size: 24,
              ),
              title: Text('BBLR'),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Jenis Jenis Ikon Penanda : ',
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '1. Perlu diKerjakan',
            ),
            SizedBox(
              height: 4,
            ),
            Icon(
              FontAwesomeIcons.circleExclamation, // Font Awesome icon
              color: goldPrimaryMain, // Icon color
              size: 32,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: 12,
              ),
              'Faktor resiko dengan ikon ini memiliki arti bahwa faktor resiko tersebut perlu di kerjakan atau di isi',
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '2. Sudah diKerjakan',
            ),
            SizedBox(
              height: 4,
            ),
            Icon(
              FontAwesomeIcons.circleCheck,
              color: greenPrimaryMain,
              size: 32,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: 12,
              ),
              'Faktor resiko dengan ikon ini memiliki arti bahwa faktor resiko tersebut sudah selesai di kerjakan, dan anda perlu menunggu jangka waktu tertentu sesuai dengan faktor resiko nya untuk dapat dikerjakan kembali.',
            )
          ],
        ),
      ),
    );
  }
}

void gateNavigatoToDetail(BuildContext context, String page) {
  switch (page) {
    case 'bblr':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailFaktorResikoBBLR()));
      break;
    case 'imunisasi':
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailFaktorResikoImunisasi()));
      break;
    case 'lahir-kembar':
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailFaktorResikoLahirKembar()));
      break;
    case 'imd':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailFaktorResikoIMD()));
      break;
    case 'asi-ekslusif':
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailFaktorResikoAsiEksklusif()));
      break;
  }
}

void gateNavigatoToCreate(BuildContext context, String page) {
  switch (page) {
    case 'bblr':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CreateFaktorResikoBBLR()));
      break;
    case 'imunisasi':
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateFaktorResikoImunisasi()));
      break;
    case 'lahir-kembar':
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateFaktorResikoLahirKembar()));
      break;
    case 'imd':
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CreateFaktorResikoIMD()));
      break;
    case 'asi-ekslusif':
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateFaktorResikoAsiEksklusif()));
      break;
  }
}
