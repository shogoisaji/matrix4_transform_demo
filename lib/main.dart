import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MatrixTransformDemo(),
    );
  }
}

class MatrixTransformDemo extends StatefulWidget {
  const MatrixTransformDemo({super.key});

  @override
  MatrixTransformDemoState createState() => MatrixTransformDemoState();
}

class MatrixTransformDemoState extends State<MatrixTransformDemo> {
  double translateX = 0.0;
  double translateY = 0.0;
  double translateZ = 0.0;
  double scaleX = 1.0;
  double scaleY = 1.0;
  double scaleZ = 1.0;
  double rotateX = 0.0;
  double rotateY = 0.0;
  double rotateZ = 0.0;

  void reset() {
    setState(() {
      translateX = 0.0;
      translateY = 0.0;
      translateZ = 0.0;
      scaleX = 1.0;
      scaleY = 1.0;
      scaleZ = 1.0;
      rotateX = 0.0;
      rotateY = 0.0;
      rotateZ = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var matrix = Matrix4.identity()
      ..translate(translateX * 100, translateY * 100, translateZ * 100)
      ..scale(scaleX, scaleY, scaleZ)
      ..rotateX(rotateX * math.pi)
      ..rotateY(rotateY * math.pi)
      ..rotateZ(rotateZ * math.pi);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrix4 Transform Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 300,
                  child: Align(
                    child: Transform(
                      transform: matrix,
                      alignment: Alignment.center,
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'Transform\nObject',
                            style: TextStyle(fontSize: 32.0, color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          '''Matrix4.identity()
 ..translate(${translateX.toStringAsFixed(2)} * 100,  ${translateY.toStringAsFixed(2)} * 100,  ${translateZ.toStringAsFixed(2)} * 100)
 ..scale(${scaleX.toStringAsFixed(2)},  ${scaleY.toStringAsFixed(2)},  ${scaleZ.toStringAsFixed(2)})
 ..rotateX(${(rotateX * math.pi).toStringAsFixed(2)})
 ..rotateY(${(rotateY * math.pi).toStringAsFixed(2)})
 ..rotateZ(${(rotateZ * math.pi).toStringAsFixed(2)})''',
                        )),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: reset,
              child: const Text('Reset'),
            ),
            const SizedBox(height: 32.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      _buildSlider('Translate X', translateX, (val) => setState(() => translateX = val)),
                      _buildSlider('Translate Y', translateY, (val) => setState(() => translateY = val)),
                      _buildSlider('Translate Z', translateZ, (val) => setState(() => translateZ = val)),
                    ],
                  ),
                  Column(
                    children: [
                      _buildSlider('Scale X', scaleX, (val) => setState(() => scaleX = val)),
                      _buildSlider('Scale Y', scaleY, (val) => setState(() => scaleY = val)),
                      _buildSlider('Scale Z', scaleZ, (val) => setState(() => scaleZ = val)),
                    ],
                  ),
                  Column(
                    children: [
                      _buildSlider('Rotate X', rotateX, (val) => setState(() => rotateX = val)),
                      _buildSlider('Rotate Y', rotateY, (val) => setState(() => rotateY = val)),
                      _buildSlider('Rotate Z', rotateZ, (val) => setState(() => rotateZ = val)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(String label, double value, Function(double) onChanged) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: Column(
          children: <Widget>[
            Text(label),
            Slider(
              min: -1.0,
              max: 1.0,
              divisions: 100,
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
