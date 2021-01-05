// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class GitUsersTableData extends DataClass
    implements Insertable<GitUsersTableData> {
  final int id;
  final String login;
  final String url;
  final String image;
  GitUsersTableData(
      {@required this.id,
      @required this.login,
      @required this.url,
      @required this.image});
  factory GitUsersTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return GitUsersTableData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      login:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}login']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || login != null) {
      map['login'] = Variable<String>(login);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    return map;
  }

  GitUsersTableCompanion toCompanion(bool nullToAbsent) {
    return GitUsersTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      login:
          login == null && nullToAbsent ? const Value.absent() : Value(login),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory GitUsersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GitUsersTableData(
      id: serializer.fromJson<int>(json['id']),
      login: serializer.fromJson<String>(json['login']),
      url: serializer.fromJson<String>(json['url']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'login': serializer.toJson<String>(login),
      'url': serializer.toJson<String>(url),
      'image': serializer.toJson<String>(image),
    };
  }

  GitUsersTableData copyWith(
          {int id, String login, String url, String image}) =>
      GitUsersTableData(
        id: id ?? this.id,
        login: login ?? this.login,
        url: url ?? this.url,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('GitUsersTableData(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('url: $url, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(login.hashCode, $mrjc(url.hashCode, image.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GitUsersTableData &&
          other.id == this.id &&
          other.login == this.login &&
          other.url == this.url &&
          other.image == this.image);
}

class GitUsersTableCompanion extends UpdateCompanion<GitUsersTableData> {
  final Value<int> id;
  final Value<String> login;
  final Value<String> url;
  final Value<String> image;
  const GitUsersTableCompanion({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.url = const Value.absent(),
    this.image = const Value.absent(),
  });
  GitUsersTableCompanion.insert({
    this.id = const Value.absent(),
    @required String login,
    @required String url,
    @required String image,
  })  : login = Value(login),
        url = Value(url),
        image = Value(image);
  static Insertable<GitUsersTableData> custom({
    Expression<int> id,
    Expression<String> login,
    Expression<String> url,
    Expression<String> image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (login != null) 'login': login,
      if (url != null) 'url': url,
      if (image != null) 'image': image,
    });
  }

  GitUsersTableCompanion copyWith(
      {Value<int> id,
      Value<String> login,
      Value<String> url,
      Value<String> image}) {
    return GitUsersTableCompanion(
      id: id ?? this.id,
      login: login ?? this.login,
      url: url ?? this.url,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GitUsersTableCompanion(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('url: $url, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $GitUsersTableTable extends GitUsersTable
    with TableInfo<$GitUsersTableTable, GitUsersTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GitUsersTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _loginMeta = const VerificationMeta('login');
  GeneratedTextColumn _login;
  @override
  GeneratedTextColumn get login => _login ??= _constructLogin();
  GeneratedTextColumn _constructLogin() {
    return GeneratedTextColumn(
      'login',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, login, url, image];
  @override
  $GitUsersTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'git_users_table';
  @override
  final String actualTableName = 'git_users_table';
  @override
  VerificationContext validateIntegrity(Insertable<GitUsersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login'], _loginMeta));
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url'], _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GitUsersTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GitUsersTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GitUsersTableTable createAlias(String alias) {
    return $GitUsersTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $GitUsersTableTable _gitUsersTable;
  $GitUsersTableTable get gitUsersTable =>
      _gitUsersTable ??= $GitUsersTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [gitUsersTable];
}
