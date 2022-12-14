const String tableContact = 'tbl_contact';
const String tableContactColId = 'id';
const String tableContactColName = 'name';
const String tableContactColNumber = 'number';
const String tableContactColEmail = 'email';
const String tableContactColAddress = 'address';
const String tableContactColDob = 'dob';
const String tableContactColGender = 'gender';
const String tableContactColImage = 'image';
const String tableContactColFavorite = 'favorite';

class ContactModel {
  int? id;
  String name;
  String number;
  String? email;
  String? address;
  String? dob;
  String? gender;
  String? image;
  bool favorite;

  ContactModel(
      {this.id,
      required this.name,
      required this.number,
      this.email,
      this.address,
      this.dob,
      this.gender,
      this.image,
      this.favorite = false
      });

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      tableContactColName : name,
      tableContactColNumber : number,
      tableContactColEmail : email,
      tableContactColAddress : address,
      tableContactColDob : dob,
      tableContactColGender : image,
      tableContactColFavorite : favorite ? 1 : 0
    };
    if(id!=null){
      map[tableContactColId] = id;
    }

    return map;
  }

  factory ContactModel.fromMap(Map<String, dynamic>map) => ContactModel(
    id: map[tableContactColId],
    name: map[tableContactColName],
    number: map[tableContactColNumber],
    email: map[tableContactColEmail],
    address: map[tableContactColAddress],
    dob: map[tableContactColDob],
    gender: map[tableContactColGender],
    image: map[tableContactColImage],
    favorite: map[tableContactColFavorite] == 1 ? true : false,
  );

  @override
  String toString() {
    return 'ContactModel{'
        'id: $id, '
        'name: $name, '
        'number: $number, '
        'email: $email, '
        'address: $address, '
        'dob: $dob, '
        'gender: $gender, '
        'image: $image, '
        'isFavorite: $favorite'
        '}';
  }
}
