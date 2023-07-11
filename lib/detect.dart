// Developer name - ( H. Thiwanki Dias Hettiarachchi, UoW id - w1790191) 
// flutter detection page  
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w1790191_frontend/guide.dart';
import 'dart:convert';
import 'custom_search.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // * We neen to change IP address (e.g. 192.168.130.217)according to the connected network's ipv4 address because the api is not yet deploy to production.
    // * Also we should need to make sure both the mobile and the api running laptop are using the same network connection 
  final String predictDefectsUrlString= 'http://192.168.69.217:5000/predict_defects'; 
  final String predictRisksUrlString= 'http://192.168.69.217:5000/predict_risks'; 
  final String predictOverallRiskUrlString= 'http://192.168.69.217:5000/predict_overall_risk';
  String? _imageString;
  String? _predictedImageDefect;
  String? _predictedImageRisk;
  String? _predictedOverallRisk;
  File? imageURI;
  bool _loading = false;
  Future<void> predictImage() async {   //asynchronous method to send POST requests to the flask API
    setState(() {
      _loading = true;
    });
    if (_imageString == null) {
      return;
    }
    final request = http.MultipartRequest(
        'POST', Uri.parse(predictDefectsUrlString));
    final requestRisk = http.MultipartRequest(
        'POST', Uri.parse(predictRisksUrlString));
    final OverallRiskrequest = http.MultipartRequest(
      'POST',
      Uri.parse(predictOverallRiskUrlString),
    );
    request.files.add( // added the http.multipartFile object as part of http.MultpartRequest object before send it to api 
      http.MultipartFile.fromBytes( //create the new http.Multipart file object which contains the binary data of the file we are going to send 
        'file',
        base64Decode(_imageString!),
        filename: 'image.jpg',
      ),
    );
    requestRisk.files.add(http.MultipartFile.fromBytes(
        'file', base64Decode(_imageString!),
        filename: 'image1.jpg'));

    OverallRiskrequest.files.add(
      http.MultipartFile.fromBytes(
        'file',
        base64Decode(_imageString!),
        filename: 'image.jpg',
      ),
    );

    final response = await request.send();
    final responseRisk = await requestRisk.send();
    final overallRiskResponse = await OverallRiskrequest.send();

    //check weather response states codes of the requests are success 
    if (response.statusCode == 200 && responseRisk.statusCode == 200 && overallRiskResponse.statusCode==200) {
      final jsonResponse = await overallRiskResponse.stream.bytesToString();
      final decodedResponse = json.decode(jsonResponse);
      final bytes = await response.stream.toBytes();
      final bytesRisk = await responseRisk.stream.toBytes();

      setState(() {
        _predictedOverallRisk = decodedResponse["risk_level"];
        _predictedImageDefect = base64Encode(bytes); 
        _predictedImageRisk = base64Encode(bytesRisk);
        _loading = false; // after prediction is over loading should over 
      });
      print('$_predictedOverallRisk');
    }
  }

//function to allow the user to take pictures from camera 
  Future _getImageFromCam() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
      File imgFile = File(image!.path); //convert the XFile to file
      setState(() {
        imageURI = imgFile;
        _predictedImageDefect = null;
        _predictedImageRisk = null;
        _predictedOverallRisk = null;
      });
      if (imgFile != null) {
        final bytes = await imgFile.readAsBytes();
        setState(() {
          _imageString = base64Encode(bytes);
        });
      }
    } catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }
//function to allow the user to upload image from gallery 
  Future _getImageFromGallery() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      File imgFile = File(image!.path); //convert the XFile to file
      setState(() {
        imageURI = imgFile;
        _predictedImageDefect = null;
        _predictedImageRisk = null;
        _predictedOverallRisk = null;
      });
      if (imgFile != null) {
        final bytes = await imgFile.readAsBytes();
        setState(() {
          _imageString = base64Encode(bytes);
        });
      }
    } catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }

  void _clearImage() {
    setState(() {
      imageURI = null;
      _predictedOverallRisk = null;
      _predictedImageDefect = null;
      _predictedImageRisk = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TYRE-DDR"),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomSearch());
          }, icon: const Icon(Icons.search))
        ],
      ),
      backgroundColor: Color(0xFF629CD1),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(children: <Widget>[ 
            Align
            (
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 15, 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Guide()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "GUIDE",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Image(
                        image: AssetImage(
                          'assets/GUIDE.png',
                        ),
                        width: 34,
                        height: 41,
                      )
                    ],
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            imageURI == null
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3),
                    ),
                    child: Center(
                        child: Opacity(
                            opacity: 0.1,
                            child: Image.asset(
                              'assets/empty_image_icon.png',
                              height: 60,
                              width: 71,
                              fit: BoxFit.cover,
                            ))),
                    height: 400,
                    width: 300,
                  )
                : Container(
                    decoration: BoxDecoration(border: Border.all(width: 3)),
                    child: Image.file(
                      imageURI!,
                      width: 300,
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                  ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => _myDialog(context),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                        child: Text(
                          "SELECT IMAGE",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      // TextButton(onPressed: _getImageFromCam, child: Text("choose from camera "),),
                      //TextButton(onPressed: _getImageFromGallery, child: Text("choose from gallery"),),
                    ),
                  ),
                  const Text("    "),
                  Expanded(
                    child: TextButton(
                      onPressed: _clearImage,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                        child: Text(
                          "CLEAR",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      // TextButton(onPressed: _getImageFromCam, child: Text("choose from camera "),),
                      //TextButton(onPressed: _getImageFromGallery, child: Text("choose from gallery"),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (imageURI != null){
                          predictImage();
                          setState(() {
                            _loading = true;
                          });
                        }else{
                         Fluttertoast.showToast(msg: "Please select the image ");
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                        child: Text(
                          "DETECT",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ],
              ),
            ),
            Stack(children: [
              _predictedImageDefect != null
                  ? InteractiveViewer(
                    child: Container(
                        decoration: BoxDecoration(border: Border.all(width: 3)),
                        child: Image.memory(
                          base64Decode(_predictedImageDefect!),
                          width: 300,
                          height: 400,
                          fit: BoxFit.contain,
                        ),
                      ),
                  )
                  : Text(""),
            ]),
            SizedBox(
              height: 20,
            ),
            Stack(children: [
              _predictedImageRisk != null
                  ? InteractiveViewer(
                    child: Container(
                        decoration: BoxDecoration(border: Border.all(width: 3)),
                        child: Image.memory(
                          base64Decode(_predictedImageRisk!),
                          width: 300,
                          height: 400,
                          fit: BoxFit.contain,
                        ),
                      ),
                  )
                  : Text(" "),
              if (_loading)
                CircularProgressIndicator(
                  color: Colors.black,
                ) //if the image is loading
            ]),
            _predictedOverallRisk != null
                ? Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "Overall risk of this tyre :  $_predictedOverallRisk ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "Inter"),
                    ),
                  )
                : Text(" "),
            SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }

  Future<void> _myDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                  onPressed: _getImageFromGallery,
                  child: const Text(
                    "Gallery",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  style: TextButton.styleFrom(
                      side: BorderSide(width: 2),
                      backgroundColor: Colors.yellow),
                ),
                Text("             "),
                TextButton(
                  onPressed: _getImageFromCam,
                  child: const Text(
                    "Camera",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  style: TextButton.styleFrom(
                      side: BorderSide(width: 2),
                      backgroundColor: Colors.yellow),
                ),
              ]),
            )
          ],
        );
      },
    );
  }
}
