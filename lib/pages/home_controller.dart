import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:task_moliya/models/UsersModel.dart';
import 'package:task_moliya/services/dio_service.dart';

class HomeController extends GetxController{
  List<UsersModel>? users;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }
  
  Future<void> getUsers() async{
    isLoading = true;
    update();
    DioService.get(api: DioService.apiGetUsers, params: DioService.paramsEmpty()).then((value) {
      if(value != null) {
        Iterable result = json.decode(value);
        users = List<UsersModel>.from(result.map((model)=> UsersModel.fromJson(model)));
        log(value);
        update();
      }
    });
    isLoading = false;
    update();
  }
}