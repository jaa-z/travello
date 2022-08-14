 // @dart=2.9
import 'package:flutter/material.dart';
import 'package:travello/constants/resources.dart';
import 'package:country_picker/country_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travello/screens/contentscreen.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  final _formKey = GlobalKey<FormState>();

  bool countrySelected = false;
  bool stateSelected = false;
  Country _selectedCountry;
  List selectedspots;


  String selectedDistrict, selectedStateCode;

  @override
  void initState() {


    super.initState();
    countrySelected = false;
    stateSelected = false;
    selectedspots = ["Beaches"];
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("Travello", style: GoogleFonts.ubuntu(fontSize: 22,color: Colors.white) ,),
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18, top: 20),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("     Travello Welcomes You!!!",style: GoogleFonts.ubuntu(
                      fontSize: 25,color: Colors.black
                    ),),
                    const SizedBox(height: 30),
                    Text("SELECT YOUR PREFERENCES",textAlign: TextAlign.left,style: GoogleFonts.ubuntu(
                        fontSize: 15,color: Colors.black
                    ),),
                  ],
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Country',style: GoogleFonts.ubuntu(fontSize: 15,color: Colors.black) ,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        //width: 20,
                        decoration: BoxDecoration(
                          // color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4.0),
                          ), //B
                        ),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                              countryListTheme: CountryListThemeData(

                                  textStyle: GoogleFonts.ubuntu(
                                    color: Colors.black,
                                  ),
                                  inputDecoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      focusColor: Colors.redAccent,
                                      border: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.redAccent)))),
                              context: context,
                              showPhoneCode: false,
                              // optional. Shows phone code before the country name.
                              onSelect: (Country c) {
                                //print('Select country: ${country.displayName}');
                                setState(() {
                                  countrySelected = true;

                                  _selectedCountry = c;

                                  selectedStateCode = 'KL';

                                });
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Text(
                              countrySelected ? _selectedCountry.name : "",
                              style: GoogleFonts.ubuntu(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (countrySelected &&
                          _selectedCountry.countryCode == "IN")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              'State',
                              style: GoogleFonts.ubuntu(
                                color: Colors.black
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  dropdownColor: Colors.white,
                                  elevation: 0,
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.black
                                  ),
                                  value: indianStates[selectedStateCode],
                                  onChanged: (newValue) {
                                    setState(() {
                                      stateSelected = true;
                                      selectedStateCode = newValue.toString();
                                      selectedStateCode = indianStates.keys
                                          .firstWhere(
                                              (k) =>
                                          indianStates[k] ==
                                              newValue.toString(),
                                          orElse: () => null);
                                      selectedDistrict =
                                          indianDistricts[selectedStateCode]
                                              ?.first
                                              .toString();
                                     });
                                  },
                                  items: indianStates.values.map((stt) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        stt,
                                        style: GoogleFonts.ubuntu(
                                          color: Colors.black,
                                        ),
                                      ),
                                      value: stt,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'District',
                              style: GoogleFonts.ubuntu(
                                color:Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  dropdownColor: Colors.white,
                                  elevation: 0,
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.black,
                                  ),
                                  value: selectedDistrict,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedDistrict = newValue.toString();
                                    });
                                  },
                                  items: indianDistricts[selectedStateCode]?.map((distri) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        distri,
                                        style: GoogleFonts.ubuntu(
                                          color: Colors.black,
                                        ),
                                      ),
                                      value: distri,
                                    );
                                  })?.toList() ?? [],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Select your favourite spots',
                              style: GoogleFonts.ubuntu(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4.0),
                                ),
                              ),
                              child: MultiSelectDialogField(
                                backgroundColor: Colors.white,
                                checkColor: Colors.white,
                                selectedColor: Colors.black,
                                unselectedColor: Colors.black,
                                selectedItemsTextStyle: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                ),
                                itemsTextStyle: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                ),
                                title: Text(
                                  "Select your favourite Spots",
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.black,
                                  ),
                                ),
                                buttonText: Text("Select Spots",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.black

                                    )),
                                items: spots
                                    .map((l) => MultiSelectItem<String>(l, l))
                                    .toList(),
                                initialValue: selectedspots,
                                onConfirm: (val) {
                                  setState(() {
                                    selectedspots = val;
                                  });
                                },
                                chipDisplay: MultiSelectChipDisplay(
                                  textStyle: GoogleFonts.ubuntu(color: Colors.white,),
                                  chipColor: Colors.redAccent,
                                  decoration: const BoxDecoration(
                                    color: Colors.white, ),
                                  items: selectedspots
                                      .map((e) => MultiSelectItem(e, e))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),

                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                    ),
                    onPressed: () async {
                      if (countrySelected == false) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text(
                                "Error",
                                style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              content: Text(
                                //message,
                                "Please fill all the fields to proceed",
                                style: GoogleFonts.ubuntu(
                                    color:  Colors.black),
                              ),
                              actions: [
                                TextButton(
                                  child: Text(
                                    "OK",
                                    style: GoogleFonts.ubuntu(color: Colors.redAccent),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else if (stateSelected = false) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text(
                                "Error",
                                style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ),
                              content: Text(
                                //message,
                                "Please select a city!",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.black),
                              ),
                              actions: [
                                TextButton(
                                  child: Text(
                                    "OK",
                                    style: GoogleFonts.ubuntu(color: Colors.redAccent),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => ContentScreen(value: _selectedCountry.countryCode, selectedStateCode: selectedStateCode, selectedDistrict: selectedDistrict, selectedspots: selectedspots,)));
                      }
                    },
                    child: Text(
                      "SUBMIT",
                      style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.white),
                    ),
                  ),

                  ),
              ],
            ),
          ),

        )
    );
  }
}