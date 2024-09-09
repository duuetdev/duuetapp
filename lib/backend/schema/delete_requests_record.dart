import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeleteRequestsRecord extends FirestoreRecord {
  DeleteRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_name" field.
  DocumentReference? _userName;
  DocumentReference? get userName => _userName;
  bool hasUserName() => _userName != null;

  // "datetime_request" field.
  DateTime? _datetimeRequest;
  DateTime? get datetimeRequest => _datetimeRequest;
  bool hasDatetimeRequest() => _datetimeRequest != null;

  // "deleted" field.
  bool? _deleted;
  bool get deleted => _deleted ?? false;
  bool hasDeleted() => _deleted != null;

  void _initializeFields() {
    _userName = snapshotData['user_name'] as DocumentReference?;
    _datetimeRequest = snapshotData['datetime_request'] as DateTime?;
    _deleted = snapshotData['deleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('delete_requests');

  static Stream<DeleteRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeleteRequestsRecord.fromSnapshot(s));

  static Future<DeleteRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeleteRequestsRecord.fromSnapshot(s));

  static DeleteRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeleteRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeleteRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeleteRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeleteRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeleteRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeleteRequestsRecordData({
  DocumentReference? userName,
  DateTime? datetimeRequest,
  bool? deleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_name': userName,
      'datetime_request': datetimeRequest,
      'deleted': deleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeleteRequestsRecordDocumentEquality
    implements Equality<DeleteRequestsRecord> {
  const DeleteRequestsRecordDocumentEquality();

  @override
  bool equals(DeleteRequestsRecord? e1, DeleteRequestsRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.datetimeRequest == e2?.datetimeRequest &&
        e1?.deleted == e2?.deleted;
  }

  @override
  int hash(DeleteRequestsRecord? e) =>
      const ListEquality().hash([e?.userName, e?.datetimeRequest, e?.deleted]);

  @override
  bool isValidKey(Object? o) => o is DeleteRequestsRecord;
}
