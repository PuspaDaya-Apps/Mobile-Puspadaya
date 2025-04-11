import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/view/widget/kunjungan_ibu_hamil_widget.dart';
import 'package:puspadaya/app/view/widget/search_text_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../route/route_name.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/createKunjunganIbuHamilBloc/create_kunjungan_ibu_hamil_bloc.dart';
import '../bloc/listIbuHamilKunjunganBloc/list_ibu_hamil_kunjungan_bloc.dart';
import 'model/KunjuganIbuHamilItem.dart';
// import '../../detailCreateKunjungan/view/timer_kunjungan_ibu_hamil.dart';

class ListIbuHamilKunjungan extends StatelessWidget {
  const ListIbuHamilKunjungan({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateKunjunganIbuHamilBloc(),
        ),
        BlocProvider(
          create: (context) => ListIbuHamilKunjunganBloc(),
        ),
      ],
      child: const ListIbuHamilKunjunganView(),
    );
  }
}

class ListIbuHamilKunjunganView extends StatefulWidget {
  const ListIbuHamilKunjunganView({super.key});

  @override
  State<ListIbuHamilKunjunganView> createState() =>
      _ListIbuHamilKunjunganViewState();
}

class _ListIbuHamilKunjunganViewState extends State<ListIbuHamilKunjunganView> {
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  // final List<KunjuganIbuHamilItem> originalList = [
  //   KunjuganIbuHamilItem(
  //     id: '1',
  //     name: 'Tessa Ivangkia',
  //     nik: '3621554011732625',
  //     husband: 'Mustafid Sayoga',
  //   ),
  //   KunjuganIbuHamilItem(
  //     id: '2',
  //     name: 'Soraya Aprilicia',
  //     nik: '3621554011732636',
  //     husband: 'Muhamad Aristy',
  //   ),
  //   KunjuganIbuHamilItem(
  //     id: '3',
  //     name: 'Fernanda Oktaviaman',
  //     nik: '3621554011732647',
  //     husband: 'Cakra Yusdwindra',
  //   ),
  //   KunjuganIbuHamilItem(
  //     id: '4',
  //     name: 'Bella Riyadie',
  //     nik: '3621554011732658',
  //     husband: 'Bimo Oktaviani',
  //   ),
  // ];

  List<KunjuganIbuHamilItem> filteredList = [];

  @override
  void initState() {
    super.initState();
    // filteredList = List.from(originalList);
    _searchController.addListener(_filterList);

    BlocProvider.of<ListIbuHamilKunjunganBloc>(context).add(GetDataIbuHamil());
  }

  void _filterList() {
    // setState(() {
    //   final query = _searchController.text.toLowerCase();
    //   filteredList = originalList.where((item) {
    //     return item.name.toLowerCase().contains(query) ||
    //         item.nik.contains(query) ||
    //         item.nik.toLowerCase().contains(query);
    //   }).toList();
    // });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createKunjunganBloc =
        BlocProvider.of<CreateKunjunganIbuHamilBloc>(context);

    return BlocConsumer<CreateKunjunganIbuHamilBloc,
        CreateKunjunganIbuHamilState>(
      listener: (context, state) {
        debugPrint(state.toString());
        if (state is CreateKunjunganIbuHamilSuccessState) {
          Navigator.pop(context, 1);
          Navigator.pushNamed(context, DETAIL_CREATE_IBU_HAMIL_KUNJUNGAN,
              arguments: state.idKunjungan);
        }
        if (state is CreateKunjunganIbuHamilFailedState) {
          showTopSnackBar(
              Overlay.of(context),
              animationDuration: const Duration(milliseconds: 600),
              displayDuration: const Duration(milliseconds: 2200),
              reverseAnimationDuration: const Duration(milliseconds: 300),
              TopSnackbarWidget().error(state.error));
        }
      },
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Scaffold(
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
                child: BlocConsumer<ListIbuHamilKunjunganBloc,
                    ListIbuHamilKunjunganState>(
                  listener: (context, state) {
                    debugPrint(state.toString());
                  },
                  builder: (context, stateList) {
                    if (stateList is ListIbuHamilKunjunganProccessState) {
                      return SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                        child: Center(
                          child: SpinKitThreeBounce(
                            color: bluePrimaryMain,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    if (stateList is ListIbuHamilKunjunganSuccessState) {
                      if (stateList.listDataIbuHamil.data!.isEmpty) {
                        return const NoDataScreen();
                      }
                      return ListView.separated(
                        itemCount: stateList.listDataIbuHamil.data!.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: shadowSm,
                            ),
                            child: KunjunganIbuHamilItem(
                              onTap: () {
                                createKunjunganBloc.add(CreateKunjunganEvent(
                                    stateList
                                        .listDataIbuHamil.data![index].id));
                              },
                              name: stateList.listDataIbuHamil.data![index]
                                  .ibuAnak.namaIbu,
                              nik: stateList
                                  .listDataIbuHamil.data![index].ibuAnak.nik,
                              husband: stateList.listDataIbuHamil.data![index]
                                  .ibuAnak.ayah.namaAyah,
                            ),
                          );
                        },
                      );
                    }
                    return const ErrorServerScreen();
                  },
                ),
              ),
            ),
            state is CreateKunjunganIbuHamilProccessState
                ? SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Center(
                  child: SpinKitThreeBounce(
                    color: bluePrimaryMain,
                    size: 50.0,
                  ),
                ),
              )
                : const SizedBox(),
          ],
        );
      },
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
              // filteredList = List.from(originalList); // Reset list
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
