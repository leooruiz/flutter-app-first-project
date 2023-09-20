import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const PracticingForms(),
    );
  }
}

class PracticingForms extends StatefulWidget {
  const PracticingForms({super.key});

  @override
  State<PracticingForms> createState() => _PracticingFormsState();
}

class _PracticingFormsState extends State<PracticingForms> {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController streetAdressController = TextEditingController();
  var birthMaskFormatter = MaskTextInputFormatter(
      mask: '##/##/####', filter: {'#': RegExp(r'[0-9]')});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.keyboard_arrow_left),
          title: const Text("Sign up"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              width: 375,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Name",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [birthMaskFormatter],
                        keyboardType: TextInputType.datetime,
                        controller: birthController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Date of birth",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "E-mail",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Telefone",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.streetAddress,
                        controller: streetAdressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Endereço",
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        validateDate(birthMaskFormatter.getMaskedText());
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "User named ${nameController.text} borned in ${birthController.text} was created!")));
                      },
                      child: const Text("Send"),
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
}

void validateDate(String birthDate) {
  // final inputFormat = DateFormat('dd/MM/yyyy');
  // final date = inputFormat.parse(birthDate);
  // print(date);
}
