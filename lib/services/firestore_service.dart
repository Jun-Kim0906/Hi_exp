import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

/*
This class represent all possible CRUD operation for Firestore.
It contains all generic implementation needed based on the provided document
path and documentID,since most of the time in Firestore design, we will have
documentID and path for any document and collections.
 */
class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  ///id를 아는 경우, 데이터 가져오기
  Future<DocumentSnapshot> getData({
    @required String path,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    return await reference.get();
  }

  ///id 자동생성해서 DB에 document생성
  Future<String> addData({
    @required String path,
    @required Map<String, dynamic> data,
    @required String id,
  }) async {
    final reference = FirebaseFirestore.instance.collection(path).doc();
    data['$id'] = reference.id;
    await reference.set(data);
    return reference.id;
  }

  ///기존 한개의 데이터 수정
  Future<void> setData({
    @required String path,
    @required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data, SetOptions(merge: merge));
  }

  ///기존 여러개의 데이터 수정
  Future<void> bulkSet({
    @required String path,
    @required List<Map<String, dynamic>> datas,
    bool merge = false,
  }) async {
//    for()
//    batchSet.
  }

  ///하나의 document 삭제
  Future<void> deleteData({@required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.delete();
  }

  ///여러 document 삭제
  Future<void> deleteDatas({
    @required String path,
    Query Function(Query query) queryBuilder,
  }) async {
    Query query;
    try {
      query = FirebaseFirestore.instance.collection(path);
    } catch (e) {
      print(e);
    }
    if (queryBuilder != null) {
      try {
        query = queryBuilder(query);
      } catch (e) {
        print("1111" + e.toString());
      }
    }
    await query.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  ///StreamBuilder로 그릴 때 사용(실시간, 여러개 가능, 쿼리가능)
  Stream<List<T>> collectionStream<T>({
    @required String path,
    T Function(Map<String, dynamic> data, String documentID) builder,
    Query Function(Query query) queryBuilder,
    int Function(T lhs, T rhs) sort,
  }) {
    Query query;
    try {
      query = FirebaseFirestore.instance.collection(path);
    } catch (e) {
      print(e);
    }
    if (queryBuilder != null) {
      try {
        query = queryBuilder(query);
      } catch (e) {
        print("1111" + e.toString());
      }
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      List<T> result;
      try {
        result = snapshot.docs
            .map((snapshot) => builder(snapshot.data(), snapshot.id))
            .where((value) => value != null)
            .toList();
      } catch (e) {
        print("2222" + e.toString());
      }
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  ///StreamBuilder로 그릴 때 사용(실시간, 하나만 가능)
  Stream<T> documentStream<T>({
    @required String path,
    T Function(Map<String, dynamic> data, String documentID) builder,
  }) {
    final reference = FirebaseFirestore.instance.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  ///FutureBuilder로 그릴 때 사용(한 번, 여러개 가능, 쿼리가능)
  Future<List<T>> collectionFuture<T>({
    @required String path,
    T Function(Map<String, dynamic> data, String documentID) builder,
    Query Function(Query query) queryBuilder,
    int Function(T lhs, T rhs) sort,
  }) async {
    Query query;
    try {
      query = FirebaseFirestore.instance.collection(path);
    } catch (e) {
      print(e);
    }
    if (queryBuilder != null) {
      try {
        query = queryBuilder(query);
      } catch (e) {
        print("1111" + e.toString());
      }
    }
    final snapshots = query.get();
    return snapshots.then((snapshot) {
      List<T> result;
      try {
        result = snapshot.docs
            .map((element) => builder(element.data(), element.id))
            .where((value) => value != null)
            .toList();
      } catch (e) {
        print("22223333" + e.toString());
      }
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  ///FutureBuilder로 그릴 때 사용(한 번, 하나만 가능)
  Future<T> documentFuture<T>({
    @required String path,
    T Function(Map<String, dynamic> data, String documentID) builder,
  }) {
    final reference = FirebaseFirestore.instance.doc(path);
    final snapshots = reference.get();
    return snapshots.then((snapshot) => builder(snapshot.data(), snapshot.id));
  }
}
