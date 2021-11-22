class Course {

  int _id;
  String _name;
  String _content;
  int _hours;
  String _level;
  double _price;
  double _rate;
  int _available;

  Course(dynamic obj) {
    _id = obj['id'];
    _name = obj['name'];
    _content = obj['content'];
    _hours = obj['hours'];
    _level = obj['level'];
    _price = obj['price'];
    _rate = obj['rate'];
     _available = obj['available'];
  }

  Course.map(Map<String, dynamic> data){
    _id = data['id'];
    _name = data['name'];
    _content = data['content'];
    _hours = data['hours'];
    _level = data['level'];
    _price = data['price'];
    _rate = data['rate'];
     _available = data['available'];
  }

  Map<String, dynamic> tomap() {
    return {
      'id': _id,
      'name' :_name,
      'content':_content,
      'hours':_hours,
      'level':_level,
      'price':_price,
      'rate':_rate,
      'available':_available,
    };
  }
  int get id=>_id;
  int get hours=>_hours;
  String get name=>_name;
  String get content=>_content;
  String get level=>_level;
  double get price=>_price;
  double get rate=>_rate;
  int get available=>_available;
}