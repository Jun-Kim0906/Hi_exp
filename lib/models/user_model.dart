class UserModel {
  String phoneNum;
  String name;
  bool isMomSelected;
  bool pwdExist;
  String pwd;

  UserModel({
    this.phoneNum,
    this.name,
    this.isMomSelected,
    this.pwdExist,
    this.pwd,
  });

  UserModel copyWith({
    String phoneNum,
    String name,
    bool isMomSelected,
    bool pwdExist,
    String pwd,
  }){
    return UserModel(
      phoneNum: phoneNum ?? this.phoneNum,
      name: name ?? this.name,
      isMomSelected: isMomSelected ?? this.isMomSelected,
      pwdExist: pwdExist ?? this.pwdExist,
      pwd: pwd ?? this.pwd,
    );
  }

  factory UserModel.fromDs(Map<String, dynamic> data) {
    return UserModel(
      phoneNum: data['phoneNum'] ?? '해당 데이터가 존재하지 않습니다.',
      name: data['name'] ?? '해당 데이터가 존재하지 않습니다.',
      isMomSelected: data['isMomSelected'] ?? false,
      pwdExist: data['pwdExist'] ?? false,
      pwd: data['pwd'] ?? '1234',
    );
  }

  factory UserModel.nullUserModel(){
    return UserModel(
      phoneNum: '',
      name: '',
      isMomSelected: false,
      pwdExist: false,
      pwd: '1234',
    );

  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNum' : phoneNum,
      'name' : name,
      'isMomSelected' : isMomSelected,
      'pwdExist' : pwdExist,
      'pwd' : pwd,
    };
  }

  List<Object> get props => [
    phoneNum,
    name,
    isMomSelected,
    pwdExist,
    pwd,
  ];
}