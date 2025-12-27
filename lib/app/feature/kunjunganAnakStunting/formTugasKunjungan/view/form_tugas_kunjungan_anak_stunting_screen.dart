import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../route/route_name.dart';
import '../../../../../utils/constant/constanst.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/widget/alert_confirm_create_kunjungan.dart';
import '../../../../view/widget/alert_done_create_kunjungan.dart';
import '../../../../view/widget/checkbox_list_widget.dart';
import '../../../../model/CheckBoxKunjungan.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/simpanKunjunganAnakStuntingBloc/simpan_kunjungan_anak_stunting_bloc.dart';
import '../bloc/tugasKunjunganAnakStuntingBloc/tugas_kunjungan_anak_stunting_bloc.dart';

class FormTugasKunjunganAnakStunting extends StatelessWidget {
  const FormTugasKunjunganAnakStunting({super.key, required this.idKunjungan});
  final String idKunjungan;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TugasKunjunganAnakStuntingBloc(),
        ),
        BlocProvider(
          create: (context) => SimpanKunjunganAnakStuntingBloc(),
        ),
      ],
      child: FormTugasKunjunganAnakStuntingView(idKunjungan: idKunjungan),
    );
  }
}

class FormTugasKunjunganAnakStuntingView extends StatefulWidget {
  const FormTugasKunjunganAnakStuntingView(
    {super.key, required this.idKunjungan});
  final String idKunjungan;

  @override
  State<FormTugasKunjunganAnakStuntingView> createState() => _FormTugasKunjunganAnakStuntingViewState();
}

