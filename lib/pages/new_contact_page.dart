import 'package:flutter/material.dart';

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
  final companyController = TextEditingController();
  final designationController = TextEditingController();
  final websiteController = TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
    addressController.dispose();
    companyController.dispose();
    designationController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact Page'),
      ),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
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
            SizedBox(height: 10,),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
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
            SizedBox(height: 10,),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
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
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Company',
                prefixIcon: Icon(Icons.work),
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
            SizedBox(height: 10,),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Designation',
                prefixIcon: Icon(Icons.description),
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Website',
                prefixIcon: Icon(Icons.web),
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
              },
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
