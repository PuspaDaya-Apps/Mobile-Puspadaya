import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../model/maps_data_model.dart';

// ignore: must_be_immutable
class MapsChooseView extends StatefulWidget {
  MapsDataModel? mapsData;
  MapsChooseView({
    this.mapsData,
    super.key
  });

  @override
  State<MapsChooseView> createState() => _MapsChooseViewState();
}

class _MapsChooseViewState extends State<MapsChooseView> {
  MapController mapController = MapController();
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  LatLng? titikAlamat;
  String? alamat;
  bool loadingMaps = true;

  bool loadingAlamat = false;

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
    
    if(widget.mapsData == null) {
      _locationData = await location.getLocation().then((value) {
        setState(() {
          loadingMaps = false;
        });
        return value;
      });
    }

    setState(() {
      if(widget.mapsData != null) {
        titikAlamat = widget.mapsData!.titikAlamat;
        alamat = widget.mapsData!.alamat!;
        mapController.move(widget.mapsData!.titikAlamat, 17);
        loadingMaps = false;
      } else {
        mapController.move(LatLng(_locationData?.latitude ?? -7.314368, _locationData?.longitude ?? 112.718195), 17);
        loadingMaps = false;
      }
    });
  }

  Future<void> getAddressFromLatLng(LatLng position) async {
    await geocoding.placemarkFromCoordinates(
      position.latitude, position.longitude).then((List<geocoding.Placemark> placemarks) {
      geocoding.Placemark place = placemarks[0];
      setState(() {
        alamat ='${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.postalCode}';
        loadingAlamat = false;
      });
    }).catchError((e) {
      debugPrint(e);
      setState(() {
        alamat = null;
        loadingAlamat = false;
      });
    });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'MAPS',
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
                onTap: (posision, latlang) {
                  setState(() {
                    titikAlamat = latlang;
                    getAddressFromLatLng(latlang);
                    loadingAlamat = true;
                  });
                } 
              ),
              children: [
                TileLayer(
                  urlTemplate: ApiUtils().urlStreetmaps(),
                  userAgentPackageName: 'com.Puspadya.app',
                ),
                MarkerLayer(
                  markers: [
                    titikAlamat != null
                    ? Marker(
                      point: LatLng(titikAlamat!.latitude, titikAlamat!.longitude),
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.location_pin,
                        size: 30,
                        color: redPrimary60,
                      )
                    )
                    : Marker(
                      point: LatLng(0, 0), 
                      child: SizedBox.shrink()
                    ),
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
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: 
                    loadingAlamat == false
                    ? () {
                      if(titikAlamat != null) {
                        Navigator.pop(
                          context, 
                          MapsDataModel(
                            titikAlamat: titikAlamat!,
                            alamat: alamat
                          )
                        );
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          animationDuration: const Duration(milliseconds: 600),
                          displayDuration: const Duration(milliseconds: 2200),
                          reverseAnimationDuration: const Duration(milliseconds: 300),
                          TopSnackbarWidget().warning('pilih titik rumah terlebih dahulu ')
                        );
                      }
                    }
                    : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonPriamary,
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(99)
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.calWidthMultiplier(10),
                        vertical: SizeConfig.calHeightMultiplier(10))),
                    child: loadingAlamat == false
                    ? Text(
                      'Simpan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.calMultiplierText(15),
                        fontWeight: FontWeight.w500
                      ),
                    )
                    : SizedBox(
                      child: Center(
                        child: SizedBox(
                          height: SizeConfig.calHeightMultiplier(20),
                          width: SizeConfig.calHeightMultiplier(20),
                          child: const CircularProgressIndicator(
                            color: buttonPriamary,
                          )
                        )
                      )
                    )
                  ),
                ),
              ),
            ),
            loadingMaps
            ? Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).width,
              alignment: Alignment.center,
              color: Colors.white,
              child: SizedBox(
                child: Center(
                  child: SpinKitThreeBounce(
                    color: bluePrimaryMain,
                    size: 50.0,
                  ),
                ),
              )
            )
            : SizedBox.shrink()
          ],
        ),
      )
    );
  }
}