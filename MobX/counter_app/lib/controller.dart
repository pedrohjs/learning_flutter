import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{

  @observable
  String name = '';

  @observable
  String lastName = '';

  @computed
  String get fullName => '$name $lastName';

  @action
  changeName(String newName){
    name = newName;
  }

  @action
  changeLastName(String newLastName){
    lastName = newLastName;
  }

}