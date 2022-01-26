import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddbranchePage extends StatefulWidget {
  const AddbranchePage({Key? key}) : super(key: key);

  @override
  _AddbranchePageState createState() => _AddbranchePageState();
}

class _AddbranchePageState extends State<AddbranchePage> {
  final _formKey = GlobalKey<FormState>();

  var branche = "";
  var matiere = "";
  var filiere = "";
  var classe = "";
  var salle = "";
  var time = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final brancheController = TextEditingController();
  final filiereController = TextEditingController();
  final matiereController = TextEditingController();
  final classeController = TextEditingController();
  final salleController = TextEditingController();
  final timeController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    brancheController.dispose();
    filiereController.dispose();
    matiereController.dispose();
    classeController.dispose();
    salleController.dispose();
    timeController.dispose();
    super.dispose();
  }

  clearText() {
    brancheController.clear();
    filiereController.clear();
    matiereController.clear();
    classeController.clear();
    salleController.clear();
    timeController.clear();
  }

  // Adding Student
  CollectionReference branches =
      FirebaseFirestore.instance.collection('branche');

  Future<void> addbranche() {
    return branches
        .add({
          'branche': branche,
        })
        .then((value) => print('branche added'))
        .catchError((error) => print('branche to Add branche: $error'));
  }

  CollectionReference matieres =
      FirebaseFirestore.instance.collection('matiere');

  Future<void> addmatiere() {
    return matieres
        .add({
          'matiere': matiere,
        })
        .then((value) => print('matieres added'))
        .catchError((error) => print('Failed to Add branche: $error'));
  }
/////////////////////////////

  CollectionReference classes = FirebaseFirestore.instance.collection('classe');

  Future<void> addclasse() {
    return classes
        .add({
          'classe': classe,
        })
        .then((value) => print('classe added'))
        .catchError((error) => print('Failed to Add classe: $error'));
  }

  CollectionReference salles = FirebaseFirestore.instance.collection('salle');

  Future<void> addsalle() {
    return salles
        .add({
          'salle': salle,
        })
        .then((value) => print('classe added'))
        .catchError((error) => print('Failed to Add salle: $error'));
  }

  CollectionReference times = FirebaseFirestore.instance.collection('time');

  Future<void> addtime() {
    return times
        .add({
          'time': time,
        })
        .then((value) => print('time added'))
        .catchError((error) => print('Failed to Add time: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Items"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Branche :',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: brancheController,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please Enter filiere';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Filiere :',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: filiereController,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please Enter matiere';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Matiere :',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: matiereController,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please Enter matiere';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Class :',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: classeController,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please Enter matiere';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'Salle ou Labo :',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: salleController,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please Enter matiere';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: 'time :',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: timeController,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please Enter matiere';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          branche = brancheController.text;
                          filiere = filiereController.text;
                          matiere = matiereController.text;
                          classe = classeController.text;
                          salle = salleController.text;
                          time = timeController.text;
                          //addbranche
                          addbranche();
                          addclasse();
                          addmatiere();
                          addsalle();
                          addtime();
                          clearText();
                        });
                      }
                    },
                    child: const Text(
                      'add',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {clearText()},
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                  ),
                  const Text("Note : these items can be added individually!"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
