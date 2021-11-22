import 'package:flutter_sqlite/Model/course.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
// بعمل instance وحيد من ال helper
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();

  static Database _dp;


  // هنبني ال داتابيز و نعمل فيها جدول ونحدد الاعمده بتاعته
  //هترجعلنا بالداتا بيز جاهزه على اننا ندخل فيها بيانات و ده هننفزه في الميثود اللي بعدها
  Future<Database> createdatabase() async {
// بشوف الاول في داتا بيز ولا لا لو مفيش هبدأ انشأها
    if (_dp != null) {
      return _dp;
    } else {
      // اول حاجه هنشأ ال path اللي هتتخزن فيه الداتا بيز

      String path = join(await getDatabasesPath(), 'newschool.dp');
// خلصنا المسار هننشأ الداتا بيز نفسها
      _dp = await openDatabase(path, version: 1, onCreate: (Database d, int v) {
        d.execute(
            'create table course(id integer primary key autoincrement, name varchar(50), content varchar(255), hours integer, level varchar(50),price double,rate double,available integer )');
      },
      );
      return _dp;
    }
  }

  // ميثود هترجعلنا بال id بتاع الصف الجديد اللي هنضيفه في الداتا بيز
  //هتاخد براميتر من ال model

  Future<int> createcourse(Course course) async {
    // هنعمل اوبجكت من الداتا بيز يخزن الداتا بيز اللي عملناها من الميثود اللي فاتت
    Database dp = await createdatabase();
    //هضنيف داتا
    //insert بترجع ب int
    return dp.insert('course', course.tomap());
  }

  //ميثود هترجع الداتا اللي اتخزنت في الداتا بيز
// هترجع ب list من ال courses

  Future<List> getcourses()async{
   Database dp = await createdatabase();
   return dp.query('course');
}

// ميثود نمسح بيها عناصر في الداتا بيز بترجع ب عدد العناصر اللي اتمسحت و بتاخد ال id بتاع العنصر اللي عايزين نمسحه

Future<int> deletecourse(int id) async{
 Database dp = await createdatabase();

 // لو كتبتها من غير where هيمسح الجدول كله
 return dp.delete('course', where: 'id = ?' , whereArgs: [id]);
}

  Future<int> updatecourse(Course course) async {
    // هنعمل اوبجكت من الداتا بيز يخزن الداتا بيز اللي عملناها من الميثود اللي فاتت
    Database dp = await createdatabase();
    //هتعدل داتا
    //update بترجع ب int
    return dp.update('course', course.tomap(), where: 'id = ?' , whereArgs: [course.id]);
  }
}