import 'dart:developer';
import 'dart:io';

import 'package:calorie_counter/models/food_item.dart';
import 'package:camera/camera.dart';

import '../../../app_config.dart';


class ScanImageController extends GetxController {
  TextEditingController search = TextEditingController();
  FoodItem? foodItem;
  static List<CameraDescription> _cameras = [];
  CameraController? controller;
  int _cameraIndex = -1;

  bool isFlash =false;


  @override
  void dispose() {
    // TODO: implement dispose
    _stopLiveFeed();


    super.dispose();
  }





  void _initialize() async {
    if (_cameras.isEmpty) {
      _cameras = await availableCameras();
    }
    _cameraIndex = 0;
    if (_cameraIndex != -1) {
      _startLiveFeed();
    }
  }

  Future _startLiveFeed() async {
    final camera = _cameras[_cameraIndex];
    controller = CameraController(
      camera,
      // Set to ResolutionPreset.high. Do NOT set it to ResolutionPreset.max because for some phones does NOT work.
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    controller?.initialize().then((_) {

     update();
    });

    log("camera :$camera");
  }

  flashModeTap(){
    if(isFlash){
      controller!.setFlashMode(FlashMode.off);
      isFlash =false;
    }else {
      controller!.setFlashMode(FlashMode.torch);
      isFlash =true;
    }
    update();
  }


  onBack(){
    Get.back();dispose();
  }

  Future _stopLiveFeed() async {
    log("STOOOP");
    await controller?.dispose();
    controller = null;
    update();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    foodItem = Get.arguments;
    _initialize();
    update();
    super.onInit();
  }
}
