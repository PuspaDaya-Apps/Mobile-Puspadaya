import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/view/screen/data_not_found_screen.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/screen/search_not_found.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/card_tambah_ibu_hamil_widget.dart';
import '../../../view/widget/search_text_field_widget.dart';
import '../bloc/create_register_ibu_hamil_bloc.dart';
import 'model/ibu_hamil_item_model.dart';

class SearchIbuHamil extends StatelessWidget {
  const SearchIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateRegisterIbuHamilBloc(),
      child: const SearchIbuHamilView(),
    );
  }
}

class SearchIbuHamilView extends StatefulWidget {
  const SearchIbuHamilView({super.key});

  @override
  State<SearchIbuHamilView> createState() => _SearchIbuHamilViewState();
}

class _SearchIbuHamilViewState extends State<SearchIbuHamilView> {
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    context.read<CreateRegisterIbuHamilBloc>().add(FetchSearchIbuHamil());
    super.initState();
    _searchController.addListener(() {
      setState(() {}); // Rebuild untuk update pencarian
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Pilih Ibu Hamil',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SearchTextFieldWidget(
                      controller: _searchController,
                      hintText: 'Cari Data Ibu Hamil',
                    ),
                  ),
                  const SizedBox(width: 10), // Use SizedBox for spacing
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      size: 30,
                      FluentIcons.filter_24_filled,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: BlocBuilder<CreateRegisterIbuHamilBloc,
                    CreateRegisterIbuHamilState>(
                  builder: (context, state) {
                    if (state is CreateRegisterIbuHamilLoading) {
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
                    if (state is CreateRegisterIbuHamilFailed) {
                      return Center(
                        child: Text(
                            'Gagal Mendapatkan Ibu Hamil ${state.message}'),
                      );
                    }
                    if (state is CreateRegisterIbuHamilSuccess) {
                      if (state.data.data.isEmpty) {
                        return DataNotFoundScreen();
                      }
                      final filteredList = state.data.data.where((ibu) {
                        final query = _searchController.text.toLowerCase();
                        return ibu.ibu.namaIbu.toLowerCase().contains(query);
                      }).toList();
                      if (filteredList.isEmpty) {
                        return SearchNotFound();
                      }

                      return ListView.builder(
                        itemCount: filteredList.length, // Use listIbuHamil
                        itemBuilder: (context, index) {
                          final ibuHamil = filteredList[index];
                          // GetAllOrangTuaResponse ibuHamil = state.data.data[index] as GetAllOrangTuaResponse; // Access the list correctly
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CardTambahIbuHamil(
                              nama: ibuHamil.ibu.namaIbu,
                              namaSuami: ibuHamil.ayah.namaAyah,
                              nik: ibuHamil.ibu.nik,
                              onTap: () {
                                IbuHamilItemModel paketToCreatRegisterIbuHamil =
                                    IbuHamilItemModel(
                                  ibuId: ibuHamil.ibu.id,
                                  usia: ibuHamil.ibu.usiaIbu.toString(),
                                  nama: ibuHamil.ibu.namaIbu,
                                  namaSuami: ibuHamil.ayah.namaAyah,
                                  nik: ibuHamil.ibu.nik,
                                );
                                Navigator.pop(
                                    context, paketToCreatRegisterIbuHamil);
                              },
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
