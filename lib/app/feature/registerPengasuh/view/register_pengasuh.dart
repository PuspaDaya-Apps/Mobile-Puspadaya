import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/card_pengasuh_widget.dart';
import '../../../view/widget/search_text_field_widget.dart';
import 'model/pengasuh_item_model.dart';

class RegisterPengasuh extends StatelessWidget {
  const RegisterPengasuh({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterPengasuhView();
  }
}

class RegisterPengasuhView extends StatefulWidget {
  const RegisterPengasuhView({super.key});

  @override
  State<RegisterPengasuhView> createState() => _RegisterPengasuhViewState();
}

class _RegisterPengasuhViewState extends State<RegisterPengasuhView> {
  TextEditingController _searchController = TextEditingController();

  List<PengasuhItemModel> listPengasuh = [
    PengasuhItemModel(
        name: 'Siti Aisyah',
        nik: '362155482327273',
        child: 'Sancaka Adi Sanjaya'),
    PengasuhItemModel(
        name: 'Salsa Bilah Najma',
        nik: '3621554011737627',
        child: 'Ahmad Jaka '),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Pengasuh',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Expanded(
                    child: SearchTextFieldWidget(
                      controller: _searchController,
                      hintText: 'Cari Data Pengasuh',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      size: 30,
                      FluentIcons.filter_24_filled,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listPengasuh.length,
                  itemBuilder: (context, index) {
                    PengasuhItemModel pengasuh = listPengasuh[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CardPengasuhWidget(
                        onTap: () {
                          Navigator.pushNamed(
                              context, DETAIL_REGISTER_PENGASUH);
                        },
                        nama: pengasuh.name,
                        namaAnak: pengasuh.child,
                        nik: pengasuh.nik,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
