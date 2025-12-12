import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/azkarModel.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'dart:math' as math;

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int _counter = 0;
  int _dhikrIndex = 0;
  double _rotationAngle = 0.0;

  void _onSebhaTap() {
    setState(() {
      const step = (2 * math.pi) / 33;
      _rotationAngle = _rotationAngle + step;

      if (_counter < 32) {
        _counter = _counter + 1;
        return;
      }

      _counter = 0;

      if (_dhikrIndex >= azkarList.length - 1) {
        _dhikrIndex = 0;
      } else {
        _dhikrIndex = _dhikrIndex + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsManager.sebhaBackground,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.6),
          body: Center(
            child: Column(
              children: [
                SafeArea(
                  child: Image.asset(
                    AssetsManager.islamiLogo,
                    height: 80,
                  ),
                ),
                SizedBox(height: 60),
                Text(
                  azkarList[_dhikrIndex].mainText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: ColorManager.whiteColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: _onSebhaTap,
                  child: SizedBox(
                    height: 500,
                    width: 480,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 0,
                          child: Image.asset(
                            AssetsManager.sebhaHead,
                            height: 70,
                            width: 70,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          child: AnimatedRotation(
                            duration: Duration(milliseconds: 100),
                            turns: _rotationAngle / (2 * math.pi),
                            alignment: Alignment.center,
                            child: Image.asset(
                              AssetsManager.sebhaBody,
                              height: 450,
                              width: 350,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          child: Text(
                            azkarList[_dhikrIndex].tasbeehText,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: ColorManager.whiteColor,
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 250,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '$_counter',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: ColorManager.whiteColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
