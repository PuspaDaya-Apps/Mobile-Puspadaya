import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../route/route_name.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/card_anak_widget.dart';
import '../../../../view/widget/search_text_field_widget.dart';
import '../../../registerAnak/bloc/anak_by_posyandu_bloc.dart';
import '../../../registerAnak/model/anak_item_model.dart';

class IndexAnakFaktorResiko extends StatelessWidget {
  const IndexAnakFaktorResiko({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnakByPosyanduBloc(),
      child: const IndexAnakFaktoResikoView(),
    );
  }
}

class IndexAnakFaktoResikoView extends StatefulWidget {
  const IndexAnakFaktoResikoView({super.key});

  @override
  State<IndexAnakFaktoResikoView> createState() =>
      _IndexAnakFaktoResikoViewState();
}

class _IndexAnakFaktoResikoViewState extends State<IndexAnakFaktoResikoView> {
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
        title: 'Pilih Anak',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
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
                                  BULAN_FAKTOR_RESIKO,
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
