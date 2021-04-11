import 'dart:io';

import 'package:beautystar_user_app/ui/widgets/components/app_general_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nx_flutter_ui_starter_pack/nx_box.dart';
import 'package:nx_flutter_ui_starter_pack/nx_button.dart';

class SelectFromGallery extends StatefulWidget {
  @override
  _SelectFromGalleryState createState() => _SelectFromGalleryState();
}

class _SelectFromGalleryState extends State<SelectFromGallery> {

  bool isLoading = false;
  File _imageFile;
  Future getImage(ImageSource source) async {
    setState(() {
      // ignore: deprecated_member_use
      ImagePicker.pickImage(source: source).then((value) => setState(() => _imageFile = value));
    });
  }

  @override
  void initState() {
    getImage(ImageSource.gallery);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Image"),
        leading: AppGeneralWidget.backButton(context),
        bottom: AppGeneralWidget.appBarBorderBottom,
      ),
      body: NxBox(
        padding: 16,
        child: Center(
          child: _imageFile != null ? Container(
            padding: EdgeInsets.all(16),
            child: _imageFile != null ? Image.file(_imageFile) : Text("No Image Selected")
          ) : Icon(
            Icons.image, 
            color: Colors.grey[300],
            size: 250
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _imageFile == null ? FlatButton(
            child: Text("Pilih Gambar"),
            onPressed: () => getImage(ImageSource.gallery)
          ) : Row(
            children: <Widget>[
              Expanded(
                child: NxButton(
                  color: Colors.white,
                  textColor: Colors.grey[700],
                  iconColor: Colors.grey[700],
                  icon: Icons.autorenew,
                  fontSize: 20,
                  onPressed: () => getImage(ImageSource.gallery)
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NxButton(
                  color: Colors.white,
                  textColor: Colors.grey[700],
                  iconColor: Colors.grey[700],
                  icon: Icons.crop_rotate,
                  fontSize: 20,
                  onPressed: cropImage
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NxButton(
                  isLoading: isLoading,
                  color: Colors.white,
                  textColor: Colors.grey[700],
                  iconColor: Colors.grey[700],
                  icon: Icons.check_rounded,
                  fontSize: 20,
                  onPressed: _imageFile == null ? null : selectImage
                ),
              ),
            ],
          ),
        )
      )
    );
  }

  selectImage() async {
    setState(() => isLoading = true);
    Navigator.of(context).pop({'file': _imageFile});
  }

  cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: Colors.deepOrange,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1/1,
      )
    );
    if(croppedFile != null)
      setState(() => _imageFile = croppedFile);
  }
}