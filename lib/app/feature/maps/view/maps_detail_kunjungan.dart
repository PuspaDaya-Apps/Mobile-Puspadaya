import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../model/maps_kunjungan_data_model.dart';

class MapsDetailkunjunganView extends StatefulWidget {
  final MapsKunjunganDataModel mapsData;
  const MapsDetailkunjunganView({
    required this.mapsData,
    super.key
  });

  @override
  State<MapsDetailkunjunganView> createState() => _MapsDetailkunjunganViewState();
}

class _MapsDetailkunjunganViewState extends State<MapsDetailkunjunganView> {
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
      if(widget.mapsData.titikMulai == null && widget.mapsData.titikMulai == null) {
        mapController.move(
          LatLng(
            _locationData?.latitude ?? -7.314368, 
            _locationData?.longitude ?? 112.718195
          ), 
          14
        );
      } else {
        mapController.move(widget.mapsData.titikMulai!, 14);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Maps',
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
                    widget.mapsData.titikMulai != null
                    ? Marker(
                      point: widget.mapsData.titikMulai!,
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.location_pin,
                        size: 30,
                        color: redPrimary60,
                      )
                    )
                    : Marker(point: LatLng(0, 0), child: SizedBox.shrink()),
                    
                    widget.mapsData.titikSelesai!= null
                    ?Marker(
                      point: widget.mapsData.titikSelesai!,
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.location_pin,
                        size: 30,
                        color: greenPrimary40,
                      )
                    )
                    : Marker(point: LatLng(0, 0), child: SizedBox.shrink()), 
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