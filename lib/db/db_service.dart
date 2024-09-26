import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../entity/exercise_bean.dart';

class DatabaseService extends GetxService {
  late Database db;
  final faker = Faker();

  Future<DatabaseService> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'plan_db.db');

    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await createTable(db);
      await createDefaultData(db);
    });
  }

  createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS record (id INTEGER PRIMARY KEY,name TEXT,exercise_price REAL,exercise_duration REAL,exercise_log TEXT,created_at TEXT)');
  }

  final DateFormat formatterDay = DateFormat('MM/dd/yyyy');

  createDefaultData(Database db) async {
    for (var i = 0; i < 10; i++) {
      List<String> names = [
        "bowling",
        "basketball",
        "football",
        "billiards",
        "baseball",
        "tennis",
        "badminton",
        "golf",
      ];

      var index = faker.randomGenerator.integer(
        8,
      );
      var interval = faker.randomGenerator.integer(15, min: 3);
      var price = faker.randomGenerator.integer(50, min: 5);
      var duration = faker.randomGenerator.decimal( min: 0.5);
      String formattedString = duration.toStringAsFixed(1);

      // 如果需要 `double` 类型的值（尽管可能不准确）
      double roundedDouble = double.parse(formattedString);
      // 生成一个随机的日期
      var cuDate = DateTime.now();
      DateTime randomDate =
          faker.date.dateTimeBetween(cuDate.subtract(Duration(days: interval)), cuDate);
      var count = await db.insert('record', {
        'name': names[index],
        'exercise_price': price,
        'exercise_duration': roundedDouble,
        'exercise_log':
            "After 10 minutes of warm-up exercises, I felt my body gradually getting into the groove.",
        'created_at': formatterDay.format(randomDate),
      });
    }
  }

  addRecord(String name, double ?price, double duration, String? log, String createAt) async {
    var count = await db.insert('record', {
      'name': name,
      'exercise_price': price,
      'exercise_duration': duration,
      'exercise_log': log,
      'created_at': createAt,
    });
  }

  clean() async {
    await db.delete('record');
  }

  closer() async {
    await db.close();
  }

  Future<List<ExerciseBean>> getAll() async {
    var result =
    await db.query('record', orderBy: 'created_at DESC',);
    return result.map((e) => ExerciseBean.fromJson(e)).toList();
  }
  Future<List<ExerciseBean>> getAllConsumption() async {
    var result =
    await db.query('record', orderBy: 'created_at DESC',where: "exercise_price IS NOT NULL",);
    return result.map((e) => ExerciseBean.fromJson(e)).toList();
  }
  Future<double> calculateSum(String columnName) async {
    List<Map<String, Object?>> result =
        await db.rawQuery('SELECT SUM($columnName) as total FROM record');
    if (result.isNotEmpty) {
      if (result.first['total'] != null) {
        return result.first['total'] as double;
      } else {
        return 0;
      }
    } else {
      // 如果没有数据，返回0或其他适当的值
      return 0;
    }
  }

  Future<double> projectPriceSum(String name) async {
    String query = 'SELECT SUM(exercise_price) as total FROM record WHERE name = ?';
    List<Map<String, Object?>> result = await db.rawQuery(query, [name]);
    if (result.isNotEmpty) {
      // 从结果中提取总和
      if (result.first['total'] != null) {
        return result.first['total'] as double;
      } else {
        return 0;
      }
    } else {
      // 如果没有数据，返回0或其他适当的值
      return 0;
    }
  }
}
