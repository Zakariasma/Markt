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

  //Select image in galery
  Future<void> selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null && images.length < 3) {
      setState(() {
        images.add(image);
      });
    }
  }

  //Select image when take picture
  Future<void> takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null && images.length < 3) {
      setState(() {
        images.add(photo);
      });
    }
  }

  //Remove image to list
  void removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  //Display PopUp for select picture or galery
  void popUpSelectGaleryOrPicture() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Galery'),
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
  }

  //Display image when exist
  Decoration displayImage(int index) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color: Colors.grey,
        width: 2,
      ),
      image: images.length > index ? DecorationImage(
        image: FileImage(File(images[index].path)),
        fit: BoxFit.cover,
      ) : null,
    );
  }

  //Display icon when image not exist
  Widget displayAddIcon(int index) {
    return images.length <= index ? Center(
      child: Text('+', style: TextStyle(
          fontSize: 70,
          color: Colors.grey.withOpacity(0.5)
      )),
    ) : Container();
  }

  //Display delete button when image exist
  Widget displayDeleteButton(int index) {
    return images.length > index ? Align(
      alignment: Alignment.topLeft,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: IconButton(
          icon: const Icon(Icons.delete, color: Colors.white),
          onPressed: () => removeImage(index),
        ),
      ),
    ) : Container();
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
              onTap: () {popUpSelectGaleryOrPicture();},
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    height: double.infinity,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: displayImage(0),
                    child: displayAddIcon(0),
                  ),
                  displayDeleteButton(0),
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
                    onTap: () {popUpSelectGaleryOrPicture();},
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 95,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: displayImage(1),
                          child: displayAddIcon(1),
                        ),
                        displayDeleteButton(1),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {popUpSelectGaleryOrPicture();},
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 95,
                          decoration: displayImage(2),
                          child: displayAddIcon(2),
                        ),
                        displayDeleteButton(2),
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
