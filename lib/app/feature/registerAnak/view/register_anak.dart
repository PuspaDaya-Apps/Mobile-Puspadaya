import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/registerAnak/bloc/anak_by_posyandu_bloc.dart';
import 'package:puspadaya/app/feature/registerAnak/model/anak_item_model.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/search_text_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../utils/logger/logger.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/widget/card_anak_widget.dart';

class RegisterAnak extends StatelessWidget {
  const RegisterAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnakByPosyanduBloc(),
      child: const RegisterAnakView(),
    );
  }
}

class RegisterAnakView extends StatefulWidget {
  const RegisterAnakView({super.key});

  @override
  State<RegisterAnakView> createState() => RegisterAnakViewState();
}

class RegisterAnakViewState extends State<RegisterAnakView> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Trigger fetch event when the view is initialized
    logger.d('trigger fetch');
    context.read<AnakByPosyanduBloc>().add(FetchAnak());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Anak',
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
          Navigator.pushNamed(context, CREATE_REGISTER_ANAK).then((value) {
            if(value != null) {
              context.read<AnakByPosyanduBloc>().add(FetchAnak());
            }
          });
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
                      hintText: 'Cari Data Anak',
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
                child: BlocBuilder<AnakByPosyanduBloc, AnakByPosyanduState>(
                  builder: (context, state) {
                    debugPrint(state.toString());
                    if (state is AnakByPosyanduLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: bluePrimaryMain,
                        ),
                      );
                    } else if (state is AnakByPosyanduSuccess) {
                      debugPrint(state.anakItems.length.toString());
                      return ListView.builder(
                        itemCount: state.anakItems.length,
                        itemBuilder: (context, index) {
                          AnakItemModel anak = state.anakItems[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CardAnakWidget(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  DETAIL_REGISTER_ANAK,
                                  arguments: anak.id,
                                );
                              },
                              nama: anak.nama,
                              nik: anak.nik,
                              gender: anak.jenisKelamin,
                              tahun: anak.year,
                              bulan: anak.bulan,
                            ),
                          );
                        },
                      );
                    } 
                      return const ErrorServerScreen();
                    
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
