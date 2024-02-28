import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:hivemind/models/scout_data_model.dart';
import 'package:flutter_image_map/flutter_image_map.dart';
import '../models/score_event.dart';

class TeleopPage extends StatefulWidget {
  final ScoutData scoutData;
  final String? allianceColor;
  const TeleopPage({super.key, required this.scoutData, this.allianceColor});

  @override
  State<TeleopPage> createState() => _TeleopPageState();
}

class _TeleopPageState extends State<TeleopPage> {
  OverlayEntry? overlayEntry;
  int currentPageIndex = 0;
  int passed = 0,
      speakerMade = 0,
      speakerMiss = 0,
      ampMade = 0,
      ampMiss = 0,
      trap = 0;
  bool scoringEnable = false;
  double currTapX = -1, currTapY = -1;
  bool _tapped1 = false,
      _tapped2 = false,
      _tapped3 = false,
      _tapped4 = false,
      _tapped6 = false,
      _tapped5 = false,
      _tapped7 = false;

  ScoreEvent? currEvent;

  List<ScoreEvent> gameEvents = [];

  @override
  void dispose() {
    // Make sure to remove OverlayEntry when the widget is disposed.
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    passed = widget.scoutData.getNotesPassed;
    speakerMade = widget.scoutData.getTeleopSpeakerMade;
    speakerMiss = widget.scoutData.getTeleopSpeakerMissed;
    ampMade = widget.scoutData.getTeleopAmpMade;
    ampMiss = widget.scoutData.getTeleopAmpMissed;
    trap = widget.scoutData.getTrapsScored;
    gameEvents = widget.scoutData.getTeleopEvents;
  }

  void resetTapped() {
    _tapped1 = false;
    _tapped2 = false;
    _tapped3 = false;
    _tapped4 = false;
    _tapped5 = false;
    _tapped6 = false;
    _tapped7 = false;
  }

