import 'package:flutter/material.dart';

import '../../domain/user.dart';
import '../../domain/userDTO.dart';
import '../create_product_widgets/custom_text_form_field.dart';
import 'package:markt/data/user_repository.dart';

class InscriptionForm extends StatefulWidget {

  const InscriptionForm({super.key});

  @override
  State<InscriptionForm> createState() => _InscriptionFormState();
}

class _InscriptionFormState extends State<InscriptionForm> {

  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _passwordConf = TextEditingController();

  final userRepository = UserRepository();

  void sendFormData() async {
    if (_formKey.currentState!.validate() && _password.text == _passwordConf.text) {
      var user = UserDTO(
        username: _username.text,
        password: _password.text,
      );
      await userRepository.createUser(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Form(
        key: _formKey,
        child: Column(
        children: <Widget>[
          CustomTextFormField('Nom d\'utilisateur', 'Veuillez saisir votre nom d\'utilisateur', _username, 1),
            CustomTextFormField('Mot de passe', 'Veuillez saisir votre mot de passe', _password, 1),
          CustomTextFormField('Confirmer le mot de passe', 'Veuillez confirmez le mot de passe', _passwordConf, 1),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE2E2E2),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.red,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  sendFormData();
                }
              },
              child: const Text('Se connecter'),
            ),
          ),
        ],
      ),
      ),
    );
  }

}
