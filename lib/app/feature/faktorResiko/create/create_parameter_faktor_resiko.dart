import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/shadow.dart';
import '../../../view/widget/alert_dialog_petunjuk_faktor_resiko.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../index/model/parameter_faktor_resiko_model.dart';
import 'faktor_resiko_BBLR.dart';
import 'faktor_resiko_IMD.dart';
import 'faktor_resiko_asi_ekslusif.dart';
import 'faktor_resiko_imunisasi.dart';
import 'faktor_resiko_lahir_kembar.dart';

class CreateParameterFaktorResiko extends StatelessWidget {
  final String anakId;
  final String bulan;
  const CreateParameterFaktorResiko(
      {super.key, required this.anakId, required this.bulan});

  @override
  Widget build(BuildContext context) {
    return CreateParameterFaktorResikoView(
      anakId: anakId,
      bulan: bulan,
    );
  }
}

class CreateParameterFaktorResikoView extends StatefulWidget {
  final String anakId;
  final String bulan;
  const CreateParameterFaktorResikoView(
      {super.key, required this.anakId, required this.bulan});

  @override
  State<CreateParameterFaktorResikoView> createState() =>
      _CreateParameterFaktorResikoViewState();
}

class _CreateParameterFaktorResikoViewState
    extends State<CreateParameterFaktorResikoView> {
  List<ParameterFaktorResikoModel> parameterFaktorResikoItem = [
    ParameterFaktorResikoModel(
      page: 'bblr',
      judul: 'BBLR',
      keterangan: 'BBLR pada Anak, (diisi 1 kali)',
      status: false,
      terakhirDiIsi: DateTime.now(),
    ),
    ParameterFaktorResikoModel(
      page: 'imunisasi',
      judul: 'imunisasi',
      keterangan: 'imunisasi pada anak, (diisi 3 bulan sekali)',
      status: false,
      terakhirDiIsi: DateTime.now(),
    ),
    ParameterFaktorResikoModel(
      page: 'lahir-kembar',
      judul: 'Lahir Kembar',
      keterangan: 'Lahir Kembar pada Anak, (diisi 1 kali)',
      status: false,
      terakhirDiIsi: DateTime.now(),
    ),
    ParameterFaktorResikoModel(
      page: 'imd',
      judul: 'IMD',
      keterangan: 'IMD pada Anak, (diisi 1 kali)',
      status: false,
      terakhirDiIsi: DateTime.now(),
    ),
    ParameterFaktorResikoModel(
      page: 'asi-ekslusif',
      judul: 'Asi Ekslusif',
      keterangan: 'Asi Ekslusif pada Anak, (diisi 1 kali)',
      status: false,
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ButtonPrimary(
            color: bluePrimaryMain,
            mainButtonMessage: 'Simpan Pendataan',
            mainButton: () {}),
      ),
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
                  ButtonPrimary(
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
