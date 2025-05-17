// import 'package:flutter/material.dart';
// import 'app_colors.dart';

// class AddTask extends StatefulWidget {
//   const AddTask({super.key});

//   @override
//   State<AddTask> createState() => _AddTaskState();
// }

// class _AddTaskState extends State<AddTask> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: LgT.background,
//       appBar: AppBar(backgroundColor: LgT.appbar,
//       title: Title(color: Colors.black, child: Text('Addtask')),),
//       body: Center(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height*0.8,
//           width: MediaQuery.of(context).size.width*0.8,
//           child: TextField()
//           ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {}; // To store key-value pairs

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  formData['name'] = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  formData['email'] = value!;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save(); // Trigger onSaved for each field
                    print(formData); // Output the stored key-value pairs
                    // You can now use the 'formData' map to send data, etc.
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}