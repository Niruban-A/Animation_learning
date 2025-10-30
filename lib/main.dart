import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home:Imageanimation() ,));
}
class Imageanimation extends StatefulWidget {
  const Imageanimation({super.key});

  @override
  State<Imageanimation> createState() => _ImageanimationState();
}

class _ImageanimationState extends State<Imageanimation> with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState(){
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 5));
    animation= Tween<double>(begin:0 ,end: 300).animate(animationController)
    .. addListener((){
      setState(() {
        //
      });
    }
    );
     animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SizedBox(
          
          height: animation.value,
          width: animation.value,
          child: Image.asset("assets/img.png"),
        ),
      ),
    );
  }
}
