import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets/custom_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double purchasePrice = 10000;
  double downPayment = 1000;
  double repaymentTime = 5;
  double interestRate = 3;
  double loanAmountRes = 0;
  double estimatedPerMonth = 0;
  @override
  Widget build(BuildContext context) {
    double loanAmount = purchasePrice - downPayment;
    double monthlyIntersetRate = interestRate / 12 / 100;
    double totalMonths = repaymentTime * 12;
    double mortgagePayment = loanAmount *
        (monthlyIntersetRate * pow(1 + monthlyIntersetRate, totalMonths)) /
        (pow(1 + monthlyIntersetRate, totalMonths) - 1);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Mortgage calculator',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                CustomSlider(
                  min: 10000,
                  max: 1000000,
                  divisions: 99,
                  sliderLable: 'Purchase price: ',
                  sliderNewValueText:
                      '\$${NumberFormat('#,###,###').format(purchasePrice)}',
                  sliderInitValue: purchasePrice,
                  onChanged: (newValue) {
                    setState(() {
                      purchasePrice = newValue;
                    });
                  },
                ),
                CustomSlider(
                  min: 1000,
                  max: 300000,
                  divisions: 150,
                  sliderLable: 'Down payment: ',
                  sliderNewValueText:
                      '\$${NumberFormat('#,###,###').format(downPayment)}',
                  sliderInitValue: downPayment,
                  onChanged: (newValue) {
                    setState(() {
                      downPayment = newValue;
                    });
                  },
                ),
                CustomSlider(
                  min: 1,
                  max: 30,
                  divisions: 29,
                  sliderLable: 'Repayment time: ',
                  sliderNewValueText:
                      '${NumberFormat('#,###,###').format(repaymentTime)} years',
                  sliderInitValue: repaymentTime,
                  onChanged: (newValue) {
                    setState(() {
                      repaymentTime = newValue;
                    });
                  },
                ),
                CustomSlider(
                  min: 1,
                  max: 10,
                  divisions: 9,
                  sliderLable: 'Interest rate: ',
                  sliderNewValueText:
                      '${NumberFormat('#,###,###').format(interestRate)}%',
                  sliderInitValue: interestRate,
                  onChanged: (newValue) {
                    setState(() {
                      interestRate = newValue;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Loan amount',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$${NumberFormat('#,###,###').format((loanAmountRes))}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Estimated per month: ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$${NumberFormat('#,###,###').format((estimatedPerMonth))}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.deepPurpleAccent,
                        elevation: 5,
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
                    onPressed: () {
                      setState(() {
                        loanAmountRes = loanAmount;
                        estimatedPerMonth = mortgagePayment;
                      });
                    },
                    child: Text(
                      'Get a mortgage quoto',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
