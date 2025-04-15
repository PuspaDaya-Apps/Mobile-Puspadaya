import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/feature/kunjunganAnakStunting/listAnakStunting/view/model/KunjunganStuntingItem.dart';
import 'package:puspadaya/app/view/widget/kunjungan_stunting_items.dart';
import 'package:puspadaya/app/view/widget/search_text_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../route/route_name.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/createKunjunganAnakTidakHadirBloc/create_kunjungan_anak_tidak_hadir_bloc.dart';
import '../bloc/listAnakTidakHadirKunjunganBloc/list_anak_tidak_hadir_kunjungan_bloc.dart';

class ListAnakTidakHadirKunjungan extends StatelessWidget {
  const ListAnakTidakHadirKunjungan({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateKunjunganAnakTidakHadirBloc(),
        ),
        BlocProvider(
          create: (context) => ListAnakTidakHadirKunjunganBloc(),
        ),
      ],
      child: ListAnakTidakHadirKunjunganView(),
    );
  }
}

class ListAnakTidakHadirKunjunganView extends StatefulWidget {
  const ListAnakTidakHadirKunjunganView({super.key});

  @override
  State<ListAnakTidakHadirKunjunganView> createState() =>
      _ListAnakTidakHadirKunjunganViewState();
}

class _ListAnakTidakHadirKunjunganViewState
    extends State<ListAnakTidakHadirKunjunganView> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;

  final List<Kunjunganstuntingitem> originalList = [
    Kunjunganstuntingitem(
      id: '1',
      name: 'Thomas Aurealia',
      nik: '3621554011732625',
      parent: 'Yusnizar Kasta',
    ),
    Kunjunganstuntingitem(
      id: '2',
      name: 'Sakti Rudiatin',
      nik: '3621554011732636',
      parent: 'Dian Umaeroh',
    ),
    Kunjunganstuntingitem(
      id: '3',
      name: 'Permana Tilasnuari',
      nik: '3621554011732647',
      parent: 'Nurmi Machmud',
    ),
    Kunjunganstuntingitem(
      id: '4',
      name: 'Silviana Kusuma',
      nik: '3621554011732658',
      parent: 'Jesyca Khairani',
    ),
  ];

  List<Kunjunganstuntingitem> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = List.from(originalList);
    _searchController.addListener(_filterList);

    BlocProvider.of<ListAnakTidakHadirKunjunganBloc>(context)
        .add(GetDataAnakTidakHadir());
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
    final createKunjunganBloc =
        BlocProvider.of<CreateKunjunganAnakTidakHadirBloc>(context);

    return BlocConsumer<CreateKunjunganAnakTidakHadirBloc,
        CreateKunjunganAnakTidakHadirState>(
      listener: (context, state) {
        debugPrint(state.toString());
        if (state is CreateKunjunganAnakTidakHadirSuccessState) {
          Navigator.pop(context, state.idKunjungan);
          // Navigator.pushNamed(context, DETAIL_CREATE_ANAK_TIDAK_HADIR_KUNJUNGAN,
          //     arguments: state.idKunjungan);
        }
        if (state is CreateKunjunganAnakTidakHadirFailedState) {
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
                        'Pilih Anak Tidak Hadir',
                        style: AppTextStyles.primaryTextSemibold.copyWith(
                          fontSize: 16,
                        ),
                      ),
                actions: _buildAppBarActions(),
              ),
              body: SafeArea(
                child: BlocConsumer<ListAnakTidakHadirKunjunganBloc,
                    ListAnakTidakHadirKunjunganState>(
                  listener: (context, state) {
                    debugPrint(state.toString());
                  },
                  builder: (context, state) {
                    if (state is ListAnakTidakHadirKunjunganProccessState) {
                      return SizedBox(
                        child: Center(
                          child: SpinKitThreeBounce(
                            color: bluePrimaryMain,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    if (state is ListAnakTidakHadirKunjunganSuccessState) {
                      if (state.listDataAnakTidakHadir.data!.isEmpty) {
                        return const NoDataScreen();
                      }
                      return ListView.separated(
                        itemCount: state.listDataAnakTidakHadir.data!.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: shadowSm,
                            ),
                            child: KunjunganStuntingItems(
                              onTap: () {
                                createKunjunganBloc.add(CreateKunjunganEvent(
                                    state.listDataAnakTidakHadir.data![index]
                                        .id));
                              },
                              name: state
                                  .listDataAnakTidakHadir.data![index].namaAnak,
                              nik:
                                  state.listDataAnakTidakHadir.data![index].nik,
                              parent: state.listDataAnakTidakHadir.data![index]
                                  .ibu?.namaIbu,
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
            state is CreateKunjunganAnakTidakHadirProccessState
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
