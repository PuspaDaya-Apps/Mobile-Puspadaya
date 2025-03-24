import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/kunjungan/view/widget/alert_create_kunjungan.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/kunjungan_items_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../route/route_name.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/screen/no_data_screen.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/index_kunjungan_bloc.dart';

class KunjunganScreen extends StatelessWidget {
  const KunjunganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexKunjunganBloc(),
      child: const KunjunganView(),
    );
  }
}

class KunjunganView extends StatefulWidget {
  const KunjunganView({super.key});

  @override
  State<KunjunganView> createState() => _KunjunganViewState();
}

class _KunjunganViewState extends State<KunjunganView> {
  // bool kunjungan = true;
 
  @override
  void initState() {
    super.initState();
    BlocProvider.of<IndexKunjunganBloc>(context).add(GetDataKunjungan());
  }

  @override
  Widget build(BuildContext context) {
    final indexKunjunganBloc = BlocProvider.of<IndexKunjunganBloc>(context);

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: const PrimaryAppBar(
        title: 'Kunjungan',
        background: backgroundWhite10,
        onBackPressed: null,
      ),
      body: SafeArea(
        child: BlocConsumer<IndexKunjunganBloc, IndexKunjunganState>(
          listener: (context, state) {
            debugPrint(state.toString());
          },
          builder: (context, state) {
            if (state is IndexKunjunganProccessState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: bluePrimaryMain,
                )
              );
            }
            if(state is IndexKunjunganSuccessState) {
              if(state.kunjunganResponseModel.data!.isEmpty) {
                return const NoDataScreen();
              }
              // for(var value in state.kunjunganResponseModel.data!){
              //   if(value.statusKunjungan == "Sedang Berjalan") {
              //     kunjungan = false;
              //   }
              // }

              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: ListView.builder(
                  itemCount: state.kunjunganResponseModel.data!.length,
                  itemBuilder: (context, index) {
                    debugPrint(state.kunjunganResponseModel.data!.length.toString());
                    debugPrint(index.toString());
                    // Ensure correct rendering of custom widgets
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: KunjunganItemWidget(
                       kunjungan: state.kunjunganResponseModel.data![index],
                       refresData: () {
                        if (state.kunjunganResponseModel.data![index].statusKunjungan == "Selesai") {
                          if(state.kunjunganResponseModel.data![index].jenisKunjungan == "Anak Stunting") {
                            Navigator.pushNamed(context, DETAIL_ANAK_STUNTING_KUNJUNGAN,arguments: state.kunjunganResponseModel.data![index].id).then((value) {
                              if(value != null) {
                                indexKunjunganBloc.add(GetDataKunjungan());
                              }
                            });
                          }
                          if(state.kunjunganResponseModel.data![index].jenisKunjungan == "Anak Tidak Hadir") {
                            Navigator.pushNamed(context, DETAIL_ANAK_TIDAK_HADIR_KUNJUNGAN,arguments: state.kunjunganResponseModel.data![index].id).then((value) {
                              if(value != null) {
                                indexKunjunganBloc.add(GetDataKunjungan());
                              }
                            });
                          }
                          if(state.kunjunganResponseModel.data![index].jenisKunjungan == "Ibu Hamil") {
                            Navigator.pushNamed(context, DETAIL_IBU_HAMIL_KUNJUNGAN,arguments: state.kunjunganResponseModel.data![index].id).then((value) {
                              if(value != null) {
                                indexKunjunganBloc.add(GetDataKunjungan());
                              }
                            });
                          }
                        } else {
                          if(state.kunjunganResponseModel.data![index].jenisKunjungan == "Anak Stunting") {
                            Navigator.pushNamed(context, DETAIL_CREATE_ANAK_STUNTING_KUNJUNGAN, arguments: state.kunjunganResponseModel.data![index].id).then((value) {
                              if(value != null) {
                                indexKunjunganBloc.add(GetDataKunjungan());
                                if(value == 1) {
                                  Navigator.pushNamed(context, LIST_ANAK_STUNTING_KUNJUNGAN).then((value) {
                                  if(value != null) {
                                    indexKunjunganBloc.add(GetDataKunjungan());
                                  }
                                });
                                }
                              }
                            });
                          }
                          if(state.kunjunganResponseModel.data![index].jenisKunjungan == "Anak Tidak Hadir") {
                            Navigator.pushNamed(context, DETAIL_CREATE_ANAK_TIDAK_HADIR_KUNJUNGAN, arguments: state.kunjunganResponseModel.data![index].id).then((value) {
                              if(value != null) {
                                indexKunjunganBloc.add(GetDataKunjungan());
                                if(value == 1) {
                                  Navigator.pushNamed(context, LIST_ANAK_TIDAK_HADIR_KUNJUNGAN).then((value) {
                                  if(value != null) {
                                    indexKunjunganBloc.add(GetDataKunjungan());
                                  }
                                });
                                }
                              }
                            });
                          }
                          if(state.kunjunganResponseModel.data![index].jenisKunjungan == "Ibu Hamil") {
                            Navigator.pushNamed(context, DETAIL_CREATE_IBU_HAMIL_KUNJUNGAN, arguments: state.kunjunganResponseModel.data![index].id).then((value) {
                              if(value != null) {
                                indexKunjunganBloc.add(GetDataKunjungan());
                                if(value == 1) {
                                  Navigator.pushNamed(context, LIST_IBU_HAMIL_KUNJUNGAN).then((value) {
                                  if(value != null) {
                                    indexKunjunganBloc.add(GetDataKunjungan());
                                  }
                                });
                                }
                              }
                            });
                          }
                        }
                       },
                      ),
                    );
                  },
                ),
              );
            }
            return const ErrorServerScreen();
          },
        ),
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
          // if(kunjungan) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertCreateKunjungan(
                  indexKunjunganBloc: indexKunjunganBloc,
                );
              },
            ).then((valueCreate) {
              if(valueCreate == 1) {
                Navigator.pushNamed(context, LIST_ANAK_STUNTING_KUNJUNGAN).then((value) {
                  if(value != null) {
                    indexKunjunganBloc.add(GetDataKunjungan());
                  }
                });
              }
              if(valueCreate == 2) {
                Navigator.pushNamed(context, LIST_ANAK_TIDAK_HADIR_KUNJUNGAN).then((value) {
                  if(value != null) {
                    indexKunjunganBloc.add(GetDataKunjungan());
                  }
                });
              }
              if(valueCreate == 3) {
                Navigator.pushNamed(context, LIST_IBU_HAMIL_KUNJUNGAN).then((value) {
                    if(value != null) {
                      indexKunjunganBloc.add(GetDataKunjungan());
                    }
                  });
              }
            });
          // } else {
           
          // }   
          
          
          // Add your navigation or functionality for adding new items
          print("Floating Action Button Pressed");
        },
      ),
    );
  }
}
