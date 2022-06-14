import 'dart:developer';

import 'package:crypto_cal/stateless/input_field.dart';
import 'package:crypto_cal/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:crypto_cal/constants/app_colors.dart';
import '../styles/app_text_styles.dart';
import '../constants/app_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

enum TypeFuture { short, long }

class _HomePageState extends State<HomePage> {
  TextEditingController entryController = TextEditingController();

  TypeFuture? _typeFuture = TypeFuture.short;

  final double _step = 0.5;

  double _percentTP = 0;
  double _valueTP = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: ListTile(
                        title: const Text('Short'),
                        leading: Radio<TypeFuture>(
                          value: TypeFuture.short,
                          groupValue: _typeFuture,
                          onChanged: (TypeFuture? value) {
                            setState(() {
                              _typeFuture = value;
                            });
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ListTile(
                        title: const Text('Long'),
                        leading: Radio<TypeFuture>(
                          value: TypeFuture.long,
                          groupValue: _typeFuture,
                          onChanged: (TypeFuture? value) {
                            setState(() {
                              _typeFuture = value;
                            });
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                      )),
                ],
              ),
              InputField(
                controller: entryController,
                label: AppString.nameEntryPrice,
                maxLength: 50,
                textInputType: TextInputType.number,
                onTextChanged: (entryValue) {
                  handleTextEntry(double.parse(entryValue));
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          color: AppColors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Take Profit (TP)",
                                  style: AppTextStyles.h5().copyWith(
                                      color: AppColors.black,
                                      fontStyle: FontStyle.italic)),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(Utils.formatEntry(_valueTP),
                                    style: AppTextStyles.h5().copyWith(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: AppColors.primaryColor),
                                      onPressed: () {
                                        handleDecrease;
                                      },
                                      child: Text("-",
                                          style: AppTextStyles.h5().copyWith(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Center(
                                        child: Text(_percentTP.toString(),
                                            style: AppTextStyles.h5().copyWith(
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: AppColors.primaryColor),
                                        onPressed: () {},
                                        child: Text("+",
                                            style: AppTextStyles.h5().copyWith(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                ],
                              ),
                            ],
                          ))),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [Text("Take Profit (TP) %")],
                    ),
                    flex: 1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void handleDecrease() {
    double entry = double.parse(entryController.text);
    setState(() {
      _percentTP = _percentTP + _step;
    });
    if (_typeFuture == TypeFuture.short) {} else {}
  }

  void handleTextEntry(double entryValue) {
    if (entryValue > 0) {
      setState(() {
        if (_typeFuture == TypeFuture.short) {
          log('linhnt: ${_percentTP == 0.0}');

          if (_percentTP == 0.0) {
            _valueTP = entryValue;
          }
        } else {}
      });

    }
  }

  @override
  void dispose() {
    entryController.dispose();
    super.dispose();
  }
}
