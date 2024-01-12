import 'dart:ffi';

import 'package:get/get.dart';
import 'package:ivin_v_01/app/data/model/dto/RepoResponse.dart';
import 'package:ivin_v_01/app/data/model/request/inside_vote_model.dart';
import 'package:ivin_v_01/app/data/model/response/generic_response.dart';
import 'package:ivin_v_01/app/data/model/response/inside_voter_model.dart';
import 'package:ivin_v_01/app/data/model/response/outside_voter_model.dart';
import 'package:ivin_v_01/app/data/repository/polling_day_repository.dart';
import 'package:ivin_v_01/app/data/values/urls.dart';
import 'package:ivin_v_01/app/modules/details_page/controller/details_page_controller.dart';
import 'package:ivin_v_01/utils/loading/loading_screen.dart';
import 'package:ivin_v_01/utils/storage/app_utils.dart';

// int totalCheckBoxex = 10;

List insidePollingStationResultList = [];

class PollingStationViewController extends GetxController {
  final DetailsPageController detailsPageController =
      Get.put(DetailsPageController());
  PollingStationRepository controller = Get.put(PollingStationRepository());

  RxList<OutsideVoterModel> outsidePollingStationResultList = RxList();
  RxList<InsideVoterModel> insidePollingStationResultList = RxList();
  RxList<OutsideVoterModel> tempOutsideResultList = RxList();
  RxList<InsideVoterModel> tempInsideResultList = RxList();

  // switch
  RxBool isSwitchStatus = false.obs;

  onSwitchSelect() {
    isSwitchStatus.toggle();
  }

  // DropDown

  final selected = "".obs;

  void setSelected(String value) {
    selected.value = value;
   getPollingOutsideData(selected.value);
  }

  RxList dropDownList = [].obs;

  RxMap finalDropDownList = {}.obs;

  generateDropDownList() {
    dropDownList.clear();
    //
    for (var i in detailsPageController.pollingStationList) {
      dropDownList.add(i);
    }
    print(dropDownList);
  }

  //Outside CheckBoxes

  // onOutsideClick(int index, value) {
  //   if (checkBoxValueList[index] == false) {
  //     checkBoxValueList[index] = true;
  //   } else {
  //     checkBoxValueList[index] = false;
  //   }
  //
  //   checkBoxValueList.refresh();
  // }

  // inside station checkboxes

  onInsideClick(int index, value) {
    if (insideCheckBoxexList[index] == false) {
      insideCheckBoxexList[index] = true;
    } else {
      insideCheckBoxexList[index] = false;
    }

    insideCheckBoxexList.refresh();
  }

  // autoTrueCheckbox() {
  //   print(outsidePollingStationResultList);
  //   checkBoxValueList.clear();
  //
  //   checkBoxValueList = List.generate(pollingStationCountResult.value, (index) {
  //     var currentSerialNumber = (index + 1).toString(); // Convert to string
  //     var matchingResult = outsidePollingStationResultList.value.firstWhere(
  //       (voter) => voter. == currentSerialNumber,
  //       orElse: () => {'outside_voter': 'false'},
  //     );
  //     return matchingResult['outside_voter'] == true;
  //   }).obs;
  //
  //   print(checkBoxValueList);
  // }

  // Api
  RxInt pollingStationCountResult = 0.obs;

  Future<void> getPollingStationCount(String stationName) async {
    RepoResponse<GenericResponse> pollingStationCountResponse =
        await controller.getPollingStationCounts(stationName: stationName);
    if (pollingStationCountResponse.data?.status == 200 ||
        pollingStationCountResponse.data?.status == 201) {
      int result =
          pollingStationCountResponse.data?.result['No.Of.Voter'] as int;
      pollingStationCountResult = result.obs;
      print(pollingStationCountResult);
      pollingStationCountResult.refresh();
    }
  }

  // RxList<bool> checkBoxValueList = <bool>[].obs;

