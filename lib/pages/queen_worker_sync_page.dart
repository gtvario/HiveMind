import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:path_provider/path_provider.dart';

class QueenWorkerSyncPage extends StatefulWidget {
  const QueenWorkerSyncPage({super.key});

  @override
  State<QueenWorkerSyncPage> createState() => _QueenWorkerSyncPageState();
}

class _QueenWorkerSyncPageState extends State<QueenWorkerSyncPage> {
  final String userName = Random().nextInt(10000).toString();
  final Strategy strategy = Strategy.P2P_STAR;
  Map<String, ConnectionInfo> endpointMap = {};

  String? tempFileUri; //reference to the file currently being transferred
  Map<int, String> map = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Platform.isAndroid
              ? 'Hivemind | Sync With Workers'
              : Platform.isIOS
                  ? 'iOS Device Info'
                  : '',
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            const Text(
              "Permissions",
            ),
            Wrap(
              children: <Widget>[
                ElevatedButton(
                  child: const Text("checkLocationPermission"),
                  onPressed: () async {
                    if (await Nearby().checkLocationPermission()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Location permissions granted :)")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Location permissions not granted :(")));
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text("askLocationPermission"),
                  onPressed: () async {
                    if (await Nearby().askLocationPermission()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Location Permission granted :)")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Location permissions not granted :(")));
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text("checkExternalStoragePermission"),
                  onPressed: () async {
                    if (await Nearby().checkExternalStoragePermission()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("External Storage permissions granted :)")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "External Storage permissions not granted :(")));
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text("askExternalStoragePermission"),
                  onPressed: () {
                    Nearby().askExternalStoragePermission();
                  },
                ),
                ElevatedButton(
                  child: const Text("checkBluetoothPermission (Android 12+)"),
                  onPressed: () async {
                    if (await Nearby().checkBluetoothPermission()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Bluethooth permissions granted :)")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Bluetooth permissions not granted :(")));
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text("askBluetoothPermission (Android 12+)"),
                  onPressed: () {
                    Nearby().askBluetoothPermission();
                  },
                ),
              ],
            ),
            const Divider(),
            const Text("Location Enabled"),
            Wrap(
              children: <Widget>[
                ElevatedButton(
                  child: const Text("checkLocationEnabled"),
                  onPressed: () async {
                    if (await Nearby().checkLocationEnabled()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Location is ON :)")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Location is OFF :(")));
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text("enableLocationServices"),
                  onPressed: () async {
                    if (await Nearby().enableLocationServices()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Location Service Enabled :)")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Enabling Location Service Failed :(")));
                    }
                  },
                ),
              ],
            ),
            const Divider(),
            Text("User Name: $userName"),
            Wrap(
              children: <Widget>[
                ElevatedButton(
                  child: const Text("Start Discovery"),
                  onPressed: () async {
                    try {
                      bool a = await Nearby().startDiscovery(
                        userName,
                        strategy,
                        onEndpointFound: (id, name, serviceId) {
                          if (name == "Red 3") {
                            // show sheet automatically to request connection
                            showModalBottomSheet(
                              context: context,
                              builder: (builder) {
                                return Center(
                                  child: Column(
                                    children: <Widget>[
                                      Text("id: $id"),
                                      Text("Name: $name"),
                                      Text("ServiceId: $serviceId"),
                                      ElevatedButton(
                                        child: const Text("Request Connection"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Nearby().requestConnection(
                                            userName,
                                            id,
                                            onConnectionInitiated: (id, info) {
                                              onConnectionInit(id, info);
                                            },
                                            onConnectionResult: (id, status) {
                                              showSnackbar(status);
                                            },
                                            onDisconnected: (id) {
                                              setState(() {
                                                endpointMap.remove(id);
                                              });
                                              showSnackbar(
                                                  "Disconnected from: ${endpointMap[id]!.endpointName}, id $id");
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                        onEndpointLost: (id) {
                          showSnackbar(
                              "Lost discovered Endpoint: ${endpointMap[id]!.endpointName}, id $id");
                        },
                      );
                      showSnackbar("DISCOVERING: $a");
                    } catch (e) {
                      showSnackbar(e);
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text("Stop Discovery"),
                  onPressed: () async {
                    await Nearby().stopDiscovery();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showSnackbar(dynamic a) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(a.toString()),
    ));
  }

  /// Called upon Connection request (on both devices)
  /// Both need to accept connection to start sending/receiving
  void onConnectionInit(String id, ConnectionInfo info) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Center(
          child: Column(
            children: <Widget>[
              Text("id: $id"),
              Text("Token: ${info.authenticationToken}"),
              Text("Name${info.endpointName}"),
              Text("Incoming: ${info.isIncomingConnection}"),
              ElevatedButton(
                child: const Text("Accept Connection"),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    endpointMap[id] = info;
                  });
                  Nearby().acceptConnection(
                    id,
                    onPayLoadRecieved: (endid, payload) async {
                      if (payload.type == PayloadType.BYTES) {
                        String str = String.fromCharCodes(payload.bytes!);
                        showSnackbar("$endid: $str");

                        if (str.contains(':')) {
                          // used for file payload as file payload is mapped as
                          // payloadId:filename
                          int payloadId = int.parse(str.split(':')[0]);
                          String fileName = (str.split(':')[1]);

                          if (map.containsKey(payloadId)) {
                            if (tempFileUri != null) {
                              moveFile(tempFileUri!, fileName);
                            } else {
                              showSnackbar("File doesn't exist");
                            }
                          } else {
                            //add to map if not already
                            map[payloadId] = fileName;
                          }
                        }
                      } else if (payload.type == PayloadType.FILE) {
                        showSnackbar("$endid: File transfer started");
                        tempFileUri = payload.uri;
                      }
                    },
                    onPayloadTransferUpdate: (endid, payloadTransferUpdate) {
                      if (payloadTransferUpdate.status ==
                          PayloadStatus.IN_PROGRESS) {
                        print(payloadTransferUpdate.bytesTransferred);
                      } else if (payloadTransferUpdate.status ==
                          PayloadStatus.FAILURE) {
                        print("failed");
                        showSnackbar("$endid: FAILED to transfer file");
                      } else if (payloadTransferUpdate.status ==
                          PayloadStatus.SUCCESS) {
                        showSnackbar(
                            "$endid success, total bytes = ${payloadTransferUpdate.totalBytes}");

                        if (map.containsKey(payloadTransferUpdate.id)) {
                          //rename the file now
                          String name = map[payloadTransferUpdate.id]!;
                          moveFile(tempFileUri!, name);
                        } else {
                          //bytes not received till yet
                          map[payloadTransferUpdate.id] = "";
                        }
                      }
                    },
                  );
                },
              ),
              ElevatedButton(
                child: const Text("Reject Connection"),
                onPressed: () async {
                  Navigator.pop(context);
                  try {
                    await Nearby().rejectConnection(id);
                  } catch (e) {
                    showSnackbar(e);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> moveFile(String uri, String fileName) async {
    String parentDir = (await getExternalStorageDirectory())!.absolute.path;
    final b =
        await Nearby().copyFileAndDeleteOriginal(uri, '$parentDir/$fileName');

    showSnackbar("Moved file:$b");
    return b;
  }
}