class _FormTugasKunjunganAnakStuntingViewState extends State<FormTugasKunjunganAnakStuntingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _appBarTitles = [
    'Tugas Selama Kunjungan',
    'Upload Bukti Kunjungan',
  ];

  final List<double> _progressValues = [
    0.5,
    1.0,
  ];

  List<CheckboxKunjungan> listTugasKunjunganData = [];
  
  CheckboxKunjungan anaktidakAdaDirumah = CheckboxKunjungan(
    id: "0",
    isChecked: false,
    label: "Anak Tidak Berada di Rumah"
  );

  //Maps
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  LatLng? titikAlamat;
  bool loadingMaps = true;

  List<XFile> imagesData = [];

  void _goToNextPage() {
    if (_currentPage < _progressValues.length - 1) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    initLocation();
    BlocProvider.of<TugasKunjunganAnakStuntingBloc>(context).add(GetTugasKunjungan());

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

  @override
  Widget build(BuildContext context) {
    debugPrint('build ulang');
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  if (_currentPage > 0) {
                    setState(() {
                      _currentPage--;
                    });
                    _pageController.animateToPage(
                      _currentPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              title: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: Text(
                  _appBarTitles[_currentPage],
                  key: ValueKey<String>(_appBarTitles[_currentPage]),
                  style: AppTextStyles.primaryTextMedium.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                height: 4,
                width: MediaQuery.sizeOf(context).width *
                    _progressValues[_currentPage],
                color: bluePrimaryMain,
              ),
            ),
          ],
        ),
      ),
      body: PopScope(
        canPop: _currentPage != 0 ? false : true,
        onPopInvokedWithResult: (didPop, result) {
          if (_currentPage == 1) {
            setState(() {
              _currentPage--;
            });
            _pageController.animateToPage(
              _currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        child: SafeArea(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // Halaman pertama
              BlocConsumer<TugasKunjunganAnakStuntingBloc, TugasKunjunganAnakStuntingState>(
                listener: (context, state) {
                  debugPrint(state.toString());
                },
                builder: (context, state) {
                  if (state is TugasKunjunganAnakStuntingProccessState || loadingMaps) {
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
                  if (state is TugasKunjunganAnakStuntingSuccessState) {
                    if (state.listTugasKunjungan.data!.isEmpty) {
                      return Container(
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          alignment: Alignment.center,
                          child: const NoDataScreen());
                    }
                    if (listTugasKunjunganData.isEmpty) {
                      listTugasKunjunganData.addAll(state
                          .listTugasKunjungan.data!
                          .map((e) => CheckboxKunjungan(
                              id: e.id, isChecked: false, label: e.namaTugas))
                          .toList());
                    }

                    return Container(
                      margin: const EdgeInsets.all(20),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pilih tugas yang sudah dilakukan',
                              style: AppTextStyles.primaryTextMedium.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                Column(
                                  children: List.generate(
                                    listTugasKunjunganData.length, (index) {
                                    return IgnorePointer(
                                      ignoring: anaktidakAdaDirumah.isChecked,
                                      child: CheckboxListWidget(
                                        isChecked: listTugasKunjunganData[index].isChecked,
                                        label: listTugasKunjunganData[index].label,
                                        onChanged: (value) {
                                          setState(() {
                                            listTugasKunjunganData[index].isChecked =
                                                value!;
                                          });
                                        },
                                      ),
                                    );
                                  }),
                                ),
                                CheckboxListWidget(
                                  isChecked: anaktidakAdaDirumah.isChecked,
                                  label: anaktidakAdaDirumah.label,
                                  onChanged: (value) {
                                    setState(() {
                                      listTugasKunjunganData.clear();
                                      listTugasKunjunganData.addAll(
                                        state.listTugasKunjungan.data!.map((e) => CheckboxKunjungan(
                                          id: e.id, isChecked: false, label: e.namaTugas)
                                        ).toList()
                                      );
                        
                                      anaktidakAdaDirumah.isChecked = value!;
                                    });
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            ButtonPrimary(
                                color: bluePrimaryMain,
                                mainButtonMessage: 'Simpan',
                                mainButton: () {
                                  setState(() {
                                    _currentPage++;
                                  });
                                  _pageController.animateToPage(
                                    _currentPage,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                  // logger.i("jumlah di LIST =  ${widget.listTugasKunjungan.where((e) => e.isChecked).toList().length}");
                                  // widget.setTugasValue(widget.listTugasKunjungan);
                                }),
                          ],
                        ),
                      ),
                    );
                  }
                  return Container(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      alignment: Alignment.center,
                      child: const ErrorServerScreen());
                },
              ),
              // Halaman kedua
              UploadImage(
                idKunjungan: widget.idKunjungan,
                images: imagesData,
                listTugasKunjungan: listTugasKunjunganData,
                anakTidakAdaDirumah: anaktidakAdaDirumah,
                titikAlamat: titikAlamat,
                setImagesValues: (value) {
                  imagesData.clear();
                  logger.i(value.length);
                  logger.i(value.toString());
                  imagesData.addAll(value);
                  debugPrint("setvalue");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CheckListJobKunjunganAnakView extends StatefulWidget {
//   // final VoidCallback goToNext;
//   List<CheckboxKunjungan> listTugasKunjungan;
//   ValueSetter<List<CheckboxKunjungan>> setTugasValue;

//   CheckListJobKunjunganAnakView(
//       {super.key,
//       // required this.goToNext,
//       required this.listTugasKunjungan,
//       required this.setTugasValue});

//   @override
//   State<CheckListJobKunjunganAnakView> createState() =>
//       _CheckListJobKunjunganAnakViewState();
// }

// class _CheckListJobKunjunganAnakViewState
//     extends State<CheckListJobKunjunganAnakView> {
//   // void _updateCheckbox(int index, bool? value) {
//   //   setState(() {
//   //     if (index == widget.listTugasKunjungan.length - 1 && value == true) {
//   //       // If the last checkbox is selected, disable all other checkboxes
//   //       for (int i = 0; i < widget.listTugasKunjungan.length - 1; i++) {
//   //         widget.listTugasKunjungan[i].isChecked = false;
//   //       }
//   //     } else if (index != widget.listTugasKunjungan.length - 1) {
//   //       // If any other checkbox is selected, uncheck the last checkbox
//   //       widget.listTugasKunjungan[widget.listTugasKunjungan.length - 1]
//   //           .isChecked = false;
//   //     }

//   //     // Update the selected checkbox state
//   //     widget.listTugasKunjungan[index].isChecked = value ?? false;
//   //     // widget.setTugasValue(widget.listTugasKunjungan);
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<TugasKunjunganAnakStuntingBloc,
//         TugasKunjunganAnakStuntingState>(
//       listener: (context, state) {
//         debugPrint(state.toString());
//       },
//       builder: (context, state) {
//         if (state is TugasKunjunganAnakStuntingProccessState) {
//           return Container(
//             height: MediaQuery.sizeOf(context).height,
//             width: MediaQuery.sizeOf(context).width,
//             alignment: Alignment.center,
//             child: const CircularProgressIndicator(
//               color: bluePrimaryMain,
//             ),
//           );
//         }
//         if (state is TugasKunjunganAnakStuntingSuccessState) {
//           if (state.listTugasKunjungan.data!.isEmpty) {
//             return Container(
//                 height: MediaQuery.sizeOf(context).height,
//                 width: MediaQuery.sizeOf(context).width,
//                 alignment: Alignment.center,
//                 child: const NoDataScreen());
//           }
//           if (widget.listTugasKunjungan.isEmpty) {
//             widget.listTugasKunjungan.addAll(state.listTugasKunjungan.data!
//                 .map((e) => CheckboxKunjungan(
//                     id: e.id, isChecked: false, label: e.namaTugas))
//                 .toList());
//           }

//           return Container(
//             margin: const EdgeInsets.all(20),
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Pilih tugas yang sudah dilakukan',
//                   style: AppTextStyles.primaryTextMedium.copyWith(
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Column(
//                   children: List.generate(widget.listTugasKunjungan.length, (index) {
//                     return CheckboxListWidget(
//                       isChecked: widget.listTugasKunjungan[index].isChecked,
//                       label: widget.listTugasKunjungan[index].label,
//                       onChanged: (value) {
//                         setState(() {
//                           widget.listTugasKunjungan[index].isChecked = value!;
//                         });
//                       },
//                     );
//                   }),
//                 ),
//                 // ...widget.listTugasKunjungan.asMap().entries.map((entry) {
//                 //   int index = entry.key;
//                 //   CheckboxKunjungan item = entry.value;

//                 //   return CheckboxListWidget(
//                 //     isChecked: item.isChecked,
//                 //     label: item.label,
//                 //     onChanged: (value) {
//                 //       if (index == widget.listTugasKunjungan.length - 1 &&
//                 //           value == true) {
//                 //         // Disable other checkboxes if the last one is selected
//                 //         for (int i = 0;
//                 //             i < widget.listTugasKunjungan.length - 1;
//                 //             i++) {
//                 //           widget.listTugasKunjungan[i].isChecked = true;
//                 //         }
//                 //       }
//                 //       _updateCheckbox(index, value);
//                 //     },
//                 //   );
//                 // }).toList(),
//                 const SizedBox(height: 20),
//                 ButtonPrimary(
//                   color: bluePrimaryMain,
//                   mainButtonMessage: 'Simpan',
//                   mainButton : () {
//                     logger.i("jumlah di LIST =  ${widget.listTugasKunjungan.where((e) => e.isChecked).toList().length}");
//                     widget.setTugasValue(widget.listTugasKunjungan);
//                   }
//                 ),
//               ],
//             ),
//           );
//         }
//         return Container(
//             height: MediaQuery.sizeOf(context).height,
//             width: MediaQuery.sizeOf(context).width,
//             alignment: Alignment.center,
//             child: const ErrorServerScreen());
//       },
//     );
//   }
// }

class UploadImage extends StatefulWidget {
  UploadImage({
    super.key,
    required this.listTugasKunjungan,
    required this.images,
    required this.idKunjungan,
    required this.setImagesValues,
    required this.anakTidakAdaDirumah,
    this.titikAlamat
  });

  final List<CheckboxKunjungan> listTugasKunjungan;
  List<XFile> images;
  ValueSetter<List<XFile>> setImagesValues;
  final String idKunjungan;
  CheckboxKunjungan anakTidakAdaDirumah;
  LatLng? titikAlamat;

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final ImagePicker _picker = ImagePicker();

  String formattedTime(int value) {
    // int minutes = _seconds ~/ 60;
    // int seconds = _seconds % 60;

    int h = value ~/ 3600;
    int m = ((value - h * 3600)) ~/ 60;
    int s = value - (h * 3600) - (m * 60);

    if (h != 0) {
      return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    } else {
      return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
  }

  // Menyimpan beberapa gambar
  Future<void> _pickImageFromGallery() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      if (widget.images.length + images.length > 5) {
        showTopSnackBar(
            Overlay.of(context),
            animationDuration: const Duration(milliseconds: 600),
            displayDuration: const Duration(milliseconds: 2200),
            reverseAnimationDuration: const Duration(milliseconds: 300),
            TopSnackbarWidget().warning("Maaf, bukti kunjungan maksimal 5"));
      } else {
        setState(() {
          widget.images.addAll(images);
          logger.i("jumlah di child =  ${widget.images}");
        });
      }
    }
  }

  Future<void> _pickImages(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
        source: ImageSource.camera); // Pilih satu gambar dari kamera
    if (pickedFile != null) {
      if (widget.images.length + 1 > 5) {
        showTopSnackBar(
            Overlay.of(context),
            animationDuration: const Duration(milliseconds: 600),
            displayDuration: const Duration(milliseconds: 2200),
            reverseAnimationDuration: const Duration(milliseconds: 300),
            TopSnackbarWidget().warning("Maaf, bukti kunjungan maksimal 5"));
      } else {
        setState(() {
          widget.images.add(pickedFile);
          logger.i("jumlah di child =  ${widget.images}");
        });
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      widget.images.removeAt(index);
      logger.i("jumlah di child =  ${widget.images}");
    });
  }

  @override
  Widget build(BuildContext context) {
    logger.i("jumlah di child =  ${widget.listTugasKunjungan.length}");
    logger.i(
        "jumlah di child =  ${widget.listTugasKunjungan.where((e) => e.isChecked).toList().length}");

    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jumlah Gambar maks 5",
              style: AppTextStyles.primaryTextMedium
                  .copyWith(fontSize: 13, color: textSecondary3),
            ),
            const SizedBox(height: 14),
            widget.images.isNotEmpty
                ? Column(
                    spacing: 8.0,
                    children: widget.images.asMap().entries.map((entry) {
                      int index = entry.key;
                      XFile image = entry.value;
                      return Stack(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height / 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(File(image.path)),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () => _removeImage(index),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.red,
                                ),
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  )
                : Container(), // Jika tidak ada gambar, tampilkan kosong
            widget.images.isEmpty
                ? SizedBox.shrink()
                : const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  useSafeArea: true,
                  barrierColor: Colors.black.withValues(alpha: 0.5),
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(height: 20),
                          ListTile(
                            leading: Icon(
                              FluentIcons.camera_24_regular,
                              color: Colors.black,
                            ),
                            title: Text('Camera'),
                            onTap: () {
                              Navigator.pop(context);
                              _pickImages(ImageSource.camera);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              FluentIcons.image_24_regular,
                              color: Colors.black,
                            ),
                            title: Text('Gallery'),
                            onTap: () {
                              Navigator.pop(context);
                              _pickImageFromGallery();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                  Text(
                    'Tambah Bukti',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
                foregroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 16),
            BlocConsumer<SimpanKunjunganAnakStuntingBloc,
                SimpanKunjunganAnakStuntingState>(
              listener: (context, state) {
                debugPrint(state.toString());
                if (state is SimpanKunjunganAnakStuntingSuccessState) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertConfirmCreateKunjungan(
                        totalDistance: state.model.jarakTotal,
                        totalDuration: formattedTime(
                            state.model.selesaiPada
                            .difference(state.model.mulaiPada)
                            .inSeconds),
                        kunjunganLagi: () {
                          Navigator.of(context)
                            ..pop()
                            ..pop()
                            ..pop(true);
                        },
                        selesai: () {
                          Navigator.of(context)
                            ..pop()
                            ..pop()
                            ..pop();
                        },
                      );
                    },
                  );
                }

                if (state is SimpanKunjunganAnakStuntingFailedBuktitate) {
                  showTopSnackBar(
                      Overlay.of(context),
                      animationDuration: const Duration(milliseconds: 600),
                      displayDuration: const Duration(milliseconds: 2200),
                      reverseAnimationDuration:
                          const Duration(milliseconds: 300),
                      TopSnackbarWidget().error(state.error));
                }

                if (state is SimpanKunjunganAnakStuntingFailedUpdateState) {
                  showTopSnackBar(
                      Overlay.of(context),
                      animationDuration: const Duration(milliseconds: 600),
                      displayDuration: const Duration(milliseconds: 2200),
                      reverseAnimationDuration:
                          const Duration(milliseconds: 300),
                      TopSnackbarWidget().error(state.error));
                }

                if (state is SimpanKunjunganAnakStuntingFailedDetailState) {
                  showTopSnackBar(
                      Overlay.of(context),
                      animationDuration: const Duration(milliseconds: 600),
                      displayDuration: const Duration(milliseconds: 2200),
                      reverseAnimationDuration:
                          const Duration(milliseconds: 300),
                      TopSnackbarWidget().error(state.error));
                }

                if (state is ListTugasNullState) {
                  showTopSnackBar(
                      Overlay.of(context),
                      animationDuration: const Duration(milliseconds: 600),
                      displayDuration: const Duration(milliseconds: 2200),
                      reverseAnimationDuration:
                          const Duration(milliseconds: 300),
                      TopSnackbarWidget()
                          .error("Tugas Selama Kunjungan Belum Terisi"));
                }
                if (state is ListImagesNullState) {
                  showTopSnackBar(
                      Overlay.of(context),
                      animationDuration: const Duration(milliseconds: 600),
                      displayDuration: const Duration(milliseconds: 2200),
                      reverseAnimationDuration:
                          const Duration(milliseconds: 300),
                      TopSnackbarWidget()
                          .error("Upload Bukti Terlebih Dahulu"));
                }
              },
              builder: (context, state) {
                if (state is SimpanKunjunganAnakStuntingProccessState) {
                  return ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bluePrimaryMain,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const CircularProgressIndicator(
                      color: bluePrimaryMain,
                    ),
                  );
                }
                return ButtonPrimary(
                  color: bluePrimaryMain,
                  mainButtonMessage: 'Upload Bukti',
                  mainButton: () {
                    BlocProvider.of<SimpanKunjunganAnakStuntingBloc>(context).add(SimpanKunjungan(
                      idKunjungan: widget.idKunjungan,
                      listImages: widget.images,
                      anakTidakAdaDirumah: widget.anakTidakAdaDirumah,
                      lokasiSelesai: widget.titikAlamat!,
                      listTugas: widget.listTugasKunjungan
                          .where((e) => e.isChecked)
                          .toList()));
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
