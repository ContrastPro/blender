import 'dart:io';

import 'package:blender/filters.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  File _pickedFile;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery);

    if (pickedFile.path != null) {
      setState(() {
        _pickedFile = File(pickedFile.path);
      });
    }
  }

  Widget appBar() {}

  Widget _filterItem(int index) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        border: Border.all(
          width: 0.8,
          color: index == _index ? Colors.white : Colors.grey[850],
        ),
        color: Colors.grey[850],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 55,
            child: index != _index
                ? ImageFilter(
                    filter: ImageFilter.filters[index],
                    image: Image.asset(
                      "assets/images/test.jpg",
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
          ),
          Text(
            ImageFilter.filters[index].name,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            flex: 80,
            child: ImageFilter(
              filter: ImageFilter.filters[_index],
              image: Image.asset(
                "assets/images/test.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.only(top: 4, bottom: 8),
            child: ListView.builder(
              itemCount: ImageFilter.filters.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() => _index = index);
                  },
                  child: _filterItem(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
