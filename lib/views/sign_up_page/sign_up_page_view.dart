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
  int currentPage = 0;
  int selectedGender = 0;

  final habitList = [
    "Drink water",
    "Run",
    "Read books",
    "Meditate",
    "Study",
    "Journal",
    "Water plant",
    "Sleep",
  ];

  final habitImgList = [
    "assets/images/water_icon.png",
    "assets/images/run_icon.png",
    "assets/images/read_icon.png",
    "assets/images/medic_icon.png",
    "assets/images/study_icon.png",
    "assets/images/journal_icon.png",
    "assets/images/plant_icon.png",
    "assets/images/sleep_icon.png",
  ];

  @override
  void dispose() {
    _surnameController.dispose();
    _nameController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _submitForm() {
    try {
      if (currentPage != 0 || _formKey.currentState!.validate()) {
        setState(() {
          currentPage += 1;
        });
      }
    } catch (e) {}
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
            child: currentPage == 0
                ? Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
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
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: UnderlineInputBorder(),
                          ),
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
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                border: UnderlineInputBorder(),
                              ),
                              controller: _birthdayController,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == "mm/dd/yyyy") {
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
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF3843FF)),
                          ),
                          onPressed: () {
                            _submitForm();
                          },
                          child: Text('Next'),
                        )
                      ],
                    ),
                  )
                : currentPage == 1
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Choose your gender",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => {
                                  setState(() {
                                    selectedGender = 1;
                                  })
                                },
                                child: Card(
                                  elevation: 5, // The shadow effect of the card
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: selectedGender == 1 ? Colors.grey : Colors.white,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/male_gender_icon.png",
                                        height: 150,
                                      ),
                                      Text("Male")
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () => {
                                  setState(() {
                                    selectedGender = 2;
                                  })
                                },
                                child: Card(
                                  elevation: 5, // The shadow effect of the card
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: selectedGender == 2 ? Colors.grey : Colors.white,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/female_gender_icon.png",
                                        height: 150,
                                      ),
                                      Text("Female")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF3843FF)),
                            ),
                            onPressed: () {
                              _submitForm();
                            },
                            child: Text('Next'),
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Choose your first habits",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "You may add more habits later",
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // 2 items in each row
                                  crossAxisSpacing:
                                      8.0, // Space between columns
                                  mainAxisSpacing: 8.0, // Space between rows
                                  childAspectRatio: 2 /
                                      2, // Width / Height ratio for each item
                                ),
                                itemCount: habitList.length,
                                // Number of items in the grid
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => {},
                                    child: Card(
                                      elevation:
                                          5, // The shadow effect of the card
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            habitImgList[index],
                                            height: 100,
                                          ),
                                          Text(habitList[index])
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF3843FF)),
                            ),
                            onPressed: () {
                              _submitForm();
                            },
                            child: Text('Next'),
                          )
                        ],
                      ),
          ),
        ]));
  }
}
