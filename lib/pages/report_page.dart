import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_app/models/report_model.dart';
import 'package:hi_app/widgets/calendar.dart';
import 'package:hi_app/widgets/report_expansion_tile.dart';
import 'package:hi_app/widgets/report_final_expansion_tile.dart';
import 'package:hi_app/widgets/sample.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;


typedef Fn = void Function();

class ReportPage extends StatefulWidget {
  const ReportPage({Key key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  bool _mPlayerIsInited = false;
  double _mSubscriptionDuration = 0;
  Uint8List _boumData;
  StreamSubscription _mPlayerSubscription;
  int pos = 0;

  @override
  void initState() {
    super.initState();
    init().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
  }

  @override
  void dispose() {
    stopPlayer(_mPlayer);
    cancelPlayerSubscriptions();

    // Be careful : you must `close` the audio session when you have finished with it.
    _mPlayer.closeAudioSession();

    super.dispose();
  }

  void cancelPlayerSubscriptions() {
    if (_mPlayerSubscription != null) {
      _mPlayerSubscription.cancel();
      _mPlayerSubscription = null;
    }
  }

  Future<void> init() async {
    await _mPlayer.openAudioSession();
    _boumData = await getAssetData(
        'assets/sound_smaple/flutter_sound_example_assets_samples_sample.m4a');
    _mPlayerSubscription = _mPlayer.onProgress.listen((e) {
      setState(() {
        pos = e.position.inMilliseconds;
      });
    });
  }

  Future<Uint8List> getAssetData(String path) async {
    var asset = await rootBundle.load(path);
    return asset.buffer.asUint8List();
  }

  // -------  Here is the code to playback  -----------------------

  void play(FlutterSoundPlayer player) async {
    await player.startPlayer(
        fromDataBuffer: _boumData,
        codec: Codec.aacADTS,
        whenFinished: () {
          setState(() {});
        });
    setState(() {});
  }


  Future<void> stopPlayer(FlutterSoundPlayer player) async {
    await player.pausePlayer();
  }

  Future<void> resumePlayer(FlutterSoundPlayer player) async {
    await player.resumePlayer();
  }

  Future<void> setSubscriptionDuration(
      double d) async // v is between 0.0 and 2000 (milliseconds)
      {
    _mSubscriptionDuration = d;
    setState(() {});
    await _mPlayer.setSubscriptionDuration(
      Duration(milliseconds: d.floor()),
    );
  }

  // --------------------- UI -------------------

  Fn getPlaybackFn(FlutterSoundPlayer player) {
    if (!_mPlayerIsInited) {
      return null;
    }
    return player.isStopped
        ? () {
      play(player);
    }
        : player.isPaused
        ? () {
      resumePlayer(player);
    }
        : () {
      stopPlayer(player).then((value) => setState(() {}));
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff252525),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Stack(
          children: [
            Image.asset('assets/top266.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 98.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 48.0.w),
                  child: Text(
                    '카페 학습리포트1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      color: Color(0xff252525),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 48.0.w),
                  child: Text(
                    '20/ 11/ 10',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color(0xff252525),
                    ),
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                percentSection(),
                SizedBox(
                  height: 29.h,
                ),
                attendSection(),
                SizedBox(
                  height: 29.h,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 37.0.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 30,
                            color: Color.fromRGBO(125, 125, 125, 0.0791),
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 27.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 21.0.w,
                            ),
                            child: Text(
                              '학습결과',
                              style: TextStyle(
                                  color: Color(0xffFF7645),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 34.0.w),
                            child: Row(
                              children: [
                                Text(
                                  '학습 유형',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Color(0xff7d7d7d),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '걸린 시간',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Color(0xff7d7d7d),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            indent: 34.w,
                            endIndent: 34.w,
                          ),
                          ReportExpasionTile(
                            title: Text(
                              '표정읽기 퀴즈',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff252525),
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text('20',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff252525),
                                    )),
                                Text('분',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff7d7d7d),
                                    )),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 21.0.w,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                    height: 196.h,
                                    width: 698.w,
                                    child: _buildVerticalGradientAreaChart(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ReportExpasionTile(
                            title: Text(
                              '표정짓기',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff252525),
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text('20',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff252525),
                                    )),
                                Text('분',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff7d7d7d),
                                    )),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 21.0.w,
                                ),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    customChip('웃음', () {}, true),
                                    customChip('화남', () {}, false),
                                    customChip('슬픔', () {}, false),
                                    customChip('졸림', () {}, false),
                                    customChip('놀람', () {}, false),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                  ReportModel
                                      .nullModel()
                                      .smile
                                      .length,
                                  itemBuilder: (context, index) {
                                    ReportModel model = ReportModel.nullModel();
                                    DateTime key =
                                    model.smile.keys.elementAt(index);
                                    return Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 21.0.w,
                                          ),
                                          child: Text(
                                            DateFormat('MM월 dd일').format(key),
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10.h),
                                          height: 172.h,
                                          child: ListView.builder(
                                              itemBuilder: (context, i) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                      left: i == 0
                                                          ? 29.0.w
                                                          : 8.0.w,
                                                      right: 8.0.w,
                                                      top: 10.0.h,
                                                      bottom: 10.0.h),
                                                  width: 133.w,
                                                  height: 159.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              model.smile[key]
                                                              [i]),
                                                          fit: BoxFit.fill)),
                                                );
                                              },
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                              model.smile[key].length),
                                        )
                                      ],
                                    );
                                  })
                            ],
                          ),
                          ReportExpasionTile(
                            title: Text(
                              '최종퀴즈',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff252525),
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text('20',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff252525),
                                    )),
                                Text('분',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff7d7d7d),
                                    )),
                              ],
                            ),
                            children: [
                              ReportFinalExpansionTile(
                                title: Text(
                                  '1번 문제',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      color: Color(0xff252525)),
                                ),
                                subtitle: Text(
                                  '손님이 인사하는 상황',
                                  style: TextStyle(
                                      color: Color(0xff7d7d7d),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                children: [
                                  Row(children: [
                                    ElevatedButton(
                                      onPressed: getPlaybackFn(_mPlayer),
                                      child: Text(
                                          _mPlayer.isPlaying ? 'Stop' : 'Play'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(_mPlayer.isPlaying
                                        ? 'Playback in progress'
                                        : 'Player is stopped'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('Pos: $pos'),
                                  ]),
                                  Text('Subscription Duration:'),
                                  Slider(
                                    value: _mSubscriptionDuration,
                                    min: 0.0,
                                    max: 2000.0,
                                    onChanged: setSubscriptionDuration,
                                    //divisions: 100
                                  ),
                                ],
                              ),
                              ReportFinalExpansionTile(
                                title: Text(
                                  '2번 문제',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      color: Color(0xff252525)),
                                ),
                                subtitle: Text(
                                  '손님이 나를 칭찬하며 음료를 주문하는 상황',
                                  style: TextStyle(
                                      color: Color(0xff7d7d7d),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),

                                ),
                              ),
                              ReportFinalExpansionTile(
                                title: Text(
                                  '3번 문제',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      color: Color(0xff252525)),
                                ),
                                subtitle: Text(
                                  '손님이 화장실 위치를 물어보는 상황',
                                  style: TextStyle(
                                      color: Color(0xff7d7d7d),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),

                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 29.h,
                ),
                improveSection(),
                SizedBox(
                  height: 29.h,
                ),
                requestSection(),
                SizedBox(
                  height: 29.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget percentSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 37.0.w),
      height: 169.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 30,
              color: Color.fromRGBO(125, 125, 125, 0.0791),
            )
          ]),
      child: Stack(
        children: [
          Positioned(
              left: 34.w,
              top: 23.h,
              child: Text(
                '전체 직업 달성률',
                style: TextStyle(
                    color: Color(0xffFF7645),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
              )),
          Positioned(
            left: 34.w,
            top: 83.h,
            child: Text(
              '1/4 직업완료',
              style: TextStyle(
                color: Color(0xff252525),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 37.w,
            top: 113.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.only(right: 7.0.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffffd360),
                  ),
                ),
                Text(
                  '카페',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Color(0xff7d7d7d)),
                ),
              ],
            ),
          ),
          Positioned(
            right: -70.w,
            top: -20.h,
            bottom: -20.h,
            child: SfCircularChart(
              key: GlobalKey(),
              series: _getRadialBarDefaultSeries(),
              annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(
                    widget: Center(
                      child: Text(
                        '25%',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1C162E)),
                      ),
                    ))
              ],
              margin: EdgeInsets.zero,
            ),
          )
        ],
      ),
    );
  }

  List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Cafe', y: 25, text: '100%', pointColor: Color(0xffffd360)),
    ];
    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
        maximumValue: 100,
        dataSource: chartData,
        cornerStyle: CornerStyle.bothCurve,
        gap: '80%',
        radius: '90%',
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        pointRadiusMapper: (ChartSampleData data, _) => data.text,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        // dataLabelMapper: (ChartSampleData data, _) => data.x as String
      )
    ];
  }

  Widget attendSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 37.0.w),
      height: 450.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 30,
              color: Color.fromRGBO(125, 125, 125, 0.0791),
            )
          ]),
      child: Stack(
        children: [
          Positioned(
              left: 34.w,
              top: 23.h,
              child: Text(
                '출석',
                style: TextStyle(
                    color: Color(0xffFF7645),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
              )),
          Calendar(
              initialDate: DateTime.now(),
              firstDate: DateTime(2020, 1, 1),
              lastDate: DateTime(2030),
              onDateChanged: (value) {}),
          Positioned(
            top: 340.h,
            left: 184.w,
            child: Row(
              children: [
                Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffff7645),
                  ),
                ),
                Text(
                  ' 시작/완료',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff7d7d7d),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffffd360),
                  ),
                ),
                Text(
                  ' 출석',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff7d7d7d),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 380.h),
            height: 1.5,
            width: double.infinity,
            color: Color(0xffd8d8d8),
          ),
          Positioned(
            left: 30.w,
            bottom: 26.h,
            child: Text(
              '총 학습시간',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
          Positioned(
            right: 30.w,
            bottom: 26.h,
            child: Text(
              '1시간 03분',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget improveSection() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 37.0.w),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: Color.fromRGBO(125, 125, 125, 0.0791),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.0.w, vertical: 27.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '개선점',
                style: TextStyle(
                    color: Color(0xffFF7645),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                '최종퀴즈에서 자주 퀴즈를 중단해요',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff252525),
                ),
              )
            ],
          ),
        ));
  }

  Widget requestSection() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 37.0.w),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: Color.fromRGBO(125, 125, 125, 0.0791),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.0.w, vertical: 27.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '보호자께 부탁하는 말',
                style: TextStyle(
                    color: Color(0xffFF7645),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                '학습자님이 오늘  지난번보다 30분 더 학습하였으니 좋아하는 상을 주세요!',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff252525),
                ),
              )
            ],
          ),
        ));
  }

  /// Returns the list of spline area series with vertical gradient.
  List<ChartSeries<_ChartData, num>> _getGradientAreaSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(x: 1, y: 0),
      _ChartData(x: 2, y: 1),
      _ChartData(x: 3, y: 1),
      _ChartData(x: 4, y: 4),
      _ChartData(x: 5, y: 0),
      _ChartData(x: 6, y: 1),
      _ChartData(x: 7, y: 4),
      _ChartData(x: 8, y: 1),
      _ChartData(x: 9, y: 0),
      _ChartData(x: 10, y: 0),
      _ChartData(x: 11, y: 1),
      _ChartData(x: 12, y: 0),
      _ChartData(x: 13, y: 2),
      _ChartData(x: 14, y: 2),
      _ChartData(x: 15, y: 1),
      _ChartData(x: 16, y: 0),
    ];
    final List<Color> color = <Color>[];
    color.add(const Color(0xFF6A31D5));
    color.add(const Color(0xFFB650C8));

    return <ChartSeries<_ChartData, num>>[
      AreaSeries<_ChartData, num>(
          gradient: const LinearGradient(colors: <Color>[
            Color.fromRGBO(225, 211, 96, 0),
            Color.fromRGBO(255, 159, 122, 1),
          ], stops: <double>[
            0.0,
            0.7
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          borderWidth: 1,
          borderColor: const Color(0xffFF9F7A),
          borderDrawMode: BorderDrawMode.top,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x as num,
          yValueMapper: (_ChartData sales, _) => sales.y)
    ];
  }

  /// Return the circular chart with vertical gradient.
  SfCartesianChart _buildVerticalGradientAreaChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: '틀린횟수',
          alignment: ChartAlignment.near,
          textStyle: TextStyle(
              fontSize: 14.sp,
              color: Color(0xff7d7d7d),
              fontWeight: FontWeight.w500)),
      primaryXAxis: NumericAxis(
          labelFormat: '{value}번',
          maximumLabels: 16,
          maximum: 16,
          majorTickLines: MajorTickLines(width: 0),
          majorGridLines: MajorGridLines(width: 0),
          interval: 1,
          visibleMinimum: 1,
          maximumLabelWidth: 500),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 4,
        interval: 1,
        labelFormat: '{value}' == '4' ? '{value}↑' : null,
        axisLine: const AxisLine(width: 0),
      ),
      series: _getGradientAreaSeries(),
    );
  }

  Widget customChip(String text, VoidCallback onTap, bool selected) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 5.h),
        width: 66.w,
        height: 33.h,
        decoration: BoxDecoration(
            color: selected ? Color(0xffff7645) : Colors.white,
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(
              color: Color(0xffff7645),
            )),
        child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : Color(0xff252525),
                fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                fontSize: 14.sp,
              ),
            )),
      ),
    );
  }
}

class _ChartData {
  _ChartData({this.x, this.y});

  final int x;
  final int y;
}
