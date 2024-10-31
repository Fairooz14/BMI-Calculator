import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'result_page.dart';
import 'theme_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double heightValue = 170;
  int weightValue = 70;
  int ageValue = 23;
  String gender = "Male";
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          IconButton(
            icon: Icon(
              Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              themeController.toggleTheme();
              setState(() {}); // Update the icon after theme change
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome Message
            Text(
              "Calculate your BMI",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Gender Selection
            Text(
              "Select Gender",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderButton(
                  gender: "Male",
                  selectedGender: gender,
                  onTap: () {
                    setState(() {
                      gender = "Male";
                    });
                  },
                ),
                SizedBox(width: 20),
                GenderButton(
                  gender: "Female",
                  selectedGender: gender,
                  onTap: () {
                    setState(() {
                      gender = "Female";
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            // Height, Weight, and Age Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Weight and Age in Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255, 151, 92, 193)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Weight (kg)",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => setState(() => weightValue--),
                                icon: Icon(Icons.remove_circle),
                              ),
                              Text("$weightValue kg",
                                  style: TextStyle(fontSize: 18)),
                              IconButton(
                                onPressed: () => setState(() => weightValue++),
                                icon: Icon(Icons.add_circle),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255, 151, 92, 193)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Age (year)",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => setState(() => ageValue--),
                                icon: Icon(Icons.remove_circle),
                              ),
                              Text("$ageValue years",
                                  style: TextStyle(fontSize: 18)),
                              IconButton(
                                onPressed: () => setState(() => ageValue++),
                                icon: Icon(Icons.add_circle),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                // Height Slider
                Column(
                  children: [
                    Text(
                      "Height (cm)",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SfSlider.vertical(
                      min: 100.0,
                      max: 220.0,
                      value: heightValue,
                      interval: 10,
                      showTicks: true,
                      showLabels: true,
                      onChanged: (dynamic value) {
                        setState(() {
                          heightValue = value;
                        });
                      },
                    ),
                    Text("${heightValue.toInt()} cm",
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            // Calculate Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 20),
                
              ),
              onPressed: () {
                Get.to(ResultPage(height: heightValue, weight: weightValue));
              },
              child: Text(
                "Let's Calculate",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final String gender;
  final String selectedGender;
  final Function() onTap;

  GenderButton({
    required this.gender,
    required this.selectedGender,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = gender == selectedGender;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          gender,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
