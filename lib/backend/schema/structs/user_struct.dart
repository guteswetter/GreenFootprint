// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? uid,
    String? displayName,
    String? createTime,
    GroupInfoStruct? groupInfo,
    String? email,
    String? password,
    String? profilePicture,
  })  : _uid = uid,
        _displayName = displayName,
        _createTime = createTime,
        _groupInfo = groupInfo,
        _email = email,
        _password = password,
        _profilePicture = profilePicture;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "create_time" field.
  String? _createTime;
  String get createTime => _createTime ?? '';
  set createTime(String? val) => _createTime = val;

  bool hasCreateTime() => _createTime != null;

  // "groupInfo" field.
  GroupInfoStruct? _groupInfo;
  GroupInfoStruct get groupInfo => _groupInfo ?? GroupInfoStruct();
  set groupInfo(GroupInfoStruct? val) => _groupInfo = val;

  void updateGroupInfo(Function(GroupInfoStruct) updateFn) {
    updateFn(_groupInfo ??= GroupInfoStruct());
  }

  bool hasGroupInfo() => _groupInfo != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "profilePicture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  set profilePicture(String? val) => _profilePicture = val;

  bool hasProfilePicture() => _profilePicture != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        uid: data['uid'] as String?,
        displayName: data['display_name'] as String?,
        createTime: data['create_time'] as String?,
        groupInfo: data['groupInfo'] is GroupInfoStruct
            ? data['groupInfo']
            : GroupInfoStruct.maybeFromMap(data['groupInfo']),
        email: data['email'] as String?,
        password: data['password'] as String?,
        profilePicture: data['profilePicture'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'display_name': _displayName,
        'create_time': _createTime,
        'groupInfo': _groupInfo?.toMap(),
        'email': _email,
        'password': _password,
        'profilePicture': _profilePicture,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'create_time': serializeParam(
          _createTime,
          ParamType.String,
        ),
        'groupInfo': serializeParam(
          _groupInfo,
          ParamType.DataStruct,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'profilePicture': serializeParam(
          _profilePicture,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        createTime: deserializeParam(
          data['create_time'],
          ParamType.String,
          false,
        ),
        groupInfo: deserializeStructParam(
          data['groupInfo'],
          ParamType.DataStruct,
          false,
          structBuilder: GroupInfoStruct.fromSerializableMap,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        profilePicture: deserializeParam(
          data['profilePicture'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        uid == other.uid &&
        displayName == other.displayName &&
        createTime == other.createTime &&
        groupInfo == other.groupInfo &&
        email == other.email &&
        password == other.password &&
        profilePicture == other.profilePicture;
  }

  @override
  int get hashCode => const ListEquality().hash([
        uid,
        displayName,
        createTime,
        groupInfo,
        email,
        password,
        profilePicture
      ]);
}

UserStruct createUserStruct({
  String? uid,
  String? displayName,
  String? createTime,
  GroupInfoStruct? groupInfo,
  String? email,
  String? password,
  String? profilePicture,
}) =>
    UserStruct(
      uid: uid,
      displayName: displayName,
      createTime: createTime,
      groupInfo: groupInfo ?? GroupInfoStruct(),
      email: email,
      password: password,
      profilePicture: profilePicture,
    );
