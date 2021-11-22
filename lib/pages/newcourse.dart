import 'package:flutter/material.dart';
import 'package:flutter_sqlite/Model/course.dart';
import 'package:flutter_sqlite/dbHelper.dart';

class NewCourse extends StatefulWidget {
  @override
  _NewCourseState createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  String name, content , level;
  int hours , available;
  DbHelper helper;
  double price,rate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper=DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9EFEB),
      appBar: AppBar(
        title: Text('new course'),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Course Name'),
              onChanged: (n){
                setState(() {
                  name=n;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Course Content'),
              maxLines: 10,
              onChanged: (c){
                setState(() {
                  content=c;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Course Hours'),
              onChanged: (h){
                setState(() {
                  hours=int.parse(h);
                });
              },
            ),

            TextFormField(
              decoration: InputDecoration(hintText: 'Level (beginner or intermediate or advanced)'),
              onChanged: (l){
                setState(() {
                  level=l;
                });
              },
            ),
            TextFormField(

              decoration: InputDecoration(hintText: 'Course price',suffixText: '\$'),
              onChanged: (p){
                setState(() {
                  price=double.parse(p);
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Course rate' , suffixText: '0 to 5'),
              onChanged: (r){
                setState(() {
                  rate=double.parse(r);
                });
              },
            ),

            TextFormField(
              decoration: InputDecoration(hintText: 'Remain available'),
              onChanged: (a){
                setState(() {
                  available=int.parse(a);
                });
              },
            ),
            SizedBox(height: 30,),
            RaisedButton(onPressed: () async{

              Course course=Course({'name':name , 'content' : content , 'hours': hours , 'level':level ,  'price' : price , 'rate':rate , 'available':available });
                //'price' : price , 'rate':rate , 'available':available});
              int id= await helper.createcourse(course);
              Navigator.of(context).popAndPushNamed('/');
            },
              child: Text('save'),color: Color(0xFFFD7465),
            )
          ],
        )),
      ),
    );
  }
}
