
import 'package:flutter/material.dart';

class TestModel{
  int id;
  String name;
  TestModel({this.id,this.name});
  static List<TestModel> GetCats(){
    List<TestModel> cats = List<TestModel>();
    cats.add(TestModel(id: 1,name: 'Category One'));
    cats.add(TestModel(id: 2,name: 'Category Two'));
    cats.add(TestModel(id: 3,name: 'Category Three'));
    cats.add(TestModel(id: 4,name: 'Category Four'));
    return cats;
  }
  static List<TestModel> GetServiceProviders(){
    List<TestModel> branchs = List<TestModel>();
    branchs.add(TestModel(id: 1,name: 'Banda'));
    branchs.add(TestModel(id: 2,name: 'Al Othaim'));
    branchs.add(TestModel(id: 3,name: 'Nesto'));
    branchs.add(TestModel(id: 4,name: 'Lulu'));
    return branchs;
  }
  static List<TestModel> GetBranches(){
    List<TestModel> branchs = List<TestModel>();
    branchs.add(TestModel(id: 1,name: 'Al Rydah'));
    branchs.add(TestModel(id: 2,name: 'Al Murabaa'));
    branchs.add(TestModel(id: 3,name: 'Al Jubail'));
    branchs.add(TestModel(id: 4,name: 'Al Batha'));
    return branchs;
  }

  static List<TestModel> GetServices(){
    List<TestModel> branchs = List<TestModel>();
    branchs.add(TestModel(id: 1,name: 'Telecomunication'));
    branchs.add(TestModel(id: 2,name: 'Shoping'));
    return branchs;
  }

}


