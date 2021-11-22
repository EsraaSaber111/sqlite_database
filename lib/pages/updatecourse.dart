import 'package:flutter/material.dart';
import 'package:flutter_sqlite/Model/course.dart';
import 'package:flutter_sqlite/dbHelper.dart';

class UpdateCourse extends StatefulWidget {
  Course course;
  UpdateCourse(this.course);

  @override
  _UpdateCourseState createState() => _UpdateCourseState();
}

class _UpdateCourseState extends State<UpdateCourse> {
  //create controllers
  TextEditingController teName = TextEditingController();
  TextEditingController teContent = TextEditingController();
  TextEditingController teHours = TextEditingController();
  TextEditingController teAvailable = TextEditingController();
  TextEditingController teprice = TextEditingController();
  TextEditingController teRate = TextEditingController();
  TextEditingController teLevel = TextEditingController();
  DbHelper helper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper = DbHelper();
    teName.text = widget.course.name;
    teContent.text = widget.course.content;
    teHours.text = widget.course.hours.toString();
    teAvailable.text = widget.course.available.toString();
    teLevel.text = widget.course.level;
    teRate.text = widget.course.rate.toString();
    teprice.text = widget.course.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update ${widget.course.name} course'),
      ),
      body: Card(
        child: ListView(
          children: [
            TextField(
              controller: teName,
            ),
            SizedBox(height: 30,),
            TextField(
              maxLines: null,
              controller: teContent,
            ),
            SizedBox(height: 30,),
            TextField(
              controller: teHours,
            ),

            SizedBox(height: 30,),

            TextField(
              controller: teLevel,
            ),
            SizedBox(height: 30,),
            TextField(
              controller: teprice,
            ),
            SizedBox(height: 30,),
            TextField(
              controller: teRate,
            ),
            TextField(
              controller: teAvailable,
            ),
            SizedBox(height: 30,),
            RaisedButton(
              child: Text('save'),
              onPressed: () {
                var updatedCourse = Course({
                  'id': widget.course.id,
                  'name': teName.text,
                  'content': teContent.text,
                  'hours': int.parse(teHours.text),
                  'level': teLevel.text,
                  'price': double.parse(teprice.text),
                  'rate': double.parse(teRate.text),
                  'available': int.parse(teAvailable.text),
                });
                
                helper.updatecourse(updatedCourse);
                Navigator.of(context).popAndPushNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
