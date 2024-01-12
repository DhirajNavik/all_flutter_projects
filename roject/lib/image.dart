import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:http/http.dart' as http;

class ImagePickerClass extends StatefulWidget {
  const ImagePickerClass({super.key});

  @override
  State<ImagePickerClass> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickerClass> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print("Image not found");
    }
  }

  Future uploadImage() async {
    setState(() {
      showSpinner = true;
    });
    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var request = http.MultipartRequest('POST', uri);
    request.fields['title'] = "Static title";
    var multiport = http.MultipartFile('image', stream, length);

    request.files.add(multiport);

    var response = await request.send();

    if (response.statusCode == 200) {
      print('image uploaded');
      setState(() {
        showSpinner = false;
      });
    } else {
      print('Failed');
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => getImage(),
                child: Container(
                    child: image == null
                        ? Center(
                            child: Text("Pick Image"),
                          )
                        : Container(
                            child: Center(
                                child: Image.file(
                              File(image!.path).absolute,
                              height: 200,
                              fit: BoxFit.cover,
                            )),
                          )),
              ),
              SizedBox(
                height: 150,
              ),
              GestureDetector(
                  onTap: () => uploadImage(),
                  child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.green,
                    child: Center(child: Text('Uploaded')),
                  ))
            ]),
      ),
    );
  }
}
