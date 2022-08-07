import 'package:flutter/material.dart';
import '../pages/newscreen.dart';
import 'datepicker.dart';
class InfoField extends StatefulWidget {
  const InfoField({Key? key}) : super(key: key);

  @override
  State<InfoField> createState() => _InfoFieldState();
}

class _InfoFieldState extends State<InfoField> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();


  bool _isValid = false;
  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }
  String? gender;
  String dropdownvalue = '1';
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  @override

  Widget build(BuildContext context) {
    return Container(

      child: Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textCapitalization: TextCapitalization.words,
              decoration:
              const InputDecoration(labelText: 'First Name '),
              keyboardType: TextInputType.name,
              validator: (value) {
                // Check if this field is empty
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                // the email is valid
                return null;
              },
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textCapitalization: TextCapitalization.words,
              decoration:
              const InputDecoration(labelText: 'Last Name '),
              keyboardType: TextInputType.name,
              validator: (value) {
                // Check if this field is empty
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }

                // the email is valid
                return null;
              },
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration:
              const InputDecoration(labelText: 'Enter your email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // Check if this field is empty
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }

                // using regular expression
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return "Please enter a valid email address";
                }

                // the email is valid
                return null;
              },
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: true,
              controller: _pass,

              decoration:

              const InputDecoration(labelText:'Password'),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                // Check if this field is empty
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                // the email is valid
                return null;
              },
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: true,
              decoration:

              const InputDecoration(labelText:'Confirm Password'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // Check if this field is empty
                if (value == null || value.isEmpty) {
                  return 'This field is required';

                }
                if(value != _pass.text) {
                  return ('Not Match');
                }

                // the email is valid
                return null;
              },
            ),
            Datepicker(),
            const SizedBox(

              height: 20.0,
            ),
            Text("No of Siblings", style: TextStyle(
                fontSize: 18
            ),
            ),
            DropdownButton(

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            const SizedBox(

              height: 20.0,
            ),
            Text("What is your gender?", style: TextStyle(
                fontSize: 18
            ),
            ),



            RadioListTile(
              title: Text("Male"),
              value: "male",
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                });
              },
            ),

            RadioListTile(
              title: Text("Female"),
              value: "female",
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            const SizedBox(

              height: 20.0,
            ),
            Center(
              child: Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      _saveForm();
                      print(_pass.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewPage(pass: _pass.text,)),
                      );
                    },
                  )),
            ),



          ],
        ),
      ),
    );
  }
}
