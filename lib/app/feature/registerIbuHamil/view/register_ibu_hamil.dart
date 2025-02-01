import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/card_ibuhamil_widget.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/search_text_field_widget.dart';
import 'model/ibu_hamil_item_model.dart';

class RegisterIbuHamil extends StatelessWidget {
  const RegisterIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterIbuHamilView();
  }
}

class RegisterIbuHamilView extends StatefulWidget {
  const RegisterIbuHamilView({super.key});

  @override
  State<RegisterIbuHamilView> createState() => _RegisterIbuHamilViewState();
}

class _RegisterIbuHamilViewState extends State<RegisterIbuHamilView> {
  TextEditingController _searchController = TextEditingController();

  List<IbuHamilItemModel> listOrangTua = [
    IbuHamilItemModel(
      name: 'Muhammad Kaivan Al Hakim',
      nik: '362155482327263',
      month: 2,
      week: 7,
    ),
    IbuHamilItemModel(
      name: 'Mentari Kumala Sari',
      nik: '362155482327263',
      month: 2,
      week: 7,
    ),
    IbuHamilItemModel(
      name: 'Dewi antasari',
      nik: '362155482327263',
      month: 2,
      week: 7,
    ),
    IbuHamilItemModel(
      name: 'Muhammad Kaivan Al Hakim',
      nik: '362155482327263',
      month: 2,
      week: 7,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Ibu Hamil',
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
          Navigator.pushNamed(context, CREATE_REGISTER_IBU_HAMIL);
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
                      hintText: 'Cari Data Ibu Hamil',
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
                  itemCount: listOrangTua.length,
                  itemBuilder: (context, index) {
                    IbuHamilItemModel orangTua = listOrangTua[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CardIbuHamilWidget(
                        onTap: () {
                          Navigator.pushNamed(
                              context, DETAIL_REGISTER_IBU_HAMIL);
                        },
                        nama: orangTua.name,
                        nik: orangTua.nik,
                        bulan: orangTua.month.toString(),
                        minggu: orangTua.week.toString(),
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