  /// Gets the speaker made/miss event from [event]
  /// and will increment if [eventState] = 0 or decrement on
  /// any other case.
  void setZoneMadeMiss(ScoreEvent? event, int eventState) {
    ScoreEvent myEvent = ScoreEvent();
    if (event != null) {
      myEvent = event;
    }
    int zone = myEvent.getZoneNum;

    switch (zone) {
      case 1:
        if (myEvent.getSpeakMade > 0) {
          widget.scoutData.setZone1Made = eventState == 0
              ? widget.scoutData.getZone1Made + myEvent.getSpeakMade
              : widget.scoutData.getZone1Made - myEvent.getSpeakMade;
        } else if (myEvent.getSpeakMiss > 0) {
          widget.scoutData.setZone1Miss = eventState == 0
              ? widget.scoutData.getZone1Miss + myEvent.getSpeakMiss
              : widget.scoutData.getZone1Miss - myEvent.getSpeakMiss;
        }
        break;
      case 2:
        if (myEvent.getSpeakMade > 0) {
          widget.scoutData.setZone2Made = eventState == 0
              ? widget.scoutData.getZone2Made + myEvent.getSpeakMade
              : widget.scoutData.getZone2Made - myEvent.getSpeakMade;
        } else if (myEvent.getSpeakMiss > 0) {
          widget.scoutData.setZone2Miss = eventState == 0
              ? widget.scoutData.getZone2Miss + myEvent.getSpeakMiss
              : widget.scoutData.getZone2Miss - myEvent.getSpeakMiss;
        }
        break;
      case 3:
        if (myEvent.getSpeakMade > 0) {
          widget.scoutData.setZone3Made = eventState == 0
              ? widget.scoutData.getZone3Made + myEvent.getSpeakMade
              : widget.scoutData.getZone3Made - myEvent.getSpeakMade;
        } else if (myEvent.getSpeakMiss > 0) {
          widget.scoutData.setZone3Miss = eventState == 0
              ? widget.scoutData.getZone3Miss + myEvent.getSpeakMiss
              : widget.scoutData.getZone3Miss - myEvent.getSpeakMiss;
        }
        break;
      case 4:
        if (myEvent.getSpeakMade > 0) {
          widget.scoutData.setZone4Made = eventState == 0
              ? widget.scoutData.getZone4Made + myEvent.getSpeakMade
              : widget.scoutData.getZone4Made - myEvent.getSpeakMade;
        } else if (myEvent.getSpeakMiss > 0) {
          widget.scoutData.setZone4Miss = eventState == 0
              ? widget.scoutData.getZone4Miss + myEvent.getSpeakMiss
              : widget.scoutData.getZone4Miss - myEvent.getSpeakMiss;
        }
        break;
      case 5:
        if (myEvent.getSpeakMade > 0) {
          widget.scoutData.setZone5Made = eventState == 0
              ? widget.scoutData.getZone5Made + myEvent.getSpeakMade
              : widget.scoutData.getZone5Made - myEvent.getSpeakMade;
        } else if (myEvent.getSpeakMiss > 0) {
          widget.scoutData.setZone5Miss = eventState == 0
              ? widget.scoutData.getZone5Miss + myEvent.getSpeakMiss
              : widget.scoutData.getZone5Miss - myEvent.getSpeakMiss;
        }
        break;
      case 6:
        if (myEvent.getSpeakMade > 0) {
          widget.scoutData.setZone6Made = eventState == 0
              ? widget.scoutData.getZone6Made + myEvent.getSpeakMade
              : widget.scoutData.getZone6Made - myEvent.getSpeakMade;
        } else if (myEvent.getSpeakMiss > 0) {
          widget.scoutData.setZone6Miss = eventState == 0
              ? widget.scoutData.getZone6Miss + myEvent.getSpeakMiss
              : widget.scoutData.getZone6Miss - myEvent.getSpeakMiss;
        }
        break;
      case 7:
        if (myEvent.getSpeakMade > 0) {
          widget.scoutData.setZone7Made = eventState == 0
              ? widget.scoutData.getZone7Made + myEvent.getSpeakMade
              : widget.scoutData.getZone7Made - myEvent.getSpeakMade;
        } else if (myEvent.getSpeakMiss > 0) {
          widget.scoutData.setZone7Miss = eventState == 0
              ? widget.scoutData.getZone7Miss + myEvent.getSpeakMiss
              : widget.scoutData.getZone7Miss - myEvent.getSpeakMiss;
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const listofpoints =
        '''<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="RedField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="1" title="1" href="" coords="1459,410,1101,608" shape="rect">
    <area target="" alt="5" title="5" href="" coords="487,433,489,853,1305,856" shape="poly">
    <area target="" alt="3" title="3" href="" coords="1103,431,629,88" shape="rect">
    <area target="" alt="6" title="6" href="" coords="345,14,624,429" shape="rect">
    <area target="" alt="2" title="2" href="" coords="1459,611,1630,704,1630,808,1300,802,1300,608" shape="poly">
    <area target="" alt="2" title="2" href="" coords="1297,409,1459,411,1630,309,1632,199,1297,200" shape="poly">
    <area target="" alt="7" title="7" href="" coords="1132,0,1522,197" shape="rect">
    <area target="" alt="8" title="8" href="" coords="3,7,341,1578" shape="rect">
    <area target="" alt="9" title="9" href="" coords="7,10,4,1565,1257,1566,1260,1465,1610,1262,1616,699,1456,614,1450,409,1617,302,1624,5" shape="poly">
</map>''';
    List<ImageMapRegion> htmlDataRedRegions1 = ImageMapRegion.fromHtml(
      widget.allianceColor == "Red"
          ? '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="RedField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="1" title="1" href="" coords="1459,410,1101,608" shape="rect">
</map>
      '''
          : '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="BlueField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="1" title="1" href="" coords="173,409,534,608" shape="rect">
</map>
     ''',
      _tapped1 ? Colors.green.withOpacity(0.5) : Colors.red.withOpacity(0.5),
    );
    List<ImageMapRegion> htmlDataRedRegions2 = ImageMapRegion.fromHtml(
      widget.allianceColor == "Red"
          ? '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="RedField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="2" title="2" href="" coords="1459,611,1630,704,1630,808,1300,802,1300,608" shape="poly">
    <area target="" alt="2" title="2" href="" coords="1297,409,1459,411,1630,309,1632,199,1297,200" shape="poly">
</map>
      '''
          : '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="BlueField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="2" title="2" href="" coords="10,308,172,401,373,402,373,224,11,223" shape="poly">
    <area target="" alt="2" title="2" href="" coords="177,613,12,707,14,803,373,804,373,613" shape="poly">
</map>
''',
      _tapped2 ? Colors.green.withOpacity(0.5) : Colors.red.withOpacity(0.5),
    );
    List<ImageMapRegion> htmlDataRedRegions3 = ImageMapRegion.fromHtml(
      widget.allianceColor == "Red"
          ? '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="RedField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="3" title="3" href="" coords="1103,431,629,88" shape="rect">
</map>
      '''
          : '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="BlueField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="3" title="3" href="" coords="164,4,562,207" shape="rect">
</map>
''',
      _tapped3 ? Colors.green.withOpacity(0.5) : Colors.red.withOpacity(0.5),
    );
    List<ImageMapRegion> htmlDataRedRegions5 = ImageMapRegion.fromHtml(
      widget.allianceColor == "Red"
          ? '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="RedField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="5" title="5" href="" coords="487,433,489,853,1305,856" shape="poly">
</map>
      '''
          : '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="BlueField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="5" title="5" href="" coords="433,814,1148,445,1156,829" shape="poly">
</map>
''',
      _tapped5 ? Colors.green.withOpacity(0.5) : Colors.red.withOpacity(0.5),
    );
    List<ImageMapRegion> htmlDataRedRegions6 = ImageMapRegion.fromHtml(
      widget.allianceColor == "Red"
          ? '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="RedField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="6" title="6" href="" coords="345,14,624,429" shape="rect">
</map>
      '''
          : '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="BlueField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="6" title="6" href="" coords="568,80,1020,428" shape="rect">
</map>
''',
      _tapped6 ? Colors.green.withOpacity(0.5) : Colors.red.withOpacity(0.5),
    );
    List<ImageMapRegion> htmlDataRedRegions7 = ImageMapRegion.fromHtml(
      widget.allianceColor == 'Red'
          ? '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="RedField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="7" title="7" href="" coords="1132,0,1522,197" shape="rect">
</map>
      '''
          : '''
<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="BlueField.png" usemap="#image-map">

<map name="image-map">
    <area target="" alt="7" title="7" href="" coords="1025,10,1274,431" shape="rect">
</map>
      ''',
      _tapped7 ? Colors.green.withOpacity(0.5) : Colors.red.withOpacity(0.5),
    );
    return Column(
      children: [
        const Text(
          "Teleop",
          style: TextStyle(
              fontSize: 40,
              fontFamily: 'Schyler',
              decoration: TextDecoration.underline),
        ),
        const Padding(padding: EdgeInsets.all(20)),
        Row(
          children: [
            const Padding(padding: EdgeInsets.all(20)),
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(width: 5.0)),
                    width: 350,
                    height: 350,
                    child: ImageMap(
                      image: widget.allianceColor == "Red"
                          ? Image.asset('assets/images/RedField.png')
                          : Image.asset('assets/images/BlueField.png'),
                      onTap: (region) {
                        resetTapped();
                        // ignore: avoid_print
                        print('Pressed: ${region.title}');
                        currEvent = ScoreEvent();
                        currEvent?.setZone = int.tryParse(region.title ?? "")!;
                        setState(() {
                          switch (region.title) {
                            case '1':
                              _tapped1 = !_tapped1;
                              break;
                            case '2':
                              _tapped2 = !_tapped2;
                              break;
                            case '3':
                              _tapped3 = !_tapped3;
                              break;
                            case '4':
                              _tapped4 = !_tapped4;
                              break;
                            case '5':
                              _tapped5 = !_tapped5;
                              break;
                            case '6':
                              _tapped6 = !_tapped6;
                              break;
                            case '7':
                              _tapped7 = !_tapped7;
                              break;
                          }
                          scoringEnable = !scoringEnable;
                        });
                      },
                      regions: [
                        ...htmlDataRedRegions1,
                        ...htmlDataRedRegions2,
                        ...htmlDataRedRegions3,
                        ...htmlDataRedRegions5,
                        ...htmlDataRedRegions6,
                        ...htmlDataRedRegions7,
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            const Text("Amp"),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Text("Made"),
                                    SizedBox(
                                      width: 50,
                                      height: 200,
                                      child: SpinBox(
                                        min: 0,
                                        max: 90,
                                        value: ampMade.toDouble(),
                                        direction: Axis.vertical,
                                        spacing: 1,
                                        showButtons: true,
                                        enabled: true,
                                        iconColor: MaterialStateProperty.all(
                                            Colors.green),
                                        onChanged: (value) {
                                          setState(() {
                                            ampMade = value.toInt();
                                          });
                                          widget.scoutData.setTeleopAmpMade =
                                              ampMade;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("Miss"),
                                    SizedBox(
                                      width: 50,
                                      height: 200,
                                      child: SpinBox(
                                        min: 0,
                                        max: 90,
                                        value: ampMiss.toDouble(),
                                        direction: Axis.vertical,
                                        spacing: 1,
                                        showButtons: true,
                                        enabled: true,
                                        iconColor: MaterialStateProperty.all(
                                            Colors.green),
                                        onChanged: (value) {
                                          setState(() {
                                            ampMiss = value.toInt();
                                          });
                                          widget.scoutData.setTeleopAmpMissed =
                                              ampMiss;
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(20)),
                        Column(
                          children: [
                            const Text("Speaker"),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Text("Made"),
                                    SizedBox(
                                      width: 50,
                                      height: 200,
                                      child: SpinBox(
                                        min: 0,
                                        max: 90,
                                        value: speakerMade.toDouble(),
                                        direction: Axis.vertical,
                                        spacing: 1,
                                        showButtons: true,
                                        enabled: scoringEnable,
                                        iconColor: scoringEnable
                                            ? MaterialStateProperty.all(
                                                Colors.green)
                                            : MaterialStateProperty.all(
                                                Colors.red),
                                        onChanged: (value) {
                                          setState(() {
                                            currEvent?.setSpeakMade =
                                                value.toInt();
                                            gameEvents.add(currEvent!);
                                            setZoneMadeMiss(currEvent, 0);
                                            currEvent = null;
                                            scoringEnable = false;
                                            speakerMade = value.toInt();
                                            resetTapped();
                                          });
                                          widget.scoutData
                                                  .setTeleopSpeakerMade =
                                              speakerMade;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("Miss"),
                                    SizedBox(
                                      width: 50,
                                      height: 200,
                                      child: SpinBox(
                                        min: 0,
                                        max: 90,
                                        value: speakerMiss.toDouble(),
                                        direction: Axis.vertical,
                                        spacing: 1,
                                        showButtons: true,
                                        enabled: scoringEnable,
                                        iconColor: scoringEnable
                                            ? MaterialStateProperty.all(
                                                Colors.green)
                                            : MaterialStateProperty.all(
                                                Colors.red),
                                        onChanged: (value) {
                                          setState(() {
                                            currEvent?.setSpeakMiss =
                                                value.toInt();
                                            gameEvents.add(currEvent!);
                                            setZoneMadeMiss(currEvent, 0);
                                            currEvent = null;
                                            scoringEnable = false;
                                            speakerMiss = value.toInt();
                                            resetTapped();
                                          });
                                          widget.scoutData
                                                  .setTeleopSpeakerMissed =
                                              speakerMiss;
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                const Text("Trap"),
                                SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: SpinBox(
                                    min: 0,
                                    max: 90,
                                    value: trap.toDouble(),
                                    direction: Axis.horizontal,
                                    spacing: 1,
                                    showButtons: true,
                                    enabled: true,
                                    iconColor:
                                        MaterialStateProperty.all(Colors.green),
                                    onChanged: (value) {
                                      setState(() {
                                        trap = value.toInt();
                                      });
                                      widget.scoutData.setTrapsScored = trap;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(20)),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Text("Passed"),
                                    SizedBox(
                                      width: 100,
                                      height: 50,
                                      child: SpinBox(
                                        min: 0,
                                        max: 90,
                                        value: passed.toDouble(),
                                        direction: Axis.horizontal,
                                        spacing: 1,
                                        showButtons: true,
                                        enabled: true,
                                        iconColor: MaterialStateProperty.all(
                                            Colors.green),
                                        onChanged: (value) {
                                          setState(() {
                                            passed = value.toInt();
                                          });
                                          widget.scoutData.setNotesPassed =
                                              passed;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(20)),
                Column(
                  children: [
                    const Text("Event List (Tap Event to Delete)"),
                    const Padding(padding: EdgeInsets.all(10)),
                    SingleChildScrollView(
                      child: SizedBox(
                        width: 200,
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: gameEvents.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  ScoreEvent event = gameEvents[index];
                                  if (event.getSpeakMade > 0) {
                                    setState(() {
                                      speakerMade = speakerMade - 1;
                                    });
                                  } else if (event.getSpeakMiss > 0) {
                                    setState(() {
                                      speakerMiss = speakerMiss - 1;
                                    });
                                  }
                                  setZoneMadeMiss(gameEvents[index], 1);
                                  gameEvents.removeAt(index);
                                });
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(gameEvents[index].toString()),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(20))
      ],
    );
  }
}
