import 'package:flutter/material.dart';
import 'package:flutter_sqlite/Model/course.dart';
import 'package:flutter_sqlite/dbHelper.dart';
import 'package:flutter_sqlite/pages/updatecourse.dart';
import 'coursedetails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper helper;
  TextEditingController tsearch = TextEditingController();
  var allcourses = [];
  var items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper = DbHelper();
    helper.getcourses().then((courses) {
      setState(() {
        allcourses = courses;
        items = allcourses;
      });
    });
  }

  void filtersearch(String query) {
    var dummysearchlist = allcourses;
    if (query.isNotEmpty) {
      var dummylist = [];
      dummysearchlist.forEach((element) {
        var course = Course.map(element);
        if (course.name.toLowerCase().contains(query.toLowerCase())) {
          dummylist.add(element);
        }
      });
      setState(() {
        items = [];
        items.addAll(dummylist);
      });
      return;
    } else {
      setState(() {
        items = [];
        items.addAll(allcourses);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF9EFEB),
       //appBar: AppBar(
        //   //title: Text('home'),
        //   // actions: [
        //   //   IconButton(
        //   //       icon: Icon(Icons.add),
        //   //       onPressed: () => Navigator.pushNamed(context, '/new'))
        //   // ],
     //  ),
        body: ListView(
          children: [
          Stack(
            children: [
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(75.0)),
                    color: Color(0xFFFD7465)),
              ),
              Container(
                height: 160.0,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(65.0)),
                    color: Color(0xFFFE8A7E)),
              ),

              Padding(
                padding: EdgeInsets.only(top: 75.0, left: 15.0),
                child: Text(
                  'Choose your Course!',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 140.0, left: 15.0, right: 35.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(5.0),
                      topLeft: Radius.circular(5.0),
                    )),

                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      hintText: 'Search for your course',
                      hintStyle:
                      TextStyle(fontFamily: 'Montserrat', fontSize: 14.0),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                    controller: tsearch,
                    onChanged: (value){
                      setState(() {
                        filtersearch(value);
                      });
                    },
                ),
              ),

              ),



            ],
          ),

          Container(child:
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, i) {
                Course course = Course.map(items[i]);
                return Card(
                  child: ListTile(
                    title:
                    Text('${course.name} - ${course.level} level  - ${course.available} student' ),
                    subtitle: Text('${course.content}'),
                    trailing: Column(
                      children: [
                        Expanded(
                          child: IconButton(
                            icon: (Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                              onPressed: () {
                                setState(() {
                                  helper.deletecourse(course.id);
                                });
                              }
                          ),
                        ),
                        Expanded(
                            child: IconButton(
                              icon: (Icon(
                                Icons.edit,
                                color: Colors.blueGrey,
                              )),
                              onPressed: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateCourse(course)));
                              },
                            ))
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CourseDetails(course)));
                    },
                  ),
                );
              })
          ),
        ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/new'),
        elevation: 5,
        child: Icon(Icons.add),
        backgroundColor:Color(0xFFFD7465),
      ),
    );
  }
}
