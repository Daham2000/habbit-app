import 'package:flutter/material.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({super.key});

  @override
  State<SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _birthdayController =
      TextEditingController(text: "mm/dd/yyyy");

  @override
  void dispose() {
    _surnameController.dispose();
    _nameController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {}
  }

  Future<DateTime?> showDateTimePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    initialDate ??= DateTime.now();
    firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
    lastDate ??= firstDate.add(const Duration(days: 365 * 200));

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate == null) return null;

    if (!context.mounted) return selectedDate;

    return DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Create Account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          leading: GestureDetector(
            onTap: () => {Navigator.pop(context)},
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 15,
            ),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                      border: UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _surnameController,
                    decoration: InputDecoration(
                      labelText: 'Surname',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      border: UnderlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Surname';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () async {
                      DateTime? time =
                          await showDateTimePicker(context: context);
                      String? birthday = "" +
                          time!.month.toString() +
                          "/" +
                          time!.day.toString() +
                          "/" +
                          time!.year.toString();
                      _birthdayController.text = birthday;
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Birthday',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                          border: UnderlineInputBorder(),
                        ),
                        controller: _birthdayController,
                        validator: (value) {
                          if (value == null || value.isEmpty || value == "mm/dd/yyyy") {
                            return 'Please enter your Birthday';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF3843FF)),
                    ),
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text('Next'),
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
