import 'dart:async';

import 'package:get/get.dart';
import 'package:ivin_v_01/app/data/model/dto/RepoResponse.dart';
import 'package:ivin_v_01/app/data/model/request/Device_ID_Address_Module.dart';
import 'package:ivin_v_01/app/data/model/response/generic_response.dart';
import 'package:ivin_v_01/app/data/repository/polling_day_repository.dart';
import 'package:ivin_v_01/app/modules/polling_screening/view/polling_screening_view.dart';
import 'package:ivin_v_01/base/base_controller.dart';
import 'package:ivin_v_01/utils/loading/loading_screen.dart';
import 'package:ivin_v_01/utils/storage/app_utils.dart';

import 'package:geolocator/geolocator.dart';

class DetailsPageController extends BaseController<PollingStationRepository> {
  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  RxBool checkbox = false.obs;

  onCheckboxClick() {
    checkbox.toggle();
  }

  Timer? _timer;

  int remainingSeconds = 1;
  final time = '00.00'.obs;

  @override
  void onReady() {
    _startTimer(900);
    super.onReady();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });
  }

  // Getpolling Details
  RxList pollingStationList = [].obs;

  Future<void> getPollingStationDetails(String userID) async {
    RepoResponse<GenericResponse> pollingStationResponse =
        await repository.getPollingStations(userID: userID);
    if (pollingStationResponse.data?.status == 200 ||
        pollingStationResponse.data?.status == 201) {
      List pollingStationData = pollingStationResponse.data?.result as List;
      pollingStationList.clear();
      for (var e in pollingStationData) {
        pollingStationList.add(e['Polling_Station_Name_Num']);
      }
      pollingStationList.refresh();

      print(pollingStationList);
    } else {
      AppUtils.showSnackBar(
          pollingStationResponse.error?.message ?? 'something went wrong');
    }
  }

  RxString latitude = "".obs;
  RxString longitude = "".obs;
  void getUserLocation() async {
    LocationPermission allowPermission = await Geolocator.requestPermission();

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      allowPermission = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude.value = currentPosition.latitude.toString();
      longitude.value = currentPosition.longitude.toString();
    }
    print("------------------");
    print(latitude);
    print(longitude);
    print("------------------");
  }

  void updateDeviceIdAddress(String stationName, String deviceIDs) async {
    DeviceIDAddressModule requestData = DeviceIDAddressModule(
        deviceId: deviceIDs,
        iPAddress: "latitude : $latitude , longitude : $longitude");
    try {
      RepoResponse<GenericResponse> response = await repository.updateIdAddress(
          stationName: stationName, requestData: requestData);

      if (response.data?.status == 200 || response.data?.status == 201) {
        print(response.data.toString());
        print("success");
      } else {
        LoadingUtils.hideLoader();
        AppUtils.showSnackBar(response.error?.message ??
            response.data?.message ??
            'Something went wrong');
      }
    } catch (e) {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
      print("-----------ERROR");
    } finally {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
    }
  }

  onSubmit(deviceIDs) {
    if (pollingStationList.isNotEmpty) {
      for (var i in pollingStationList) {
        updateDeviceIdAddress(i, deviceIDs);
      }
      Get.to(() => PoolingScreeningView());
    } else {
      print("Not Submitted");
    }
  }
}
