import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Imageanimation()));
}

class ReusableAnimation extends AnimatedWidget {
  const ReusableAnimation({super.key, required Animation<double> animation})
    : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: SizedBox(
        height: animation.value,
        width: animation.value,
        child: Image.asset("assets/img.png"),
      ),
    );
  }
}

class Imageanimation extends StatefulWidget {
  const Imageanimation({super.key});

  @override
  State<Imageanimation> createState() => _ImageanimationState();
}

class _ImageanimationState extends State<Imageanimation>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animation = Tween<double>(begin: 0, end: 300).animate(animationController)
      ..addStatusListener((status) {
        if (status==AnimationStatus.completed) {
          animationController.reverse();
        } else if(status==AnimationStatus.dismissed) {
          animationController.forward();
        }
      })
      ..addStatusListener((status) {
        print(status);
      },);
      animationController.forward();
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReusableAnimation(animation: animation as Animation<double>),
    );
  }
}
