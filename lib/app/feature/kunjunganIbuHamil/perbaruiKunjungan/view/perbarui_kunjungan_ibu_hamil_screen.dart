import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../utils/constant/constanst.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/widget/alert_confirm_create_kunjungan.dart';
import '../../../../view/widget/checkbox_list_widget.dart';
import '../../../../model/CheckBoxKunjungan.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../detailKunjungan/model/detail_kunjungan_ibu_hamil_response_model.dart';
import '../../formTugasKunjungan/bloc/tugasKunjunganIbuHamilBloc/tugas_kunjungan_ibu_hamil_bloc.dart';
import '../bloc/perbarui_kunjungan_ibu_hamil_bloc.dart';

class PerbaruiKunjunganIbuHamil extends StatelessWidget {
  const PerbaruiKunjunganIbuHamil(
      {super.key, required this.modelDetailKunjungan});

  final DetailKunjunganIbuHamilResponseModel modelDetailKunjungan;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TugasKunjunganIbuHamilBloc(),
        ),
        BlocProvider(
          create: (context) => PerbaruiKunjunganIbuHamilBloc(),
        ),
      ],
      child: FormTugasKunjunganIbuHamilView(
        modelDetailKunjungan: modelDetailKunjungan,
      ),
    );
  }
}

class FormTugasKunjunganIbuHamilView extends StatefulWidget {
  const FormTugasKunjunganIbuHamilView(
      {super.key, required this.modelDetailKunjungan});
  final DetailKunjunganIbuHamilResponseModel modelDetailKunjungan;

  @override
  State<FormTugasKunjunganIbuHamilView> createState() =>
      _FormTugasKunjunganIbuHamilViewState();
}

class _FormTugasKunjunganIbuHamilViewState
    extends State<FormTugasKunjunganIbuHamilView> {
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

  CheckboxKunjungan ibuHamiltidakAdaDirumah = CheckboxKunjungan(
    id: "0",
    isChecked: true,
    label: "Ibu Hamil Tidak Berada di Rumah"
  );

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
    super.initState();
    BlocProvider.of<TugasKunjunganIbuHamilBloc>(context)
        .add(GetTugasKunjungan());
  }

  @override
  Widget build(BuildContext context) {
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
              BlocConsumer<TugasKunjunganIbuHamilBloc,
                  TugasKunjunganIbuHamilState>(
                listener: (context, state) {
                  debugPrint(state.toString());
                },
                builder: (context, state) {
                  if (state is TugasKunjunganIbuHamilProccessState) {
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
                  if (state is TugasKunjunganIbuHamilSuccessState) {
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

                      for (var valueStored
                          in widget.modelDetailKunjungan.kunjunganTugasKader) {
                        logger.i('0');
                        for (var tugas in listTugasKunjunganData) {
                          logger.i('1');
                          if (valueStored.tugasKunjungan.id == tugas.id) {
                            logger.i(tugas.label);
                            tugas.isChecked = true;
                            ibuHamiltidakAdaDirumah.isChecked = false;
                          }
                        }
                      }
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
                                      ignoring: ibuHamiltidakAdaDirumah.isChecked,
                                      child: CheckboxListWidget(
                                        isChecked:
                                            listTugasKunjunganData[index].isChecked,
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
                                  isChecked: ibuHamiltidakAdaDirumah.isChecked,
                                  label: ibuHamiltidakAdaDirumah.label,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == false) {
                                        listTugasKunjunganData.clear();
                                        listTugasKunjunganData.addAll(state
                                            .listTugasKunjungan.data!
                                            .map((e) => CheckboxKunjungan(
                                                id: e.id, isChecked: false, label: e.namaTugas))
                                            .toList());
                        
                                        for (var valueStored
                                            in widget.modelDetailKunjungan.kunjunganTugasKader) {
                                          logger.i('0');
                                          for (var tugas in listTugasKunjunganData) {
                                            logger.i('1');
                                            if (valueStored.tugasKunjungan.id == tugas.id) {
                                              logger.i(tugas.label);
                                              tugas.isChecked = true;
                                            }
                                          }
                                        }
                                      } else {
                                        listTugasKunjunganData.clear();
                                        listTugasKunjunganData.addAll(
                                          state.listTugasKunjungan.data!.map((e) => CheckboxKunjungan(
                                            id: e.id, isChecked: false, label: e.namaTugas)
                                          ).toList()
                                        );
                                      }
                             
                                      ibuHamiltidakAdaDirumah.isChecked = value!;
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
                idKunjungan: widget.modelDetailKunjungan.id,
                linkImages: widget.modelDetailKunjungan.buktiKunjungan
                    .map((e) => e.filePath)
                    .toList(),
                images: imagesData,
                listTugasKunjungan: listTugasKunjunganData,
                ibuHamiltidakAdaDirumah: ibuHamiltidakAdaDirumah,
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

class UploadImage extends StatefulWidget {
  UploadImage(
      {super.key,
      required this.listTugasKunjungan,
      required this.linkImages,
      required this.images,
      required this.idKunjungan,
      required this.setImagesValues,
      required this.ibuHamiltidakAdaDirumah});

  final List<CheckboxKunjungan> listTugasKunjungan;
  final List<String> linkImages;
  List<XFile> images;
  ValueSetter<List<XFile>> setImagesValues;
  final String idKunjungan;
  CheckboxKunjungan ibuHamiltidakAdaDirumah;

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
      if (widget.images.length + widget.linkImages.length + images.length > 5) {
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
      if (widget.images.length + widget.linkImages.length + 1 > 5) {
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
            Column(
                children: List.generate(widget.linkImages.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height / 4,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded) {
                        return child;
                      } else {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: frame != null
                              ? child
                              : SizedBox(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: MediaQuery.sizeOf(context).height / 4,
                                ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.warning_amber_rounded,
                        size: MediaQuery.sizeOf(context).width / 2,
                        color: Colors.red,
                      );
                    },
                    image: NetworkImage(
                      widget.linkImages[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            })),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 2.5,
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                    color: textSecondary5,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            widget.images.isNotEmpty
                ? Column(
                    spacing: 15.0,
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
            BlocConsumer<PerbaruiKunjunganIbuHamilBloc,
                PerbaruiKunjunganIbuHamilState>(
              listener: (context, state) {
                debugPrint(state.toString());
                if (state is PerbaruiKunjunganIbuHamilSuccessState) {
                  Navigator.pop(context, 1);
                }

                if (state is PerbaruiKunjunganIbuHamilFailedBuktitate) {
                  showTopSnackBar(
                      Overlay.of(context),
                      animationDuration: const Duration(milliseconds: 600),
                      displayDuration: const Duration(milliseconds: 2200),
                      reverseAnimationDuration:
                          const Duration(milliseconds: 300),
                      TopSnackbarWidget().error(state.error));
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
              },
              builder: (context, state) {
                if (state is PerbaruiKunjunganIbuHamilProccessState) {
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
                    BlocProvider.of<PerbaruiKunjunganIbuHamilBloc>(context).add(
                        SimpanKunjungan(
                            idKunjungan: widget.idKunjungan,
                            listImages: widget.images,
                            ibuHamilTidakAdaDirumah: widget.ibuHamiltidakAdaDirumah,
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
