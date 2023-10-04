import 'package:get/get.dart';

class VotingController extends GetxController {
  var age = 0.obs;

  bool get isEligible => age.value >= 18;
}