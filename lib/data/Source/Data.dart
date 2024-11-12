abstract class DataSource<T>
{
  Future<List<T>> getAll();
}