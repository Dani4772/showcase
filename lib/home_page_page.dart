import 'package:flutter/material.dart';
import 'package:showcase/setting_page.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key1 = GlobalKey();
  final _key2 = GlobalKey();
  final _key3 = GlobalKey();


  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 400), (){
        ShowCaseWidget.of(context)!.startShowCase([_key1]);
      });
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
        title: const Text('Water Tracker'),
        leading:
            IconButton(onPressed: () {
              setState(() {
                ShowCaseWidget.of(context)!.startShowCase([_key1,_key2,_key3]);
              });
            }, icon: const Icon(Icons.help_rounded)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
              icon: Showcase(
                  key: _key1,
                  description: 'Change your water intake goal settings',
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: Colors.indigo,
                  onTargetClick: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Settings(),
                    ),
                    ).then((_){
                      setState(() {
                        ShowCaseWidget.of(context)!.startShowCase([_key2,_key3]);
                      });
                    });
                  },
                  disposeOnTap: false,
                  descTextStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: const Icon(Icons.settings))),
        ],
      ),
      floatingActionButton: Showcase.withWidget(
        key: _key3,
        height: 50,
        width: 50,
        container: Icon(Icons.local_drink,size: 50,color: Colors.blue[200]),
        shapeBorder: const CircleBorder(),
        overlayPadding: const EdgeInsets.all(8),

        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.indigo[900],
          child: const Icon(Icons.add),
        ),
      ),
      body: Showcase(
        key: _key2,
        title: 'Total & Goal Water Intake',
        description: 'Track your total and goal water intake',
        showArrow: false,
        overlayPadding: const EdgeInsets.all(8),
        textColor: Colors.white,
        showcaseBackgroundColor: Colors.indigo,
        child: Container(
          color: Colors.indigo,
          height: 300,
          width: double.infinity,
        ),
      ),
    );
  }
}
