import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double height;
  final int weight;

  ResultPage({required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    double bmi = weight / ((height / 100) * (height / 100));
    String bmiStatus;
    Color borderColor;
    String bodyText1;

    if (bmi < 18.5) {
      bmiStatus = "Underweight";
      borderColor = Colors.orange;
      bodyText1 =
          "You are underweight. It's important to eat a balanced diet and increase your calorie intake. Consider consulting a healthcare provider for guidance.";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      bmiStatus = "Healthy";
      borderColor = Colors.green;
      bodyText1 =
          "You have a healthy weight. Keep up with a balanced diet and regular physical activity to maintain your BMI.";
    } else if (bmi >= 25 && bmi <= 29.9) {
      bmiStatus = "Overweight";
      borderColor = Colors.orange;
      bodyText1 =
          "You are slightly overweight. Consider adopting a healthy eating plan and increasing your physical activity to lose weight gradually.";
    } else {
      bmiStatus = "Obese";
      borderColor = Colors.red;
      bodyText1 =
          "Your BMI falls in the obese category. It's important to focus on a healthier diet and incorporate more physical activities into your daily routine. Consult a healthcare provider for personalized advice.";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // BMI Value Display with Circular Border
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Column(
                  children: [
                    Text(
                      bmi.toStringAsFixed(1),
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      bmiStatus,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Personalized Advice based on BMI
              Text(
                bodyText1,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Action Buttons or Further Advice
              ElevatedButton(
                
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back to Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
