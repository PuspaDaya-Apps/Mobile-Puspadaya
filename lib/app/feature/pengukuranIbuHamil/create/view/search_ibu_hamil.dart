import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/feature/pengukuranIbuHamil/create/model/ibu_hamil_search.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../model/paketToScreen/paket_to_create_pengukuran_ibu_hamil_model.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/screen/search_not_found.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../Bloc/getListIbuHamilBloc/get_list_ibu_hamil_bloc.dart';

class SearchIbuHamil extends StatelessWidget {
  const SearchIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetListIbuHamilBloc(),
      child: SearchIbuHamilView(),
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
    BlocProvider.of<GetListIbuHamilBloc>(context).add(GetListIbuHamil());
    _searchController.addListener(() {
      setState(() {}); // Rebuild untuk update pencarian
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getListIbuHamilBloc = BlocProvider.of<GetListIbuHamilBloc>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          child: TextField(
            controller: _searchController,
            style: Theme.of(context).textTheme.bodySmall,
            keyboardType: TextInputType.text,
            obscureText: false,
            decoration: InputDecoration(
              prefixIcon: Icon(
                FluentIcons.search_24_regular,
              ),
              hintText: 'Pilih Ibu Hamil',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey),
              filled: true,
              fillColor: backgroundWhite,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: bluePrimaryMain),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: Colors.red),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: BlocConsumer<GetListIbuHamilBloc, GetListIbuHamilState>(
            listener: (context, state) {
              debugPrint(state.toString());
              if (state is GetListIbuHamilFailedState) {
                showTopSnackBar(
                    Overlay.of(context),
                    animationDuration: const Duration(milliseconds: 600),
                    displayDuration: const Duration(milliseconds: 2200),
                    reverseAnimationDuration: const Duration(milliseconds: 300),
                    TopSnackbarWidget().error(state.error));
              }
            },
            builder: (context, state) {
              if (state is GetListIbuHamilProccessState) {
                return SizedBox(
                  child: Center(
                    child: SpinKitThreeBounce(
                      color: bluePrimaryMain,
                      size: 50.0,
                    ),
                  ),
                );
              }
              if (state is GetListIbuHamilSuccessState) {
                final filteredList = state.getListIbuHamilResponseModel.data!.where((ibu) {
                  final query = _searchController.text.toLowerCase();
                  return ibu.namaIbu
                      .toLowerCase()
                      .contains(query);
                }).toList();
                if (filteredList.isEmpty) {
                  return SearchNotFound();
                }
                if (state.getListIbuHamilResponseModel.data!.isEmpty) {
                  return const NoDataScreen();
                }
                return ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(
                                context,
                                PaketToCreatePengukuranIbuHamilModel(
                                    id: filteredList[index].id,
                                    namaIbu: filteredList[index].namaIbu,
                                    usiaIbuHamil: filteredList[index]
                                        .usiaIbu,
                                    usiaKandungan: filteredList[index]
                                        .usiaKehamilan));
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: bluePrimary50,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  filteredList[index].namaIbu,
                                  style:
                                      AppTextStyles.primaryTextMedium.copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "NIK : ",
                                      style: AppTextStyles.primaryTextNormal
                                          .copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    TextSpan(
                                      text: filteredList[index].nik,
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
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: bluePrimary50,
                          ),
                        ),
                        Divider(
                          color: textPrimary10,
                          thickness: 1,
                          height: 1,
                        ),
                      ],
                    );
                  },
                );
              }
              return const ErrorServerScreen();
            },
          ),
        ),
      ),
    );
  }
}
