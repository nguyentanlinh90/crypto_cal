import 'dart:developer';

import 'package:crypto_cal/constants/constants.dart';
import 'package:crypto_cal/model/Entry.dart';
import 'package:crypto_cal/stateless/input_field.dart';
import 'package:crypto_cal/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:crypto_cal/constants/app_colors.dart';
import '../constants/type_future.dart';
import '../styles/app_text_styles.dart';
import '../constants/app_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController entryController = TextEditingController();

  Entry entry = Entry(Constants.crossDefault, TypeFuture.short, 0, 0, 0,
      Constants.percentTakeProfitDefault, Constants.percentStopLossDefault);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 5, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text("Cross: ",
                        style: AppTextStyles.h5()
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor),
                    onPressed: () {
                      handleCrossDecrease();
                    },
                    child: Text("-",
                        style: AppTextStyles.h5().copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(entry.cross.toString(),
                        style: AppTextStyles.h5()
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor),
                    onPressed: () {
                      handleCrossIncrease();
                    },
                    child: Text("+",
                        style: AppTextStyles.h5().copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: ListTile(
                        title: Text('Short',
                            style: AppTextStyles.h5()
                                .copyWith(fontWeight: FontWeight.bold)),
                        leading: Radio<TypeFuture>(
                          value: TypeFuture.short,
                          groupValue: entry.type,
                          onChanged: (TypeFuture? value) {
                            handleTypeFuture(value);
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ListTile(
                        title: Text('Long',
                            style: AppTextStyles.h5()
                                .copyWith(fontWeight: FontWeight.bold)),
                        leading: Radio<TypeFuture>(
                          value: TypeFuture.long,
                          groupValue: entry.type,
                          onChanged: (TypeFuture? value) {
                            handleTypeFuture(value);
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                controller: entryController,
                label: AppString.nameEntryPrice,
                maxLength: 10,
                textInputType: TextInputType.number,
                onTextChanged: (entryValue) {
                  handleTextEntry(entryValue);
                },
              ),
              const SizedBox(
                height: 20,
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
                              Center(
                                child: Text("Take Profit (TP)",
                                    style: AppTextStyles.h5()
                                        .copyWith(fontStyle: FontStyle.italic)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                    Utils.formatEntry(
                                        entry.getValueTakeProfit().toString()),
                                    style: AppTextStyles.h5()
                                        .copyWith(fontWeight: FontWeight.bold)),
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
                                        handleTPDecrease();
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
                                        child: Text(
                                            entry.percentTakeProfit.toString(),
                                            style: AppTextStyles.h5().copyWith(
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: AppColors.primaryColor),
                                        onPressed: () {
                                          handleTPIncrease();
                                        },
                                        child: Text("+",
                                            style: AppTextStyles.h5().copyWith(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                ],
                              ),
                            ],
                          ))),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    color: AppColors.gray,
                    child: const SizedBox(
                      width: 1,
                      height: 100,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          color: AppColors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text("Stop Loss (SL)",
                                    style: AppTextStyles.h5()
                                        .copyWith(fontStyle: FontStyle.italic)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                    Utils.formatEntry(
                                        entry.getValueStopLoss().toString()),
                                    style: AppTextStyles.h5()
                                        .copyWith(fontWeight: FontWeight.bold)),
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
                                        handleSLDecrease();
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
                                        child: Text(
                                            entry.percentStopLoss.toString(),
                                            style: AppTextStyles.h5().copyWith(
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: AppColors.primaryColor),
                                        onPressed: () {
                                          handleSLIncrease();
                                        },
                                        child: Text("+",
                                            style: AppTextStyles.h5().copyWith(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                ],
                              ),
                            ],
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void handleTypeFuture(TypeFuture? value) {
    setState(() {
      entry.type = value;
    });
  }

  void handleTextEntry(String entryValue) {
    if (entryValue.isEmpty) {
      entryValue = "0";
    }
    setState(() {
      entry.entry = double.parse(entryValue);
      /*entryController.text = Utils.formatEntry(entryValue);
      entryController.selection = TextSelection.fromPosition(
          TextPosition(offset: entryController.text.length));*/
    });
  }

  void handleTPDecrease() {
    if (entry.percentTakeProfit > 0) {
      setState(() {
        entry.percentTakeProfit -= entry.step;
      });
    }
  }

  void handleTPIncrease() {
    if (entry.percentTakeProfit < 100) {
      setState(() {
        entry.percentTakeProfit += entry.step;
      });
    }
  }

  void handleSLDecrease() {
    if (entry.percentStopLoss > 0) {
      setState(() {
        entry.percentStopLoss -= entry.step;
      });
    }
  }

  void handleSLIncrease() {
    if (entry.percentStopLoss < 100) {
      setState(() {
        entry.percentStopLoss += entry.step;
      });
    }
  }

  void handleCrossDecrease() {
    if (entry.cross > 0) {
      setState(() {
        entry.cross -= entry.step;
      });
    }
  }

  void handleCrossIncrease() {
    if (entry.cross < 20) {
      setState(() {
        entry.cross += entry.step;
      });
    }
  }

  @override
  void dispose() {
    entryController.dispose();
    super.dispose();
  }
}
