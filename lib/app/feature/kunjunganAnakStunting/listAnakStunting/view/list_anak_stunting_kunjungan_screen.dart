import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/kunjunganAnakStunting/listAnakStunting/view/model/KunjunganStuntingItem.dart';
import 'package:puspadaya/app/view/widget/kunjungan_stunting_items.dart';
import 'package:puspadaya/app/view/widget/search_text_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/createKunjunganAnakStuntingBloc/create_kunjungan_anak_stunting_bloc.dart';
import '../bloc/listAnakStuntingKunjunganBloc/list_anak_stunting_kunjungan_bloc.dart';

class ListAnakStuntingKunjungan extends StatelessWidget {
  const ListAnakStuntingKunjungan({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateKunjunganAnakStuntingBloc(),
        ),
        BlocProvider(
          create: (context) => ListAnakStuntingKunjunganBloc(),
        ),
      ],
      child: const ListAnakStuntingKunjunganView(),
    );
  }
}

class ListAnakStuntingKunjunganView extends StatefulWidget {
  const ListAnakStuntingKunjunganView({super.key});

  @override
  State<ListAnakStuntingKunjunganView> createState() =>
      _ListAnakStuntingKunjunganViewState();
}

class _ListAnakStuntingKunjunganViewState
    extends State<ListAnakStuntingKunjunganView> {
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

    BlocProvider.of<ListAnakStuntingKunjunganBloc>(context)
        .add(GetDataAnakStunting());
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
    final createKunjunganBloc = BlocProvider.of<CreateKunjunganAnakStuntingBloc>(context);

    return BlocConsumer<CreateKunjunganAnakStuntingBloc, CreateKunjunganAnakStuntingState>(
      listener: (context, state) {
        debugPrint(state.toString());
        if(state is CreateKunjunganAnakStuntingSuccessState) {
          Navigator.pop(context,1);
          Navigator.pushNamed(context, DETAIL_CREATE_ANAK_STUNTING_KUNJUNGAN, arguments: state.idKunjungan);
        }
        if(state is CreateKunjunganAnakStuntingFailedState) {
           showTopSnackBar(
            Overlay.of(context),
            animationDuration: const Duration(milliseconds: 600),
            displayDuration: const Duration(milliseconds: 2200),
            reverseAnimationDuration:const Duration(milliseconds: 300),
            TopSnackbarWidget().error(state.error)
          );
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
                        'Piih Anak Stunting',
                        style: AppTextStyles.primaryTextSemibold.copyWith(
                          fontSize: 16,
                        ),
                      ),
                actions: _buildAppBarActions(),
              ),
              body: SafeArea(
                child: BlocConsumer<ListAnakStuntingKunjunganBloc,
                    ListAnakStuntingKunjunganState>(
                  listener: (context, state) {
                    debugPrint(state.toString());
                  },
                  builder: (context, state) {
                    if (state is ListAnakStuntingKunjunganProccessState) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: bluePrimaryMain,
                      ));
                    }
                    if (state is ListAnakStuntingKunjunganSuccessState) {
                      if(state.listDataAnakStunting.data!.isEmpty){
                        return const NoDataScreen();
                      }
                      return ListView.separated(
                        itemCount: state.listDataAnakStunting.data!.length,
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
                                    state.listDataAnakStunting.data![index].id));
                              },
                              name:
                                  state.listDataAnakStunting.data![index].namaAnak,
                              nik: state.listDataAnakStunting.data![index].nik,
                              parent: state
                                  .listDataAnakStunting.data![index].ibu?.namaIbu,
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
            state is CreateKunjunganAnakStuntingProccessState
            ? Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).height,
              color: Colors.white.withOpacity(0.2),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: bluePrimaryMain,
              ),
            )
            : const  SizedBox(),
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
