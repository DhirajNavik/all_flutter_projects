// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
// import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
// import 'package:prasada_political_portfolio/app/data/model/response/outside_voter_model.dart';
// import 'package:prasada_political_portfolio/app/data/model/resuest/outside_vote_model.dart';
// import 'package:prasada_political_portfolio/app/data/repository/polling_day_repository.dart';
// import 'package:prasada_political_portfolio/app/data/values/urls.dart';
// import 'package:prasada_political_portfolio/app/modules/polling_day/controllers/polling_day_view_controller.dart';
// import 'package:prasada_political_portfolio/base/base_controller.dart';
// import 'package:prasada_political_portfolio/utils/app_utils.dart';
// import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';
// import 'package:prasada_political_portfolio/utils/loading/loading_utils.dart';

// List outsidePollingStationResultList = [];

// List insidePollingStationResultList = [];

// class InsideOutsideController extends BaseController<PollingStationRepository> {
//   final PollingDayViewController pollingDayViewController =
//       Get.put(PollingDayViewController());

//   final ScrollController scrollController = ScrollController();

//   TextFieldWrapper pollingStations = TextFieldWrapper();

//   RxList<String> dropDownList = <String>[].obs;

//   RxBool isSwitchStatus = false.obs;

//   RxString selected = "".obs;

//   RxInt pollingStationCountResult = 0.obs;

//   RxInt noofVotes = 0.obs;

//   RxList<OutsideVoterModel> outsidePollingStationResultListResponse = RxList();

//   @override
//   void onInit() {
//     super.onInit();
//     generateDropDownList();
//   }

//   // Switch Controllers

//   onSwitchSelect() {
//     isSwitchStatus.toggle();
//     scrollController.jumpTo(0.0);
//   }

//   // DropDown

//   setSelected(String value) {
//     selected.value = value;

//     // clears old Lists
//     getVoterSerialNumber(selected.value);
//     unselectedVoterNumbers.clear();
//     outsidePollingStationResultListResponse.clear();
//     getnoofVoted(selected.value);
//     getPollingStationCount(selected.value);
//     outsideAutoGenerate();
//     getPollingOutsideData(selected.value);
//     outsidePollingStationResultListResponse.refresh();
//   }

//   generateDropDownList() {
//     dropDownList.clear();
//     for (var i in pollingDayViewController.pollingStationList) {
//       dropDownList.add(i);
//     }
//   }

//   // Api

//   Future<void> getPollingStationCount(String stationName) async {
//     RepoResponse<GenericResponse> pollingStationCountResponse =
//         await repository.getPollingStationCounts(stationName: stationName);

//     if (pollingStationCountResponse.data?.status == 200 ||
//         pollingStationCountResponse.data?.status == 201) {
//       pollingStationCountResult.value =
//           pollingStationCountResponse.data?.result['No.Of.Voter'] as int;
//     }
//   }

//   // works

//   Future<void> getnoofVoted(String stationName) async {
//     RepoResponse<GenericResponse> totalvoteResponse =
//         await repository.getisVotedCount(stationName: stationName);
//     if (totalvoteResponse.data?.status == 200 ||
//         totalvoteResponse.data?.status == 201) {
//       noofVotes.value = totalvoteResponse.data!.result["IsVotedCount"] as int;
//       print(noofVotes);
//     } else {
//       AppUtils.showSnackBar(
//           totalvoteResponse.error?.message ?? 'something went wrong');
//     }
//   }

//   // Create a list to store unselected voters
//   RxList<String> unselectedVoterNumbers = <String>[].obs;
//   outsideAutoGenerate() {
//     // Create a set of voter numbers from 1 to totalVotes
//     Set<String> allVoterNumbers = Set<String>.from(List<String>.generate(
//         pollingStationCountResult.value, (index) => (index + 1).toString()));

//     // Create a set of selected voter numbers from the API response
//     Set<String> selectedVoterNumbers = Set<String>.from(
//         outsidePollingStationResultListResponse
//             .map((voter) => voter.voterSerialNumber));

//     // Find the unselected voter numbers
//     unselectedVoterNumbers =
//         allVoterNumbers.difference(selectedVoterNumbers).toList().obs;
//   }

//   Future<void> getPollingOutsideData(String stationName) async {
//     RepoResponse<GenericResponse> pollingStationDataResponse =
//         await repository.getPollingStationData(
//             stationURL: URLs.getOutsidePollingData, stationName: stationName);

//     if (pollingStationDataResponse.data?.status == 200 ||
//         pollingStationDataResponse.data?.status == 201) {
//       outsidePollingStationResultList =
//           pollingStationDataResponse.data?.result as List;

//       for (var element in outsidePollingStationResultList) {
//         outsidePollingStationResultListResponse
//             .add(OutsideVoterModel.fromJson(element));
//       }
//     } else {
//       AppUtils.showSnackBar(
//           pollingStationDataResponse.error?.message ?? 'something went wrong');
//     }
//   }

//   Future<void> getPollingInsideData(String stationName) async {
//     RepoResponse<GenericResponse> pollingStationDataResponse =
//         await repository.getPollingStationData(
//             stationURL: URLs.getInsidePollingData, stationName: stationName);

//     if (pollingStationDataResponse.data?.status == 200 ||
//         pollingStationDataResponse.data?.status == 201) {
//       insidePollingStationResultList =
//           pollingStationDataResponse.data?.result as List;
//       pollingStationCountResult.refresh();
//     } else {
//       AppUtils.showSnackBar(
//           pollingStationDataResponse.error?.message ?? 'something went wrong');
//     }
//   }

//   RxList<int> votersSerialNumbers = <int>[].obs;

//   Future<void> getVoterSerialNumber(String stationName) async {
//     RepoResponse<GenericResponse> votersSerialNumbersResponse =
//         await repository.getResponseData(
//             url: URLs.getVoterSerialNumber, stationName: stationName);

//     if (votersSerialNumbersResponse.data?.status == 200 ||
//         votersSerialNumbersResponse.data?.status == 201) {
//       votersSerialNumbers.clear();

//       var data = votersSerialNumbersResponse.data?.result as List;
//       for (var i in data) {
//         votersSerialNumbers.add(int.parse(i));
//       }
//       print(votersSerialNumbers);
//       print(votersSerialNumbers.length);
//     }
//   }

//   // Update
//   void isOutsideUpdated(
//       String stationName, int index, bool isOutsideValue) async {
//     outsideVoteModule requestData = outsideVoteModule(
//       outsideVoter: isOutsideValue,
//     );
//     try {
//       RepoResponse<GenericResponse> response = await repository.updateVote(
//         stationUrl: URLs.outsideURL,
//         token: URLs.token,
//         id: (index),
//         stationName: stationName,
//         requestData: requestData,
//       );
//       if (response.data?.status == 200 || response.data?.status == 201) {
//         setSelected(stationName);
//       } else {
//         LoadingUtils.hideLoader();
//         AppUtils.showSnackBar(response.error?.message ??
//             response.data?.message ??
//             'Something went wrong');
//       }
//     } catch (e) {
//       if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
//     } finally {
//       if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
//     }
//   }
// }
