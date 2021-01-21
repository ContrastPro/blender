import 'package:flutter/material.dart';

abstract class ConcreteFilter{
  final String name;

  ConcreteFilter(this.name);

  ColorFilter setFilter();
}

class OriginalFilter implements ConcreteFilter {

  @override
  final String name = "Оригинал";

  @override
  ColorFilter setFilter() {
    return ColorFilter.matrix(
        [
          1, 0, 0, 0, 0,
          0, 1, 0, 0, 0,
          0, 0, 1, 0, 0,
          0, 0, 0, 1, 0,
        ]
    );
  }
}

class OldTimesFilter implements ConcreteFilter {

  @override
  final String name = "OT";

  @override
  ColorFilter setFilter() {
    return ColorFilter.matrix(
        [
          1, 0, 0, 0, 0,
          -0.4, 1.3, -0.4, 0.2, -0.1,
          0, 0, 1, 0, 0,
          0, 0, 0, 1, 0,
        ]
    );
  }
}

class PurpleFilter implements ConcreteFilter {

  @override
  final String name = "PR";

  @override
  ColorFilter setFilter() {
    return ColorFilter.matrix(
        [
          1, -0.2, 0, 0, 0,
          0, 1, 0, -0.1, 0,
          0, 1.2, 1, 0.1, 0,
          0, 0, 1.7, 1, 0,
        ]
    );
  }
}


class SepiaFilter implements ConcreteFilter {


  @override
  final String name = "V";

  @override
  ColorFilter setFilter() {
    return ColorFilter.matrix(
        [
          0.393, 0.769, 0.189, 0, 0,
          0.349, 0.686, 0.168, 0, 0,
          0.272, 0.534, 0.131, 0, 0,
          0,     0,     0,     1, 0,
        ]
    );
  }
}

class MilkFilter implements ConcreteFilter {
  @override
  final String name = "MILK";

  @override
  ColorFilter setFilter() {
    return ColorFilter.matrix(
        [
          0, 1.0, 0, 0, 0,
          0, 1.0, 0, 0, 0,
          0, 0.6, 1, 0, 0,
          0, 0, 0, 1, 0,
        ]
    );
  }
}

class GreyscaleFilter implements ConcreteFilter {

  @override
  final String name = "BW";

  @override
  ColorFilter setFilter() {
    return ColorFilter.matrix(
        [
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0,      0,      0,      1, 0,
        ]
    );
  }
}

class InvertFilter implements ConcreteFilter {
  @override
  final String name = "INVERT";

  @override
  ColorFilter setFilter() {
    return ColorFilter.matrix(
        [
          -1,  0,  0, 0, 255,
          0, -1,  0, 0, 255,
          0,  0, -1, 0, 255,
          0,  0,  0, 1,   0,
        ]
    );
  }
}


class ImageFilter extends StatelessWidget{
  final ConcreteFilter _concreteFilter;
  final Image _image;

  static List<ConcreteFilter> filters = [
    OriginalFilter(),
    OldTimesFilter(),
    PurpleFilter(),
    SepiaFilter(),
    MilkFilter(),
    GreyscaleFilter(),
    InvertFilter(),
  ];

  ImageFilter({@required ConcreteFilter filter, @required Image image})
      : this._concreteFilter = filter,
        this._image = image;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: _concreteFilter.setFilter(),
      child: _image,
    );
  }
}