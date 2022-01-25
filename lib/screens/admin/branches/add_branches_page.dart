import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddbranchePage extends StatefulWidget {
  AddbranchePage({Key? key}) : super(key: key);

  @override
  _AddbranchePageState createState() => _AddbranchePageState();
}

class _AddbranchePageState extends State<AddbranchePage> {
  final _formKey = GlobalKey<FormState>();

  var matiere = "";
  var filiere = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final filiereController = TextEditingController();
  final matiereController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    filiereController.dispose();
    matiereController.dispose();

    super.dispose();
  }

  clearText() {
    filiereController.clear();
    matiereController.clear();
  }

  // Adding Student
  CollectionReference branches =
      FirebaseFirestore.instance.collection('bracnhes');

  Future<void> addbranche() {
    return branches
        .add({'filiere': filiere, 'matiere': matiere})
        .then((value) => print('branche adde'))
        .catchError((error) => print('Failed to Add branche: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New branche"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'filiere: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: filiereController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter filiere';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'matiere: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: matiereController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter matiere';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            filiere = filiereController.text;
                            matiere = matiereController.text;

                            addbranche();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'add',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
