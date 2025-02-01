import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/registerAnak/view/model/anak_item_model.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/search_text_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../view/widget/card_anak_widget.dart';

class RegisterAnak extends StatelessWidget {
  const RegisterAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterAnakView();
  }
}

class RegisterAnakView extends StatefulWidget {
  const RegisterAnakView({super.key});

  @override
  State<RegisterAnakView> createState() => RegisterAnakViewState();
}

class RegisterAnakViewState extends State<RegisterAnakView> {
  TextEditingController _searchController = TextEditingController();

  List<AnakItemModel> listAnak = [
    AnakItemModel(
      name: 'Muhammad Kaivan Al Hakim',
      nik: '362155482327263',
      gender: 'Laki Laki',
      month: 11,
    ),
    AnakItemModel(
      name: 'Muhammad Kaivan Al Hakim',
      nik: '362155482327263',
      gender: 'Laki Laki',
      month: 11,
      year: 4,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Anak',
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
          Navigator.pushNamed(context, CREATE_REGISTER_ANAK);
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
                  itemCount: listAnak.length,
                  itemBuilder: (context, index) {
                    AnakItemModel anak = listAnak[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CardAnakWidget(
                        onTap: () {
                          Navigator.pushNamed(context, DETAIL_REGISTER_ANAK);
                        },
                        nama: anak.name,
                        nik: anak.nik,
                        gender: anak.gender,
                        tahun: anak.year != null ? anak.year.toString() : null,
                        bulan: anak.month.toString(),
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
