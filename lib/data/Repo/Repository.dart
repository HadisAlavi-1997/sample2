import 'package:flutter/cupertino.dart';

import '../Source/Data.dart';

class Repository<T> with ChangeNotifier implements DataSource{
  final DataSource<T> localDataSource;
  Repository(this.localDataSource);
  @override
  Future<List<T>> getAll() {
    return localDataSource.getAll();
  }
}