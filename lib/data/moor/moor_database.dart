import 'package:git_client_bloc_moor/data/model/search_result.dart';
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'moor_database.g.dart';


// flutter packages pub run build_runner build
class GitUsersTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get login => text()();

  TextColumn get url => text()();

  TextColumn get image => text()();

  @override
  Set<Column> get primaryKey => {login};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [GitUsersTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<List<GitUsersTableData>> get allEntries => select(gitUsersTable).get();

  Future<List<GitUsersTableData>> entryByLogin(String userLogin) {
    return (select(gitUsersTable)..where((a) => a.login.contains(userLogin)))
        .get();
  }

  addAllEntries(SearchResult searchResult) {
    searchResult.items.forEach((element) async {
      await _addEntry(GitUsersTableCompanion.insert(
          image: element.avatarUrl,
          login: element.login,
          url: element.htmlUrl));
    });
  }

  Future<void> _addEntry(GitUsersTableCompanion entry) {
    return into(gitUsersTable).insertOnConflictUpdate(entry);
  }

  // Future<void> insertMultipleEntries(SearchResult searchResult) async {
  //   await batch((batch) {
  //     // functions in a batch don't have to be awaited - just
  //     // await the whole batch afterwards.
  //     batch.insertAll(gitUsersTable, [GitUsersTableCompanion.insert()]);
  //   });
  // }

  deleteAllEntries() async {
    await delete(gitUsersTable).go();
  }

  @override
  int get schemaVersion => 1;
}

final database = AppDatabase();
