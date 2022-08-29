import 'package:flutter/material.dart';
import 'package:flutter_contact_app/db/db_helper.dart';
import 'package:flutter_contact_app/pages/new_contact_page.dart';
import 'package:flutter_contact_app/provider/contact_provider.dart';
import 'package:provider/provider.dart';

import '../models/contact_model.dart';

class ContactListPage extends StatefulWidget {
  static const String routeName = '/';

  const ContactListPage({Key? key}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, _) => ListView.builder(
            itemCount: provider.contactList.length,
            itemBuilder: (context, index) {
              final contact = provider.contactList[index];
              return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.number),
                trailing: IconButton(
                  icon: Icon(
                      contact.favorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: () {

                  },
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewContactPage.routeName);
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Contact',
      ),
    );
  }
}
