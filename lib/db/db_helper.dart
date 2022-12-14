import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/contact_model.dart';

class DBHelper {
  static const String createTableContact = '''create table $tableContact(
    $tableContactColId integer primary key, 
    $tableContactColName text,
    $tableContactColNumber text,
    $tableContactColEmail text,
    $tableContactColAddress text,
    $tableContactColDob text,
    $tableContactColGender text,
    $tableContactColImage text,
    $tableContactColFavorite integer
  )''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = join(rootPath, 'contact.db');

    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(createTableContact);
    });
  }

  static Future<int> insertContact(ContactModel contactModel) async {
    final db = await open();
    return db.insert(tableContact, contactModel.toMap());
  }

  static Future<List<ContactModel>> getAllContacts() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tableContact);
    return List.generate(
        mapList.length, (index) =>
        ContactModel.fromMap(mapList[index]));
  }
}
