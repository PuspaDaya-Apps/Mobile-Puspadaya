import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/card_anggotakader_widget.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/search_text_field_widget.dart';
import 'model/anggota_kader_item_model.dart';

class RegisterAnggotaKader extends StatelessWidget {
  const RegisterAnggotaKader({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterAnggotaKaderView();
  }
}

class RegisterAnggotaKaderView extends StatefulWidget {
  const RegisterAnggotaKaderView({super.key});

  @override
  State<RegisterAnggotaKaderView> createState() =>
      _RegisterAnggotaKaderViewState();
}

class _RegisterAnggotaKaderViewState extends State<RegisterAnggotaKaderView> {
  TextEditingController _searchController = TextEditingController();

  List<AnggotaKaderItemModel> listKader = [
    AnggotaKaderItemModel(
      name: 'Muhammad Kaivan Al Hakim',
      email: 'kaivan@gmail.com',
      initial: 'MK',
    ),
    AnggotaKaderItemModel(
      name: 'Intan wahyuni Soraya',
      email: 'intan@gmail.com',
      initial: 'IW',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Kelola  Anggota Kader',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: bluePrimaryMain,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 38,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, CREATE_REGISTER_ANGGOTA_KADER);
          // Add your navigation or functionality for adding new items
          print("Floating Action Button Pressed");
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
                      hintText: 'Cari Data Anak',
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
                  itemCount: listKader.length,
                  itemBuilder: (context, index) {
                    AnggotaKaderItemModel anggotaKader = listKader[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CardAnggotakaderWidget(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            DETAIL_REGISTER_ANGGOTA_KADER,
                          );
                        },
                        email: anggotaKader.email,
                        profile: anggotaKader.initial,
                        nama: anggotaKader.name,
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
