import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/src/api/v2/factory.dart';
import 'newsmodel.dart';
import 'dart:async';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class AppDatabase {
  static final AppDatabase _singltonDatabase = AppDatabase._internal();
  AppDatabase._internal();

  factory AppDatabase() {
    return _singltonDatabase;
  }

  DatabaseFactory databaseFactory = databaseFactoryIo;
  final newsStore = intMapStoreFactory.store("news");

  Database? _database;
  Future<Database?> get newsDatabase async {
    if (_database == null) {
      await _openDb().then((db) {
        _database = db;
      });
    }
    return _database;
  }

  Future _openDb() async {
    final documentsPath = await getApplicationDocumentsDirectory();
    final databasePath = join(documentsPath.path, 'news.db');
    final db = await databaseFactory.openDatabase(databasePath);
    return db;
  }

  Future addtoFavourite(News news) async {
    print("start adding");
    await newsStore.add(_database!, news.tojson());
    print("finish adding");
  }

  Future deleteFavourite(News news) async {
    final findNews = Finder(filter: Filter.byKey(news.urlToImage));
    await newsStore.delete(_database!, finder: findNews);
  }

  Future deleteAllFavourite() async {
    await newsStore.delete(_database!);
  }

  Future<List<News>> getNews() async {
    final recordsnapshot = await newsStore.find(await _database!);
    return recordsnapshot.map((e) {
      final news = News.fromJson(e.value);
      return news;
    }).toList();
  }
}
