import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class BuktiKunjungan extends StatelessWidget {
  final List<String> imageUrls;
  BuktiKunjungan({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    // Contoh daftar URL gambar

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Bukti Kunjungan',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height / 4,
                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                      if(wasSynchronouslyLoaded) {
                        return child;
                      } else {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: frame != null ? child : SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height / 4,
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox.shrink(); 
                      // return Icon(
                      //   Icons.warning_amber_rounded,
                      //   size: MediaQuery.sizeOf(context).width / 2,
                      //   color: Colors.red,
                      // );
                    },
                    image: NetworkImage(
                      imageUrls[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
