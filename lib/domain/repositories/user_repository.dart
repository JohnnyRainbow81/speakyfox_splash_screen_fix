abstract class UserRepository<T, V> {
  Future<T> getMe(String authToken);

  Future<V> resetPassword(String email);

}
