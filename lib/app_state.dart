import 'package:flutter/material.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _imgList = [
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
    'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
    'https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg',
    'https://media.istockphoto.com/id/635726330/photo/nahargarh-fort.jpg?s=612x612&w=0&k=20&c=z1hztb9BT6YhxT--G_cW8hBmBHWzrFdwbfM0Pc2jATI=',
    'https://img.freepik.com/free-photo/space-background-realistic-starry-night-cosmos-shining-stars-milky-way-stardust-color-galaxy_1258-154643.jpg',
    'https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg',
    'https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547_1280.jpg',
    'https://picsum.photos/seed/703/600',
    'https://picsum.photos/seed/992/600',
    'https://picsum.photos/seed/243/600'
  ];
  List<String> get imgList => _imgList;
  set imgList(List<String> _value) {
    _imgList = _value;
  }

  void addToImgList(String _value) {
    _imgList.add(_value);
  }

  void removeFromImgList(String _value) {
    _imgList.remove(_value);
  }

  void removeAtIndexFromImgList(int _index) {
    _imgList.removeAt(_index);
  }

  void updateImgListAtIndex(
    int _index,
    Function(String) updateFn,
  ) {
    updateFn(_imgList[_index]);
  }

  String _sampleData = '';
  String get sampleData => _sampleData;
  set sampleData(String _value) {
    _sampleData = _value;
  }

  bool _tagAll = false;
  bool get tagAll => _tagAll;
  set tagAll(bool _value) {
    _tagAll = _value;
  }

  String _userImg = '';
  String get userImg => _userImg;
  set userImg(String _value) {
    _userImg = _value;
  }

  int _totalAmount = 0;
  int get totalAmount => _totalAmount;
  set totalAmount(int _value) {
    _totalAmount = _value;
  }

  String _profileImage = '';
  String get profileImage => _profileImage;
  set profileImage(String _value) {
    _profileImage = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
