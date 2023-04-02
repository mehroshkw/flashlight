import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:torch_controller/torch_controller.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:torch_light/torch_light.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> torchLightOn() async {
    try{
      await TorchLight.enableTorch();
    } on EnableTorchExistentUserException catch(e){
      //camera in use
      print("camera in use");
    } on EnableTorchNotAvailableException catch(e){
      //torch not available
      print("torch not available");
    }  on EnableTorchException catch(e){
      //something went wrong
      print("something went wrong");
    }
  }

  Future<void> torchLightOff() async {
    try{
      await TorchLight.disableTorch();
    } on DisableTorchExistentUserException catch(e){
      //camera in use
      print("camera in use");
    } on DisableTorchNotAvailableException catch(e){
      //torch not available
      print("torch not available");
    }  on DisableTorchException catch(e){
      //something went wrong
      print("something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar"),
      ),
      body: Center(
        child: LiteRollingSwitch(
          colorOff: Colors.red,
          colorOn: Colors.green,
          iconOn: CupertinoIcons.lightbulb_fill,
          iconOff: CupertinoIcons.lightbulb_slash,
          textOff: "Torch Off",
          textOn: "Torch On",
          onChanged: (val){
            print(val);
            if(val){
              torchLightOn();
            }else{
              torchLightOff();
            }
          }, onSwipe: (){}, onTap: (){}, onDoubleTap: (){},
        ),
      ),
    );
  }
}