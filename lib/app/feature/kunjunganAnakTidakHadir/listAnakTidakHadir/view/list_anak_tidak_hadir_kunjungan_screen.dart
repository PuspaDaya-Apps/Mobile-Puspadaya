import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:puspadaya/app/feature/kunjunganAnakStunting/listAnakStunting/view/model/KunjunganStuntingItem.dart';
import 'package:puspadaya/app/view/widget/kunjungan_stunting_items.dart';
import 'package:puspadaya/app/view/widget/search_text_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../view/screen/search_not_found.dart';
import '../../../../../route/route_name.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/widget/primary_button_widget.dart';
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
  State<ListAnakTidakHadirKunjunganView> createState() => _ListAnakTidakHadirKunjunganViewState();
}

class _ListAnakTidakHadirKunjunganViewState extends State<ListAnakTidakHadirKunjunganView> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;

  //Maps
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  LatLng? titikAlamat;
  bool loadingMaps = true;
  bool loadingMapsPopUp = false;

  @override
  void initState() {
    initLocation();
    _searchController.addListener(() {
      setState(() {});
    });

    BlocProvider.of<ListAnakTidakHadirKunjunganBloc>(context).add(GetDataAnakTidakHadir());
    super.initState();
  }

  initLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
      if(!_serviceEnabled){
        Navigator.pop(context);
      }
    }

    _permissionGranted = await location.hasPermission();
    logger.d(_permissionGranted);

    switch(_permissionGranted) {
      case PermissionStatus.granted:
        break;

      case PermissionStatus.grantedLimited:
        break;
      
      case null:
        _permissionGranted = await location.requestPermission();
        if(_permissionGranted == PermissionStatus.granted || _permissionGranted == PermissionStatus.grantedLimited) {
          break;
        } else {
          showTopSnackBar(
            Overlay.of(context),
            animationDuration: const Duration(milliseconds: 600),
            displayDuration: const Duration(milliseconds: 2200),
            reverseAnimationDuration: const Duration(milliseconds: 300),
            TopSnackbarWidget().warning('akses lokasi ditolak'));
          Navigator.pop(context);
          break;
        }
      
      case PermissionStatus.denied:
        _permissionGranted = await location.requestPermission();
        if(_permissionGranted == PermissionStatus.granted || _permissionGranted == PermissionStatus.grantedLimited) {
          break;
        } else {
          showTopSnackBar(
            Overlay.of(context),
            animationDuration: const Duration(milliseconds: 600),
            displayDuration: const Duration(milliseconds: 2200),
            reverseAnimationDuration: const Duration(milliseconds: 300),
            TopSnackbarWidget().warning('akses lokasi ditolak'));
          Navigator.pop(context);
          break;
        }

      case PermissionStatus.deniedForever:
        showTopSnackBar(
          Overlay.of(context),
          animationDuration: const Duration(milliseconds: 600),
          displayDuration: const Duration(milliseconds: 2200),
          reverseAnimationDuration: const Duration(milliseconds: 300),
          TopSnackbarWidget().warning('akses lokasi ditolak selamanya'));
        Navigator.pop(context);
        break;

      default:
        if(_permissionGranted != PermissionStatus.granted){
          showTopSnackBar(
            Overlay.of(context),
            animationDuration: const Duration(milliseconds: 600),
            displayDuration: const Duration(milliseconds: 2200),
            reverseAnimationDuration: const Duration(milliseconds: 300),
            TopSnackbarWidget().error('akses lokasi tidak dapat diakses'));
          Navigator.pop(context);
        }
        break;
    }
    
    
    _locationData = await location.getLocation().then((value) {
      setState(() {
        loadingMaps = false;
        titikAlamat = LatLng(value.latitude!, value.longitude!);
      });
      return value;
    });
  }

  Future<bool> validatioLocation() async {
    titikAlamat = null;
    _locationData = null;

    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
      if(!_serviceEnabled){
        showTopSnackBar(
          Overlay.of(context),
          animationDuration: const Duration(milliseconds: 600),
          displayDuration: const Duration(milliseconds: 2200),
          reverseAnimationDuration: const Duration(milliseconds: 300),
          TopSnackbarWidget().warning('Hidupkan GPS anda terlebih dahulu')
        );
        
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    logger.d(_permissionGranted);

    switch(_permissionGranted) {
      case PermissionStatus.granted:
        break;

      case PermissionStatus.grantedLimited:
        break;
      
      case null:
        _permissionGranted = await location.requestPermission();
        if(_permissionGranted == PermissionStatus.granted || _permissionGranted == PermissionStatus.grantedLimited) {
          break;
        } else {
          showTopSnackBar(
            Overlay.of(context),
            animationDuration: const Duration(milliseconds: 600),
            displayDuration: const Duration(milliseconds: 2200),
            reverseAnimationDuration: const Duration(milliseconds: 300),
            TopSnackbarWidget().warning('akses lokasi ditolak'));
          Navigator.pop(context);
          Navigator.pop(context);
          break;
        }
      
      case PermissionStatus.denied:
        _permissionGranted = await location.requestPermission();
        if(_permissionGranted == PermissionStatus.granted || _permissionGranted == PermissionStatus.grantedLimited) {
          break;
        } else {
          showTopSnackBar(
            Overlay.of(context),
            animationDuration: const Duration(milliseconds: 600),
            displayDuration: const Duration(milliseconds: 2200),
            reverseAnimationDuration: const Duration(milliseconds: 300),
            TopSnackbarWidget().warning('akses lokasi ditolak'));
          Navigator.pop(context);
          Navigator.pop(context);
          break;
        }

      case PermissionStatus.deniedForever:
        showTopSnackBar(
          Overlay.of(context),
          animationDuration: const Duration(milliseconds: 600),
          displayDuration: const Duration(milliseconds: 2200),
          reverseAnimationDuration: const Duration(milliseconds: 300),
          TopSnackbarWidget().warning('akses lokasi ditolak selamanya'));
        Navigator.pop(context);
        Navigator.pop(context);
        break;

      default:
        if(_permissionGranted != PermissionStatus.granted){
          showTopSnackBar(
            Overlay.of(context),
            animationDuration: const Duration(milliseconds: 600),
            displayDuration: const Duration(milliseconds: 2200),
            reverseAnimationDuration: const Duration(milliseconds: 300),
            TopSnackbarWidget().error('akses lokasi tidak dapat diakses'));
          Navigator.pop(context);
          Navigator.pop(context);
        }
        break;
    }
    
    _locationData = await location.getLocation().then((value) {
      titikAlamat = LatLng(value.latitude!, value.longitude!);
      return value;
    });

    if(titikAlamat != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createKunjunganBloc = BlocProvider.of<CreateKunjunganAnakTidakHadirBloc>(context);
    logger.d('Status: $loadingMaps');

    return BlocConsumer<CreateKunjunganAnakTidakHadirBloc, CreateKunjunganAnakTidakHadirState>(
      listener: (context, state) {
        debugPrint(state.toString());
        if (state is CreateKunjunganAnakTidakHadirSuccessState) {
          Navigator.pop(context, state.idKunjungan);
        }
        if (state is CreateKunjunganAnakTidakHadirFailedState) {
          showTopSnackBar(
            Overlay.of(context),
            animationDuration: const Duration(milliseconds: 600),
            displayDuration: const Duration(milliseconds: 2200),
            reverseAnimationDuration: const Duration(milliseconds: 300),
            TopSnackbarWidget().error(state.error)
          );
        }
        if (state is LatlangNullState) {
          showDialog(
            context: context,
            useSafeArea: false,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.all(0),
              insetPadding: EdgeInsets.all(0) ,
              backgroundColor: Colors.white,
              content: StatefulBuilder(
                builder: (context, setState) => Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50
                        ),
                        child: Image.asset(
                          gpsLostVector,
                          fit: BoxFit.contain,
                          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                            if(wasSynchronouslyLoaded) {
                              return child;
                            } else {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                child: frame != null ? child : SizedBox(
                                  width: SizeConfig.calWidthMultiplier(150),
                                  height: SizeConfig.calHeightMultiplier(150),
                                ),
                              );
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.warning_amber_rounded,
                              size: SizeConfig.calWidthMultiplier(150) / 2,
                              color: Colors.red,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Lokasi Tidak Tersedia',
                        style: AppTextStyles.primaryTextSemibold.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Pastikan GPS aktif untuk\nmelanjutkan kunjungan anda',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ButtonPrimary(
                              color: redPrimaryMain,
                              mainButtonMessage: 'Batalkan',
                              isLoading: loadingMapsPopUp == true
                              ? loadingMapsPopUp
                              : null,
                              mainButton: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: ButtonPrimary(
                              color: bluePrimaryMain,
                              mainButtonMessage: 'Lanjutkan',
                              isLoading: loadingMapsPopUp == true
                              ? loadingMapsPopUp
                              : null,
                              mainButton: () async {
                                setState(() {
                                  loadingMapsPopUp = true;                              
                                });
                
                                validatioLocation().then((value) {
                                  if(value = true) {
                                    Navigator.pop(context);
                                    createKunjunganBloc.add(
                                      CreateKunjunganEvent(
                                        state.idAnak,
                                        titikAlamat!
                                      )
                                    );
                                  } 
                                  if(value = false) {
                                    setState(() {
                                      loadingMapsPopUp = false;                                      
                                    });
                                  }
                                });
                              }
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),              
          ).then((value) {
            loadingMapsPopUp = false;
          });
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
                child: BlocConsumer<ListAnakTidakHadirKunjunganBloc, ListAnakTidakHadirKunjunganState>(
                  listener: (context, state) {
                    debugPrint(state.toString());
                  },
                  builder: (context, state) {
                    if (state is ListAnakTidakHadirKunjunganProccessState || loadingMaps) {
                      return Container(
                        color: Colors.white,
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
                    if (state is ListAnakTidakHadirKunjunganSuccessState) {
                      if (state.listDataAnakTidakHadir.data!.isEmpty) {
                        return const NoDataScreen();
                      }
                      final filteredList = state.listDataAnakTidakHadir.data!.where((data) {
                        final query = _searchController.text.toLowerCase();
                        return data.namaAnak.toLowerCase().contains(query);
                      }).toList();
                      if (filteredList.isEmpty) {
                        return SearchNotFound();
                      }
                      return ListView.separated(
                        itemCount: filteredList.length,
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
                                if(titikAlamat == null) {
                                  createKunjunganBloc.add(
                                    LatlangNullEvent(filteredList[index].id)
                                  );
                                } else {
                                  createKunjunganBloc.add(
                                    CreateKunjunganEvent(
                                      filteredList[index].id,
                                      titikAlamat!
                                    )
                                  );
                                }
                              },
                              name: filteredList[index].namaAnak,
                              nik: filteredList[index].nik,
                              parent: filteredList[index].ibu?.namaIbu,
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
            ? Container(
              color: Colors.white.withAlpha(100),
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
            _searchController.clear();
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
