import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/pengukuranAnak/create/Bloc/getListAnak/get_list_anak_bloc.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../model/paketToScreen/paket_to_create_pengukuran_anak_model.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';

class SearchAnak extends StatelessWidget {
  const SearchAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetListAnakBloc(),
      child: const SearchAnakView(),
    );
  }
}

class SearchAnakView extends StatefulWidget {
  const SearchAnakView({super.key});

  @override
  State<SearchAnakView> createState() => _SearchAnakViewState();
}

class _SearchAnakViewState extends State<SearchAnakView> {
  TextEditingController searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetListAnakBloc>(context).add(
      GetListAnak()
    );
  }

  @override
  Widget build(BuildContext context) {
    final getListAnakBloc = BlocProvider.of<GetListAnakBloc>(context);

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
            controller: searchController,
            style: Theme.of(context).textTheme.bodySmall,
            keyboardType: TextInputType.text,
            obscureText: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                FluentIcons.search_24_regular,
              ),
              hintText: 'Pilih Anak',
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
          child: BlocConsumer<GetListAnakBloc, GetListAnakState>(
            listener: (context, state) {
              debugPrint(state.toString());
              if (state is GetListAnakFailedState) {
                debugPrint(state.error);
                showTopSnackBar(
                  Overlay.of(context),
                  animationDuration: const Duration(
                    milliseconds: 600
                  ),
                  displayDuration: const Duration(
                    milliseconds: 2200
                  ),
                  reverseAnimationDuration: const Duration(
                    milliseconds: 300
                  ),
                  TopSnackbarWidget().error(state.error)
                );
              }
            },
            builder: (context, state) {
              if(state is GetListAnakProccessState) {
                return const Center(
                  child:CircularProgressIndicator(
                    color: bluePrimaryMain,
                  ) 
                );
              }
              if(state is GetListAnakSuccessState) {
                if (state.getListAnakResponseModel.data!.isEmpty) {
                  return const NoDataScreen();
                }
                return ListView.builder(
                  itemCount: state.getListAnakResponseModel.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(
                              context,
                              PaketToCreatePengukuranAnakModel(
                                id: state.getListAnakResponseModel.data![index].id,
                                namaAnak: state.getListAnakResponseModel.data![index].namaAnak,
                                nik: state.getListAnakResponseModel.data![index].nik,
                                usia: state.getListAnakResponseModel.data![index].usia
                              )
                            );
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            spacing: 4,
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
                                child: Text(
                                  state.getListAnakResponseModel.data![index].namaAnak,
                                  style: AppTextStyles.primaryTextMedium.copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            spacing: 10,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 60,
                                child: RichText(
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
                                        text: state.getListAnakResponseModel.data![index].nik,
                                        style: AppTextStyles.primaryTextNormal
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 15, // Set a fixed height for the divider
                                width: 2,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Ibu : ",
                                        style: AppTextStyles.primaryTextNormal
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      TextSpan(
                                        text: state.getListAnakResponseModel.data![index].namaIbu,
                                        style: AppTextStyles.primaryTextNormal
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: bluePrimary50,
                          ),
                        ),
                        const Divider(
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
