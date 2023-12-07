import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {

  final ImagePicker _picker = ImagePicker();
  List<XFile> images = [];

  Future<void> selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null && images.length < 3) {
      setState(() {
        images.add(image);
      });
    }
  }

  Future<void> takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null && images.length < 3) {
      setState(() {
        images.add(photo);
      });
    }
  }


  void removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Stack(
        children: [

          Align(
            alignment: Alignment.centerLeft,

            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) {
                      return SafeArea(
                        child: Container(
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                  leading: Icon(Icons.photo_library),
                                  title: Text('Photo Library'),
                                  onTap: () {
                                    selectImage();
                                    Navigator.of(context).pop();
                                  }
                              ),
                              ListTile(
                                  leading: Icon(Icons.photo_camera),
                                  title: Text('Camera'),
                                  onTap: () {
                                    takePhoto();
                                    Navigator.of(context).pop();
                                  }
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                );
              },

              child: Stack(
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    height: double.infinity,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      image: images.isNotEmpty ? DecorationImage(
                        image: FileImage(File(images[0].path)),
                        fit: BoxFit.cover,
                      ) : null,
                    ),

                    child: images.isNotEmpty ? null : Center(
                      child: Text('+', style: TextStyle(
                          fontSize: 70,
                          color: Colors.grey.withOpacity(0.5)
                      )),
                    ),
                  ),

                  if (images.isNotEmpty)
                    Container(
                        color: Colors.black.withOpacity(0.5),
                        child: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white),
                          onPressed: () => removeImage(0),
                        ),
                    ),
                ],
              ),

            ),

          ),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: double.infinity,
              child: Column(
                children: [

                  GestureDetector(
                    onTap: selectImage,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 95,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                            image: images.length > 1 ? DecorationImage(
                              image: FileImage(File(images[1].path)),
                              fit: BoxFit.cover,
                            ) : null,
                          ),
                          child: images.length > 1 ? null : Center(
                            child: Text('+', style: TextStyle(
                                fontSize: 70,
                                color: Colors.grey.withOpacity(0.5)
                            )),
                          ),
                        ),
                        if (images.length > 1)
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              child: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.white),
                                onPressed: () => removeImage(1),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: selectImage,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                            image: images.length > 2 ? DecorationImage(
                              image: FileImage(File(images[2].path)),
                              fit: BoxFit.cover,
                            ) : null,
                          ),
                          child: images.length > 2 ? null : Center(
                            child: Text('+', style: TextStyle(
                                fontSize: 70,
                                color: Colors.grey.withOpacity(0.5)
                            )),
                          ),
                        ),
                        if (images.length > 2)
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              child: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.white),
                                onPressed: () => removeImage(2),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
