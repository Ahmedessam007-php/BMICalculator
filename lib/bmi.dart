import 'package:flutter/material.dart';
class bmi extends StatefulWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  int currentindex=0;
  TextEditingController heightcontroler= TextEditingController();
  TextEditingController weightcontroler = TextEditingController();
  double height=0;
  double weight =0;
  String result ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Calculator",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(

                children: [
                  radiobutton("Male", Colors.blue, 0),
                radiobutton("Female", Colors.pink, 1)
                ],
              ),
              SizedBox(height: 20,),
              Text("Your height in Cm:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.number,
                controller: heightcontroler,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 20,),
              Text("Your weight in Kg:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.number,
                controller: weightcontroler,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 20,),
              Container(

                width: double.infinity,
                color: Colors.blue,
                child: FlatButton(onPressed: (){
                 setState(() {
                   height=double.parse(heightcontroler.value.text);
                   weight=double.parse(weightcontroler.value.text);
                 });
                  calculate(height, weight);
                },
                    height: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Text("Calculate",
                  style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15,color: Colors.white),)),
              ),
              SizedBox(height: 10,),
              Text("Your BMI is :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("$result",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
  void calculate(double height, double weight)
  {
    double finalresult= weight/(height*height/1000);
    String bmiresult = finalresult.toStringAsFixed(2);
    setState(() {
      result=bmiresult;
    });

  }
  void changeindex(index)
  {
    setState(() {
      currentindex=index;
    });
  }
  Widget radiobutton( String gender , Color color, index)
  {
    return Expanded(child:
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,


          child:MaterialButton(onPressed: (){
            changeindex(index);
          },

              child: Text(gender ,
            style:TextStyle(color: currentindex==index? Colors.white:color ),),
            color: currentindex==index? color:Colors.grey,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

          ),

        )
    );
  }
}
