import 'package:flutter/material.dart';
import 'package:flutter_contact_app/models/contact_model.dart';

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
            ],
          ),
        ),
      ),
    );
  }

  void _saveContact() {
    if(from_key.currentState!.validate()){
      final contact = ContactModel(
          name: nameController.text,
          number: numberController.text,
          email: emailController.text,
          address: addressController.text,

      );
      print(contact.toString());
    }
  }
}
