abstract class RepositoryInterface<T> {
  // get All
  Future<List<T>> index();

  // get by id
  Future<T?> get({required String id});

  // create
  Future<void> create({required T object});

  // update
  Future<void> update({required T object});

  // delete
  Future<void> delete({required String id});
}
