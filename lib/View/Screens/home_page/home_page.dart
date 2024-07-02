import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../../../controller/user_controller.dart';

class HomePage extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    Future<void> _pickImage(ImageSource source) async {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        userController.setImage(File(pickedFile.path));
      }
    }

    void _showPicker(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Photo Library'),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/category/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _showPicker(context),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: userController.user.imagePath != null
                          ? FileImage(File(userController.user.imagePath!))
                          : null,
                      child: userController.user.imagePath == null
                          ? Icon(Icons.add_a_photo, size: 50)
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: userController.setFirstName,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: userController.setLastName,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: userController.setMobileNumber,
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
