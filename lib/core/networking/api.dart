import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Connect{
  postData(String url,Map<String,dynamic> map)async{
    try{
      var r = await http.post(Uri.parse(url), body: map,);
      if(r.statusCode == 200 || r.statusCode == 401){
        var body = jsonDecode(r.body);
        return body;
      }else{
        print(r.statusCode);
      }
    }catch(e){
      print('error catch $e');
    }
  }
  getData({String? url})async{
    try{
      var r = await http.get(Uri.parse(url!),);
      if(r.statusCode == 200 || r.statusCode == 401){
        var body = jsonDecode(r.body);
        return body;
      }else{
        print(r.statusCode);
      }
    }catch(e){
      print('catch error $e');
    }
  }
  getfile(String uri , Map data, File file)async{
    var r = http.MultipartRequest("POST",Uri.parse(uri));
    var lenght = await file.length();
    var stream = http.ByteStream(file.openRead());
    var img = http.MultipartFile("file",stream,lenght,filename: basename(file.path));
    r.files.add(img);
    r.fields['name'] = data['name'];
    r.fields['location'] = data['location'];
    r.fields['lost_time'] = data['lost_time'];
    r.fields['user_id'] = data['user_id'];
    var myrequest = await r.send();
    var response  = await http.Response.fromStream(myrequest);
    if(myrequest.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      print('error');
    }

  }
  getfile4(String uri , Map data, File file)async{
    var r = http.MultipartRequest("POST",Uri.parse(uri));
    var lenght = await file.length();
    var stream = http.ByteStream(file.openRead());
    var img = http.MultipartFile("file",stream,lenght,filename: basename(file.path));
    r.files.add(img);
    r.fields['name'] = data['name'];
    r.fields['location'] = data['location'];
    r.fields['lost_time'] = data['lost_time'];
    r.fields['user_id'] = data['user_id'];
    r.fields['gender'] = data['gender'];
    var myrequest = await r.send();
    var response  = await http.Response.fromStream(myrequest);
    if(myrequest.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      print('error');
    }

  }
  getfile2(String uri , Map data, File file)async{
    var r = http.MultipartRequest("POST",Uri.parse(uri));
    var lenght = await file.length();
    var stream = http.ByteStream(file.openRead());
    var img = http.MultipartFile("file",stream,lenght,filename: basename(file.path));
    r.files.add(img);
    r.fields['name'] = data['name'];
    r.fields['username'] = data['username'];
    r.fields['password'] = data['password'];
    r.fields['email'] = data['email'];
    r.fields['phone'] = data['phone'];
    r.fields['date'] = data['date'];
    r.fields['country'] = data['country'];
    var myrequest = await r.send();
    var response  = await http.Response.fromStream(myrequest);
    if(myrequest.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      print('error');
    }

  }
  getfile3(String uri , Map data, File file)async{
    var r = http.MultipartRequest("POST",Uri.parse(uri));
    var lenght = await file.length();
    var stream = http.ByteStream(file.openRead());
    var img = http.MultipartFile("file",stream,lenght,filename: basename(file.path));
    r.files.add(img);
    r.fields['name'] = data['name'];
    r.fields['username'] = data['username'];
    r.fields['id'] = data['id'];
    r.fields['email'] = data['email'];
    r.fields['phone'] = data['phone'];
    r.fields['country'] = data['country'];
    var myrequest = await r.send();
    var response  = await http.Response.fromStream(myrequest);
    if(myrequest.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      print('error');
    }

  }



}