import 'package:get/get.dart';
import 'package:ivin_v_01/app/data/network/network_requester.dart';

class BaseRepository {
  NetworkRequester get controller => GetInstance().find<NetworkRequester>();
}