  Future<void> getPollingOutsideData(String stationName) async {
    RepoResponse<GenericResponse> pollingStationDataResponse =
        await controller.getPollingStationData(
            stationURL: URLs.getOutsidePollingData, stationName: stationName);

    if (pollingStationDataResponse.data?.status == 200 ||
        pollingStationDataResponse.data?.status == 201) {
      var polingData =
          pollingStationDataResponse.data?.result as List;
      for (var element in polingData) {
        outsidePollingStationResultList.add(OutsideVoterModel.fromJson(element));
      }

        // print("${outsidePollingStationResultLists.value} ======================================");
      // autoTrueCheckbox();
    } else {
      AppUtils.showSnackBar(
          pollingStationDataResponse.error?.message ?? 'something went wrong');
    }
  }

  // autoInsideCheckBoxGenerator() {
  //   print(insidePollingStationResultList);
  //
  //   insideCheckBoxexList.clear();
  //
  //   insideCheckBoxexList =
  //       List.generate(pollingStationCountResult.value, (index) {
  //     var currentSerialNumber = (index + 1).toString(); // Convert to string
  //     var matchingResult = insidePollingStationResultList.firstWhere(
  //       (voter) => voter['Voter_SerialNumber'] == currentSerialNumber,
  //       orElse: () => {'inside_voter': 'false'},
  //     );
  //     return matchingResult['inside_voter'] == true;
  //   }).obs;
  //
  //   print(insideCheckBoxexList);
  // }

  RxList<bool> insideCheckBoxexList = <bool>[].obs;

  // Future<void> getPollingInsideData(String stationName) async {
  //   print("inside");
  //   RepoResponse<GenericResponse> pollingStationDataResponse =
  //       await controller.getPollingStationData(
  //           stationURL: URLs.getInsidePollingData, stationName: stationName);
  //
  //   if (pollingStationDataResponse.data?.status == 200 ||
  //       pollingStationDataResponse.data?.status == 201) {
  //     insidePollingStationResultList =
  //         pollingStationDataResponse.data?.result as List;
  //     pollingStationCountResult.refresh();
  //
  //     autoInsideCheckBoxGenerator();
  //     print(insideCheckBoxexList);
  //   } else {
  //     AppUtils.showSnackBar(
  //         pollingStationDataResponse.error?.message ?? 'something went wrong');
  //   }
  // }
  //
  // void isOutsideUpdated(String stationName, int index) async {
  //   outsideVoteModule requestData = outsideVoteModule(
  //     outsideVoter: checkBoxValueList[index],
  //   );
  //   try {
  //     RepoResponse<GenericResponse> response = await controller.updateVote(
  //       stationUrl: URLs.outsideURL,
  //       token: URLs.token,
  //       id: (index + 1),
  //       stationName: stationName,
  //       requestData: requestData,
  //     );
  //     if (response.data?.status == 200 || response.data?.status == 201) {
  //       print("${response.data!.toJson()}");
  //       print(requestData.toJson());
  //     } else {
  //       LoadingUtils.hideLoader();
  //       AppUtils.showSnackBar(response.error?.message ??
  //           response.data?.message ??
  //           'Something went wrong');
  //     }
  //   } catch (e) {
  //     if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
  //   } finally {
  //     if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
  //   }
  // }

  void isInsideUpdated(String stationName, int index) async {
    insideVoteModel requestData = insideVoteModel(
      insideVoter: insideCheckBoxexList[index],
    );
    try {
      RepoResponse<GenericResponse> response = await controller.updateVote(
          stationUrl: URLs.insideURL,
          token: URLs.token,
          requestData: requestData,
          stationName: stationName,
          id: (index + 1));
      if (response.data?.status == 200 || response.data?.status == 201) {
        print("${response.data!.toJson()}");
        print(requestData.toJson());
      } else {
        LoadingUtils.hideLoader();
        AppUtils.showSnackBar(response.error?.message ??
            response.data?.message ??
            'Something went wrong');
      }
    } catch (e) {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
    } finally {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
    }
  }
}
