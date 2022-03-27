import 'dart:async';
import 'package:flutter/material.dart';
import 'package:final_620710726/models/animal_result.dart';
import 'package:final_620710726/services/api.dart';
class animals extends StatefulWidget {
  const animals({Key? key}) : super(key: key);

  @override
  _animalsState createState() => _animalsState();
}

class _animalsState extends State<animals> {
  List<animalResult>? _aniList ;
  var l = true;
  var ind = 0;
  var check = "";
  var w = 0;
  @override
  void initState() {
    super.initState();
    _fetchAnimal();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: l? islo(): ind<_aniList!.length-1? quizzespage():newpage()
    );
  }
  Widget islo(){
    return const Center(child: CircularProgressIndicator());
  }
  Widget quizzespage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(_aniList![ind].image_url,fit: BoxFit.cover,),
        Column(
          children: [
            for(int i=0;i<_aniList![ind].choices_list.length;i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              if(_aniList![ind].choices_list[i]==_aniList![ind].answer)
                                check="ถูก";
                              else
                                check="ผิด";
                            });
                            Timer(Duration(seconds: 2),(){
                              setState(() {
                                if(check=="ถูก")
                                  ind++;
                                else
                                  w++;
                                check="";
                              });
                            });
                          },
                          child:Text(_aniList![ind].choices_list[i])),
                    )
                  ],
                ),
              ),
          ],
        ),
        if(check.length==0)
          SizedBox(height: 30,width: 1,),
        if(check.length!=0)
          Text(check)
      ],);
  }
  void _fetchAnimal() async {
    List list = await Api().fetch('quizzes');
    setState(() {
      _aniList = list.map((item) => animalResult.fromJson(item)).toList();
      l = false;
    });
  }
  Widget newpage()
  {
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("จบเกม"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("ผิด ${w} ครั้ง"),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              ind = 0;
              check = "";
              w = 0;
              l = true;
              _aniList = null;
              _fetchAnimal();
            });
          }, child: Text("เอาใหม่"))
        ],
      ),);
  }
}
