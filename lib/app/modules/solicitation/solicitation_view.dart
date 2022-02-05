import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

import 'solicitation_controller.dart';

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);
const kTileHeight = 50.0;

final process = [
  'Aberto',
  'Pago',
  'Nota',
  'Enviado',
  'Entregue',
];

final List<IconData> icons = [
  Icons.shopping_cart_rounded,
  Icons.payment_rounded,
  Icons.article_rounded,
  Icons.local_shipping_rounded,
  Icons.check_rounded,
];

class SolicitationView extends GetView<SolicitationController> {
  final int _processIndex = 3;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  IconData getIcon(int index) {
    return icons[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pedidos'),
        backgroundColor: Colors.green[300],
        elevation: 1,
        actions: [
          GestureDetector(
            onTap: () async {
              if (await canLaunch('https://pub.dev/')) {
                await launch('https://pub.dev/');
              } else {
                throw 'Could not launch';
              }
            },
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.chat_rounded,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        primary: false,
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        children: List.generate(2, (i) {
          return Container(
            child: Card(
              elevation: 1,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "#9355929120",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Entrega: 12/12/2020",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 135,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 0, right: 8, left: 8),
                        child: Timeline.tileBuilder(
                          theme: TimelineThemeData(
                            direction: Axis.horizontal,
                            connectorTheme: ConnectorThemeData(
                              space: 30.0,
                              thickness: 5.0,
                            ),
                          ),
                          builder: TimelineTileBuilder.connected(
                            connectionDirection: ConnectionDirection.before,
                            itemExtentBuilder: (_, i) => Get.width / 6,
                            oppositeContentsBuilder: (_, i) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15.0),
                                child: Icon(
                                  getIcon(i),
                                  color: getColor(i),
                                ),
                              );
                            },
                            contentsBuilder: (_, i) {
                              return Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Text(
                                  process[i],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: getColor(i),
                                  ),
                                ),
                              );
                            },
                            indicatorBuilder: (_, i) {
                              if (i == _processIndex) {
                                var color = inProgressColor;
                                var child = Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: 20.0,
                                );

                                return DotIndicator(
                                  size: 30.0,
                                  color: color,
                                  child: child,
                                );
                              } else if (i < _processIndex) {
                                const color = completeColor;
                                const child = Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15.0,
                                );

                                return DotIndicator(
                                  size: 30.0,
                                  color: color,
                                  child: child,
                                );
                              } else {
                                const color = todoColor;

                                return DotIndicator(
                                  size: 30.0,
                                  color: color,
                                );
                              }
                            },
                            connectorBuilder: (_, index, type) {
                              if (index > 0) {
                                if (index == _processIndex) {
                                  final prevColor = getColor(index - 1);
                                  final color = getColor(index);
                                  List<Color> gradientColors;
                                  if (type == ConnectorType.start) {
                                    gradientColors = [Color.lerp(prevColor, color, 0.5), color];
                                  } else {
                                    gradientColors = [prevColor, Color.lerp(prevColor, color, 0.5)];
                                  }

                                  return DecoratedLineConnector(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: gradientColors,
                                      ),
                                    ),
                                  );
                                } else {
                                  return SolidLineConnector(
                                    color: getColor(index),
                                  );
                                }
                              } else {
                                return null;
                              }
                            },
                            itemCount: process.length,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
