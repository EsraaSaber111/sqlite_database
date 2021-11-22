import 'package:flutter/material.dart';
import 'package:flutter_sqlite/Model/course.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


class CourseDetails extends StatefulWidget {
  Course course;
  CourseDetails(this.course);
  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {


  //Color fav= Colors.white;
  bool click=false;
  double starcount(double rate){
    if(rate>0 && rate<1 || rate == 1){
       return 1;
    }else if((rate>1 && rate<2 || rate == 2)){
      return 2;
    }
    else if((rate>2 && rate<3 || rate == 3)){
      return 3;
    }
    else if((rate>3 && rate<4 || rate == 4)){
      return 4;
    }
    else if((rate>4 && rate<5 || rate == 5)){}
    else{
      return 0;
    }
  }
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('${course.name}'),
        // ),
        body: Stack(children: <Widget>[
      Container(
          height: screenHeight, width: screenWidth, color: Colors.transparent),
      Container(
          height: 250,
          width: screenWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/courses.jpg'), fit: BoxFit.cover))),
      Positioned(
        top: 200,
        child: Container(
          padding: EdgeInsets.only(left: 20.0),
          height: screenHeight / 3 + 25.0,
          width: screenWidth,
          child: ListView(
            //    crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.0),
              Text('${widget.course.name}',
                  style: GoogleFonts.tinos(
                      fontSize: 25.0, fontWeight: FontWeight.w500)),
              SizedBox(height: 7.0),
              Text('${widget.course.level} - level',
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5E5B54))),
              SizedBox(height: 7.0),

              SizedBox(height: 7.0),
                        Row(
                          children: <Widget>[
                            SmoothStarRating(
                                allowHalfRating: false,
                                starCount: 5,
                                rating: starcount(widget.course.rate),
                                size: 15.0,
                                color: Color(0xFFF36F32),
                                borderColor: Color(0xFFF36F32),
                                spacing:0.0
                            ),
                            SizedBox(width: 3.0),
                            Text('${widget.course.rate}',
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFD57843)
                                )
                            ),
                            SizedBox(width: 3.0),
                            Text('(200 Reviews)',
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFC2C0B6)
                                )
                            )
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Text('${widget.course.content}',
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF201F1C)
                            )
                        ),
              SizedBox(height: 10.0),
                        Container(
                            width: 150.0,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                          '${widget.course.hours}',
                                          style: GoogleFonts.tinos(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w500
                                          )
                                      ),
                                      Text(
                                          'Hours',
                                          style: GoogleFonts.sourceSansPro(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF5E5B54)
                                          )
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          '${widget.course.price} \$',
                                          style: GoogleFonts.tinos(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w500
                                          )
                                      ),
                                      Text(
                                          'Price',
                                          style: GoogleFonts.sourceSansPro(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF5E5B54)
                                          )
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          '${widget.course.available}',
                                          style: GoogleFonts.tinos(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w500
                                          )
                                      ),
                                      Text(
                                          'Available',
                                          style: GoogleFonts.sourceSansPro(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF5E5B54)
                                          )
                                      )
                                    ],
                                  )
                                ]
                            )
                        )
                      ]
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFFFAF6ED),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))
                  ),
                )
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 30.0),
                    child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFA4B2AE)
                        ),
                        child: Center(
                            child: IconButton(icon:Icon(Icons.arrow_back, size: 20.0, color: Colors.white,),
                            onPressed: ()=>Navigator.of(context).pop(),)
                        )
                    )
                )
            ),
                      Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.only(left: 15.0, top:( screenHeight / 3 + 25.0)+20, right: 10),
                    child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFA4B2AE)
                        ),
                        child: Center(
                            child:IconButton(icon:Icon(Icons.favorite, size: 20.0, color: click==false ? Colors.white : Colors.red,),
                              onPressed: (){
                              setState(() {
                                click=!click;
                              });

                              }
                            )
                        )
                    )
                )
            ),

      Align(
        alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(  color: Colors.deepOrange[200],),

        child: RaisedButton(
         // color: Color(0xFFFD7465),
          child: Text('Regist') ,
        ),
      ),),

            ],
          ),
        );

  }
}

