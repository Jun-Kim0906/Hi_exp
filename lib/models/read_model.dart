class ReadModel {
  int category;
  int answer;
  List<dynamic> choice;
  String hint;
  int index;
  String line;
  String photo;
  String record;
  String situation;

  ReadModel(
      {this.category,
      this.answer,
      this.choice,
      this.hint,
      this.index,
      this.line,
      this.photo,
      this.record,
      this.situation});

  ReadModel copyWith({
    int category,
    int answer,
    List<dynamic> choice,
    String hint,
    int index,
    String line,
    String photo,
    String record,
    String situation,
  }) {
    return ReadModel(
      category: category ?? this.category,
      answer: answer ?? this.answer,
      choice: choice ?? this.choice,
      hint: hint ?? this.hint,
      index: index ?? this.index,
      line: line ?? this.line,
      photo: photo ?? this.photo,
      record: record ?? this.record,
      situation: situation ?? this.situation,
    );
  }

  factory ReadModel.fromDS(Map<String, dynamic> data){
    return ReadModel(
      category: data['category'] ?? 0,
      answer: data['answer'] ?? 0,
      choice: data['choice'] ?? [],
      hint: data['hint'] ?? '힌트없음',
      index: data['index'] ?? 0,
      line: data['line'] ?? '없음',
      photo: data['photo'] ?? '사진 없음',
      record: data['record'] ?? '녹음 없음',
      situation: data['situation'] ?? '상황없음',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category' : category,
      'answer' : answer,
      'choice' : choice,
      'hint' : hint,
      'index' : index,
      'line' : line,
      'photo' : photo,
      'record' : record,
      'situation' : situation,
    };
  }

  List<Object> get props => [
    category,
    answer,
    choice,
    hint,
    index,
    line,
    photo,
    record,
    situation,
  ];
}
