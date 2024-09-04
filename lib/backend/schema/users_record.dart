import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "isFollowed" field.
  bool? _isFollowed;
  bool get isFollowed => _isFollowed ?? false;
  bool hasIsFollowed() => _isFollowed != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "concern" field.
  UserConcern? _concern;
  UserConcern? get concern => _concern;
  bool hasConcern() => _concern != null;

  // "skin_concerns" field.
  List<String>? _skinConcerns;
  List<String> get skinConcerns => _skinConcerns ?? const [];
  bool hasSkinConcerns() => _skinConcerns != null;

  // "hair_concerns" field.
  List<String>? _hairConcerns;
  List<String> get hairConcerns => _hairConcerns ?? const [];
  bool hasHairConcerns() => _hairConcerns != null;

  // "other_concerns" field.
  String? _otherConcerns;
  String get otherConcerns => _otherConcerns ?? '';
  bool hasOtherConcerns() => _otherConcerns != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "climatic_conditions" field.
  List<String>? _climaticConditions;
  List<String> get climaticConditions => _climaticConditions ?? const [];
  bool hasClimaticConditions() => _climaticConditions != null;

  // "skin_type" field.
  List<String>? _skinType;
  List<String> get skinType => _skinType ?? const [];
  bool hasSkinType() => _skinType != null;

  // "hair_type" field.
  List<String>? _hairType;
  List<String> get hairType => _hairType ?? const [];
  bool hasHairType() => _hairType != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userName = snapshotData['userName'] as String?;
    _bio = snapshotData['bio'] as String?;
    _isFollowed = snapshotData['isFollowed'] as bool?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _gender = snapshotData['gender'] as String?;
    _concern = deserializeEnum<UserConcern>(snapshotData['concern']);
    _skinConcerns = getDataList(snapshotData['skin_concerns']);
    _hairConcerns = getDataList(snapshotData['hair_concerns']);
    _otherConcerns = snapshotData['other_concerns'] as String?;
    _city = snapshotData['city'] as String?;
    _climaticConditions = getDataList(snapshotData['climatic_conditions']);
    _skinType = getDataList(snapshotData['skin_type']);
    _hairType = getDataList(snapshotData['hair_type']);
    _displayName = snapshotData['display_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userName,
  String? bio,
  bool? isFollowed,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  int? age,
  String? gender,
  UserConcern? concern,
  String? otherConcerns,
  String? city,
  String? displayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'userName': userName,
      'bio': bio,
      'isFollowed': isFollowed,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'age': age,
      'gender': gender,
      'concern': concern,
      'other_concerns': otherConcerns,
      'city': city,
      'display_name': displayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userName == e2?.userName &&
        e1?.bio == e2?.bio &&
        e1?.isFollowed == e2?.isFollowed &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.age == e2?.age &&
        e1?.gender == e2?.gender &&
        e1?.concern == e2?.concern &&
        listEquality.equals(e1?.skinConcerns, e2?.skinConcerns) &&
        listEquality.equals(e1?.hairConcerns, e2?.hairConcerns) &&
        e1?.otherConcerns == e2?.otherConcerns &&
        e1?.city == e2?.city &&
        listEquality.equals(e1?.climaticConditions, e2?.climaticConditions) &&
        listEquality.equals(e1?.skinType, e2?.skinType) &&
        listEquality.equals(e1?.hairType, e2?.hairType) &&
        e1?.displayName == e2?.displayName;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userName,
        e?.bio,
        e?.isFollowed,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.age,
        e?.gender,
        e?.concern,
        e?.skinConcerns,
        e?.hairConcerns,
        e?.otherConcerns,
        e?.city,
        e?.climaticConditions,
        e?.skinType,
        e?.hairType,
        e?.displayName
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
