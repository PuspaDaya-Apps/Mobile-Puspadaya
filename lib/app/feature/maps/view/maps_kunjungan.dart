import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../model/maps_kunjungan_data_model.dart';

class MapskunjunganView extends StatefulWidget {
  final MapsKunjunganDataModel mapsData;
  const MapskunjunganView({
    required this.mapsData,
    super.key
  });

  @override
  State<MapskunjunganView> createState() => _MapskunjunganViewState();
}

class _MapskunjunganViewState extends State<MapskunjunganView> {
  MapController mapController = MapController();
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  @override
  void initState() {
    initLocation();
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
    
    _locationData = await location.getLocation();

    setState(() {
      logger.i(_locationData.toString());
      mapController.move(widget.mapsData.titikMulai, 14);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Kunjungan Anak',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialZoom: 17,
                interactionOptions: InteractionOptions(
                  flags: InteractiveFlag.all,
                  debugMultiFingerGestureWinner: true,
                  enableMultiFingerGestureRace: true,
                  keyboardOptions: KeyboardOptions.disabled(),
                  cursorKeyboardRotationOptions: CursorKeyboardRotationOptions.disabled(),
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: ApiUtils().urlStreetmaps(),
                  userAgentPackageName: 'com.Puspadya.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: widget.mapsData.titikMulai,
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.location_pin,
                        size: 30,
                        color: redPrimary60,
                      )
                    ),
                    Marker(
                      point: widget.mapsData.titikTujuan,
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.location_pin,
                        size: 30,
                        color: greenPrimary40,
                      )
                    )
                  ]
                ),
              ]
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 20
                ),
                child: Container(
                )
              ),
            ),
          ],
        ),
      )
    );
  }
}