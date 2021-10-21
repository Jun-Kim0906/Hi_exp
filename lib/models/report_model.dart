import 'dart:core';

class ReportModel {
  DateTime startDate;
  DateTime endDate;
  List<DateTime> attendances;
  Map<DateTime, List<String>> smile;
  Map<DateTime, List<String>> angry;
  Map<DateTime, List<String>> sad;
  Map<DateTime, List<String>> sleepy;
  Map<DateTime, List<String>> surprised;

  ReportModel({
    this.startDate,
    this.endDate,
    this.attendances,
    this.smile,
    this.angry,
    this.sad,
    this.sleepy,
    this.surprised,
  });

  ReportModel copyWith({
    DateTime startDate,
    DateTime endDate,
    List<DateTime> attendances,
    Map<DateTime, List<String>> smile,
    Map<DateTime, List<String>> angry,
    Map<DateTime, List<String>> sad,
    Map<DateTime, List<String>> sleepy,
    Map<DateTime, List<String>> surprised,
  }) {
    return ReportModel(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      attendances: attendances ?? this.attendances,
      smile: smile ?? this.smile,
      angry: angry ?? this.angry,
      sad: sad ?? this.sad,
      sleepy: sleepy ?? this.sleepy,
      surprised: surprised ?? this.surprised,
    );
  }

  factory ReportModel.nullModel() {
    return ReportModel(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        attendances: [
          DateTime.now()
        ],
        smile: {
          DateTime(2021, 11, 14): [
            'https://cdn3.mycity4kids.com/images/article-images/web/headersV2/img-20181029-5bd6d6538707d.jpg',
            'https://cdn3.mycity4kids.com/images/article-images/web/headersV2/img-20181029-5bd6d6538707d.jpg'
          ],
          DateTime(2021, 11, 16):[
            'https://cdn3.mycity4kids.com/images/article-images/web/headersV2/img-20181029-5bd6d6538707d.jpg',
            'https://cdn3.mycity4kids.com/images/article-images/web/headersV2/img-20181029-5bd6d6538707d.jpg',
            'https://cdn3.mycity4kids.com/images/article-images/web/headersV2/img-20181029-5bd6d6538707d.jpg',
          ]
        },
        angry: {},
        sad: {},
        sleepy: {},
        surprised: {});
  }

  factory ReportModel.fromDs(Map<String, dynamic> ds) {
    return ReportModel(
      startDate: ds['startDate'] ?? DateTime.now(),
      endDate: ds['endDAte'] ?? DateTime.now(),
      attendances: ds['attendances'] ?? [],
      smile: ds['smile'] ?? {},
      sad: ds['sad'] ?? {},
      sleepy: ds['sleepy'] ?? {},
      angry: ds['angry'] ?? {},
      surprised: ds['surprised'] ?? {},
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'startDate': startDate,
      'endDate': endDate,
      'attendances': attendances,
      'smile': smile,
      'angry': angry,
      'sleepy': sleepy,
      'surprised': surprised,
    };
  }
}
