import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/createKunjunganStunting/view/model/KunjunganStuntingItem.dart';
import 'package:puspadaya/app/feature/createKunjunganStunting/view/timer_kunjungan_stunting.dart';
import 'package:puspadaya/app/view/widget/kunjungan_stunting_items.dart';
import 'package:puspadaya/app/view/widget/search_text_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class CreateKunjunganStunting extends StatelessWidget {
  const CreateKunjunganStunting({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateKunjunganStuntingView();
  }
}

class CreateKunjunganStuntingView extends StatefulWidget {
  const CreateKunjunganStuntingView({super.key});

  @override
  State<CreateKunjunganStuntingView> createState() =>
      _CreateKunjunganStuntingViewState();
}

class _CreateKunjunganStuntingViewState
    extends State<CreateKunjunganStuntingView> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;

  final List<Kunjunganstuntingitem> originalList = [
    Kunjunganstuntingitem(
      id: '1',
      name: 'Aisyah Zahra Putri',
      nik: '3621554011732625',
      parent: 'Sri Wahyuni',
    ),
    Kunjunganstuntingitem(
      id: '2',
      name: 'Budi Santoso',
      nik: '3621554011732636',
      parent: 'Tifany Novianti',
    ),
    Kunjunganstuntingitem(
      id: '3',
      name: 'Citra Dewi',
      nik: '3621554011732647',
      parent: 'Mira Dewi',
    ),
  ];

  List<Kunjunganstuntingitem> filteredList = [];

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
            item.parent.toLowerCase().contains(query);
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
                'Piih Anak Stunting',
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
              child: KunjunganStuntingItems(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TimerKunjunganStunting();
                      },
                    ),
                  );
                  // Handle item click
                },
                name: item.name,
                nik: item.nik,
                parent: item.parent,
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
