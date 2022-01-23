import 'package:flutter/material.dart';
import 'package:iset_emploi/screens/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

enum UserType { Student, Professor }
Map<UserType, String> _UserType = {
  UserType.Student: "Student",
  UserType.Professor: "Professor"
};

class _RegistrationScreenState extends State<RegistrationScreen> {
  UserType _selected = UserType.Student;
  //form key
  final _formKey = GlobalKey<FormState>();
  //les edits
  final FirstNameEditingController = new TextEditingController();
  final LastNameEditingController = new TextEditingController();
  final EmailEditingController = new TextEditingController();
  final PasswordEditingController = new TextEditingController();
  final ConfirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name
    final FirstNameField = TextFormField(
        autofocus: false,
        controller: FirstNameEditingController,
        keyboardType: TextInputType.name,
        onSaved: (value) {
          FirstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'First Name',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //LastName Field
    final LastNameField = TextFormField(
        autofocus: false,
        controller: LastNameEditingController,
        keyboardType: TextInputType.name,
        onSaved: (value) {
          LastNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Last Name',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //Emaiil
    final EmailField = TextFormField(
        autofocus: false,
        controller: EmailEditingController,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          EmailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'EMAIL',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //password
    final PasswordField = TextFormField(
        autofocus: false,
        controller: PasswordEditingController,
        obscureText: true,
        onSaved: (value) {
          PasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Password',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //Confirm passworrrd
    final ConfirmPasswordField = TextFormField(
        autofocus: false,
        controller: ConfirmPasswordEditingController,
        obscureText: true,
        onSaved: (value) {
          ConfirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: 'Confirm Password',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //singUpButton
    final SingUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {},
          child: Text(
            "SINGUP",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    /* Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(_UserType.length, (index) {
                        return buildUserTypeSelector(
                            _UserType.keys.elementAt(index));
                      }),
                    ),*/
                    SizedBox(height: 25),
                    FirstNameField,
                    SizedBox(height: 25),
                    LastNameField,
                    SizedBox(height: 25),
                    EmailField,
                    SizedBox(height: 25),
                    PasswordField,
                    SizedBox(height: 25),
                    ConfirmPasswordField,
                    SizedBox(height: 35),
                    SingUpButton,
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("you aleardy have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loginScreen()));
                          },
                          child: Text("login",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*Widget buildUserTypeSelector(UserType usertype) {
    var isSelected = _selected == usertype;

    // ignore: deprecated_member_use
    return FlatButton(
      padding: EdgeInsets.only(left: 4, right: 16),
      onPressed: () {
        setState(() {
          _selected = usertype;
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: isSelected ? Colors.blue : Colors.transparent,
      child: Row(
        children: <Widget>[
          if (isSelected)
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
          Text(
            _selected[usertype],
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }*/
}
