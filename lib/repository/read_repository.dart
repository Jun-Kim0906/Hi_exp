
import 'package:hi_app/models/read_model.dart';
import 'package:hi_app/services/firebase_path.dart';
import 'package:hi_app/services/firestore_service.dart';

class ReadRepository {
  final FirestoreService _firestoreService = FirestoreService.instance;

  Future<List<ReadModel>> getRead(int category)=>
      _firestoreService.collectionFuture(
        path: FirestorePath.readProblems(),
        builder: (data, docID) => ReadModel.fromDS(data),
        queryBuilder: (q) => (q.where('category', isEqualTo: category).orderBy('index')),
      );
}