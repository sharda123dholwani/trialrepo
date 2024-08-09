import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class DatabaseHelper {
  late Database _db;
   Future<void> init() async {
      final documentDirectory = await getApplicationDocumentsDirectory();
      final path = join(documentDirectory.path,"myDatabase");
      _db = await openDatabase(
      path,
      version:  1,
        password: "sharda_dholwani",
        onCreate: _onCreate
      );
    }

  Future _onCreate(Database db , int version) async {
    await db.execute('''
          CREATE TABLE myTable (
            name TEXT,
            id INTEGER
          )
          ''');
  }

Future<int>   insertData(Map<String,dynamic> row) async{
    return _db.insert("myTable", row);
}

Future<void> queryRows() async {
    var row = await _db.query("myTable");
    print("row");
    print(row);
}

}