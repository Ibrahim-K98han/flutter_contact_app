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
        actions: [
          IconButton(
              onPressed: _saveContact,
              icon: Icon(Icons.save)
          )
        ],
      ),
      body: Form(
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
              SizedBox(height: 7,),
              TextFormField(
                controller: companyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
              SizedBox(height: 7,),
              TextFormField(
                controller: designationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Designation',
                  prefixIcon: Icon(Icons.description),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                },
              ),
              SizedBox(height: 7,),
              TextFormField(
                controller: websiteController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Website',
                  prefixIcon: Icon(Icons.web),
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

  }
}
