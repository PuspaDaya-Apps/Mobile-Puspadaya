import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/kunjungan_ibu_hamil_widget.dart';
import 'package:puspadaya/app/view/widget/search_text_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import 'model/KunjuganIbuHamilItem.dart';
import '../../detailCreateKunjungan/view/timer_kunjungan_ibu_hamil.dart';

class ListIbuHamilKunjungan extends StatelessWidget {
  const ListIbuHamilKunjungan({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListIbuHamilKunjunganView();
  }
}

class ListIbuHamilKunjunganView extends StatefulWidget {
  const ListIbuHamilKunjunganView({super.key});

  @override
  State<ListIbuHamilKunjunganView> createState() =>
      _ListIbuHamilKunjunganViewState();
}

class _ListIbuHamilKunjunganViewState
    extends State<ListIbuHamilKunjunganView> {
  bool isSearching = false;
  TextEditingController _searchController = TextEditingController();

  final List<KunjuganIbuHamilItem> originalList = [
    KunjuganIbuHamilItem(
      id: '1',
      name: 'Tessa Ivangkia',
      nik: '3621554011732625',
      husband: 'Mustafid Sayoga',
    ),
    KunjuganIbuHamilItem(
      id: '2',
      name: 'Soraya Aprilicia',
      nik: '3621554011732636',
      husband: 'Muhamad Aristy',
    ),
    KunjuganIbuHamilItem(
      id: '3',
      name: 'Fernanda Oktaviaman',
      nik: '3621554011732647',
      husband: 'Cakra Yusdwindra',
    ),
    KunjuganIbuHamilItem(
      id: '4',
      name: 'Bella Riyadie',
      nik: '3621554011732658',
      husband: 'Bimo Oktaviani',
    ),
  ];

  List<KunjuganIbuHamilItem> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = List.from(originalList);
    _searchController.addListener(_filterList);
  }

  void _filterList() {
    setState(() {
      final query = _searchController.text.toLowerCase();
      filteredList = originalList.where((item) {
        return item.name.toLowerCase().contains(query) ||
            item.nik.contains(query) ||
            item.nik.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundWhite10,
        title: isSearching
            ? SearchTextFieldWidget(
                controller: _searchController,
                hintText: 'Cari Data',
              )
            : Text(
                'Piih Ibu Hamil',
                style: AppTextStyles.primaryTextSemibold.copyWith(
                  fontSize: 16,
                ),
              ),
        actions: _buildAppBarActions(),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: filteredList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = filteredList[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: shadowSm,
              ),
              child: KunjunganIbuHamilItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TimerKunjunganIbuHamil();
                      },
                    ),
                  );
                },
                name: item.name,
                nik: item.nik,
                husband: item.husband,
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      GestureDetector(
        onTap: () {
          setState(() {
            isSearching = !isSearching;
            if (!isSearching) {
              _searchController.clear();
              filteredList = List.from(originalList); // Reset list
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Icon(
            isSearching ? Icons.close : Icons.search,
          ),
        ),
      ),
    ];
  }
}
