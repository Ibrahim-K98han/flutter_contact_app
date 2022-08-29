import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_contact_app/db/db_helper.dart';
import 'package:flutter_contact_app/models/contact_model.dart';
import 'package:flutter_contact_app/provider/contact_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewContactPage extends StatefulWidget {
  static const String routeName = '/new_contact';

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  String? _dob;
  String? _genderGroupValue;
  String? _imagePath;
  ImageSource _imageSource = ImageSource.camera;

  final from_key = GlobalKey<FormState>();


  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact Page'),
        actions: [
          IconButton(
              onPressed: _saveContact,
              icon: Icon(Icons.save)
          )
        ],
      ),
      body: Form(
        key: from_key,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                  if(value.length > 20){
                    return 'Name must be in 20 character';
                  }
                },
              ),
              SizedBox(height: 7,),
              TextFormField(
                controller: numberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                  if(value.length > 11){
                    return 'Name must be in 11 character';
                  }
                },
              ),
              SizedBox(height: 7,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                },
              ),
              SizedBox(height: 7,),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                  prefixIcon: Icon(Icons.place),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                },
              ),
              SizedBox(height: 10,),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: _selectDate,
                        child: Text('Select Date of Birth')
                    ),
                    Text(_dob==null?'No Date Chose':_dob!),
                  ],
                ),
              ),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Select Gender'),
                    Radio<String>(
                      value: 'Male',
                      groupValue: _genderGroupValue,
                      onChanged: (value){
                        setState((){
                          _genderGroupValue = value;
                        });
                      }),
                    Text('Male'),
                    Radio<String>(
                        value: 'Female',
                        groupValue: _genderGroupValue,
                        onChanged: (value){
                          setState((){
                            _genderGroupValue = value;
                          });
                        }),
                    Text('Female')
                  ],
                ),
              ),
              Card(
                elevation: 5,
                child: _imagePath == null ? Image.asset(
                  'images/person.png',height: 100,width: 100,fit: BoxFit.contain
                ): Image.file(
                  File(_imagePath!),
                  height: 100,width: 100,fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      _imageSource = ImageSource.camera;
                      _getImage();
                    },
                    child: Text('Camers'),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: (){
                      _imageSource = ImageSource.gallery;
                      _getImage();
                    },
                    child: Text('Gallery'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _saveContact() async{
    if(from_key.currentState!.validate()){
      final contact = ContactModel(
          name: nameController.text,
          number: numberController.text,
          email: emailController.text,
          address: addressController.text,
          dob: _dob,
          gender: _genderGroupValue,
          image: _imagePath
      );
      final status = await Provider
          .of<ContactProvider>(context, listen: false)
          .addNewContact(contact);
      if(status){
        Navigator.pop(context);
      }
    }
  }

  void _selectDate() async{
    final selectDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now()
    );
    if(selectDate !=null){
      setState((){
        _dob=DateFormat('dd/MM/yyyy').format(selectDate);
      });
    }
  }

  void _getImage() async{
    final selectImage = await ImagePicker().pickImage(
      source: _imageSource
    );
    if(selectImage !=null){
      setState((){
        _imagePath = selectImage.path;
      });
    }
  }
}
