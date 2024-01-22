import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';


class ByuerInformation extends StatefulWidget {
  @override
  BuyerInformationState createState() => BuyerInformationState();

}
  class BuyerInformationState extends State<ByuerInformation>{
  var controller = MaskedTextController(mask: '+7 (000) 000-00-00', text: '+7 (000) 000-00-00');
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool isEmailValid = true;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Информация о покупателе",
                style: TextStyle(
                    fontSize: 22, fontFamily: 'SFProDisplay',fontWeight: FontWeight.w500),
              ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child:   TextField(
                    keyboardType: TextInputType.number,
                    controller: controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFF6F6F9),
                      labelText: 'Номер телефона',
                    ),
                  ),
                ),
              ],
            ),
          ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xFFF6F6F9),
                  labelText: 'Email',
                  errorText: isEmailValid ? null : 'Введите корректный адрес электронной почты',
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
                validator: (value) {
                  return isEmailValid ? null : 'Введите корректный адрес электронной почты';
                },
                onChanged: (value) {
                  final isValid = EmailValidator.validate(value);
                  if (isEmailValid != isValid) {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      isEmailValid = isValid;
                    });
                  }
                },
                onFieldSubmitted: (value) {
                  _formKey.currentState!.validate();
                },
              ),

              const Text(
                "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,fontFamily: 'SFProDisplay',
                    color: Color(0xFF828796)),
              )
            ],
          ),
        ),
      ),
    );
  }

}
class TextFieldContainer extends StatelessWidget {
  final String label;
  final String hint;

  TextFieldContainer({required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child:  TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                filled: true,
                fillColor: const Color(0xFFF6F6F9),
                labelText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

