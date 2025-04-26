import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/feature/Kehadiran/model/list_data_anak_model.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../view/screen/data_not_found_screen.dart';
import '../../../../view/screen/search_not_found.dart';
import '../../../../view/widget/search_text_field_widget.dart';
import '../bloc/anak_posyandu_bloc.dart';
import '../model/paket_from_search_anak_to_posyandu.dart';

class SearchAnak extends StatelessWidget {
  final String idPosyandu;
  const SearchAnak({super.key, required this.idPosyandu});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnakPosyanduBloc(),
      child: SearchAnakView(
        idPosyandu: idPosyandu,
      ),
    );
  }
}

class SearchAnakView extends StatefulWidget {
  final String idPosyandu;
  const SearchAnakView({super.key, required this.idPosyandu});

  @override
  State<SearchAnakView> createState() => _SearchAnakViewState();
}

class _SearchAnakViewState extends State<SearchAnakView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context
        .read<AnakPosyanduBloc>()
        .add(GetAnakPosyanduEvent(id: widget.idPosyandu));
    // TODO: implement initState
    super.initState();
    _searchController.addListener(() {
      setState(() {}); // Rebuild untuk update pencarian
    });
  }

  @override
  void dispose() {
    _searchController
        .dispose(); // Pastikan controller dibuang setelah tidak digunakan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height * 0.05),
          child: Container(
            // color: Colors.red,
            padding: const EdgeInsets.only(left: 16.0,right: 16,top:0,bottom: 8),
            child: SearchTextFieldWidget(
              hintText: 'Cari Anak',
              controller: _searchController,
            ),
          ),
        ),
        title: Text(
          'Pilih Anak',
          style: AppTextStyles.primaryTextSemibold.copyWith(
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<AnakPosyanduBloc, AnakPosyanduState>(
          builder: (context, state) {
            if (state is AnakPosyanduLoading) {
              return SizedBox(
                child: Center(
                  child: SpinKitThreeBounce(
                    color: bluePrimaryMain,
                    size: 50.0,
                  ),
                ),
              );
            }
            if (state is AnakPosyanduFailed) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is AnakPosyanduSuccess) {
              if (state.data.data.isEmpty) {
                return DataNotFoundScreen();
              }
              final filteredList = state.data.data.where((anak) {
                final query = _searchController.text.toLowerCase();
                return anak.namaAnak.toLowerCase().contains(query);
              }).toList();
              if (filteredList.isEmpty) {
                return SearchNotFound();
              }
              return ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final dataPosyanduItem = filteredList[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 4),
                    child: Card(
                      color: Colors.white,
                      shadowColor: Colors.black.withOpacity(0.1),
                      // Bayangan lebih soft
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: ListTile(
                        onTap: () {
                          // logger.d(dataSelected.nama);
                          PaketFromSearchAnakToPosyandu data =
                              PaketFromSearchAnakToPosyandu(
                            id: dataPosyanduItem.id,
                            namaAnak: dataPosyanduItem.namaAnak,
                            nik: dataPosyanduItem.nik,
                            namaIbu: dataPosyanduItem.kartuKeluarga.ibu.namaIbu,
                          );
                          Navigator.pop(context, data);
                        },
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: bluePrimary50,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataPosyanduItem.namaAnak,
                                    style: AppTextStyles.primaryTextMedium
                                        .copyWith(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    dataPosyanduItem.nik,
                                    style: AppTextStyles.primaryTextMedium
                                        .copyWith(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4), // Jarak antar teks
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Nama Ibu: ",
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: dataPosyanduItem
                                        .kartuKeluarga.ibu.namaIbu,
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: bluePrimary50,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
