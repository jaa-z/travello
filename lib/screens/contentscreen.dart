// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travello/screens/homescreen.dart';

class ContentScreen extends StatefulWidget {
   var value;
   String selectedStateCode;
   String selectedDistrict;
   List<dynamic> selectedspots;
   ContentScreen({Key key, this.value,this.selectedStateCode,this.selectedDistrict,this.selectedspots}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

            //Navigator.popUntil(context, ModalRoute.withName('/'));

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title:  Text("Travello", style: GoogleFonts.ubuntu(fontSize: 22,color: Colors.white) ,),
        backgroundColor: Colors.redAccent,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .where("country", isEqualTo: widget.value)
              .where("state", isEqualTo: widget.selectedStateCode)
              .where("district", isEqualTo: widget.selectedDistrict)
              .where("spot", isEqualTo: widget.selectedspots)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
    else {
              if (snapshot.data.docs.isEmpty) {
                return Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "No spots found",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                    ),
                    softWrap: true,
                  ),
                );
              }
            else{

    const SizedBox(height: 30);
            return ListView(
              shrinkWrap: true,
              children: snapshot.data.docs.map((document) {
                return
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => UploadPage()),
                      //   );
                    },

                      //height: MediaQuery.of(context).size.width * 0.5,
                      //margin: const EdgeInsets.all(15.0),
                      //padding: const EdgeInsets.all(3.0),
                      // decoration:
                      //     BoxDecoration(border: Border.all(color: primary)),




                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 30, 0, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                              Text(
                               document['spotname'],style: GoogleFonts.flamenco(
                                fontSize: 35,

                                color: Colors.black,
                              ),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 13.0),
                                      child: Image.network(
                                        document['url'],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 30, 0, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    document['shortdescription'],style: GoogleFonts.flamenco(
                                    fontSize: 35,

                                    color: Colors.black,
                                  ),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 13.0),
                                      child: Image.network(
                                        document['url1'],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 13.0),
                                      child: Text(
                                        document['description'],style: GoogleFonts.flamenco(
                                        fontSize: 35,


                                        color: Colors.black,
                                      ),),
                                    ),
                                  ),

                                ],
                              ),
                            ),


                      ],

                        ),


                  ),
                );
              }).toList(),
            );}
          }}),
    );
  }
}
