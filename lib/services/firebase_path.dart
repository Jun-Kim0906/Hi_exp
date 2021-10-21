class FirestorePath {
  static String users() => 'Users/';
  static String user(String phoneNum) => 'Users/$phoneNum';
  static String readProblems() => 'Read_Problems/';
  // static String thanks(String userId) => 'Users/$userId/Thanks/';
  // static String thank(String userId, String docId) =>
  //     'Users/$userId/Thanks/$docId';
  // static String shares() => 'Shares/';
  // static String share(String docId) => 'Shares/$docId';
  // static String reads() => 'Reads/';
  // static String read(String docId) => 'Reads/$docId';
  // static String selections() => 'Selections/';
  // static String selection(String docId) => 'Selections/$docId';
  // static String links() => 'Link/';
  // static String link(String docId) => 'Link/$docId';
}
