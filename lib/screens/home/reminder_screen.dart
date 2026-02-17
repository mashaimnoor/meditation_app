import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:meditationapp_task/screens/home/home_screen.dart';

class ReminderScreen extends StatefulWidget {

  @override
  _ReminderScreenState createState() =>
      _ReminderScreenState();
}

class _ReminderScreenState
    extends State<ReminderScreen> {

  DateTime selectedTime = DateTime.now();
  List<String> days = ["SU", "M", "T", "W", "TH", "F", "S"];
  List<int> selectedDays = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 60),

              /// TITLE
              Text(
                "What time would you\nlike to meditate?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: .w700,
                ),
              ),

              SizedBox(height: 15),

              Text(
                "Any time you can choose but We recommend\nfirst thing in the morning.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 29),

              /// TIME PICKER CONTAINER
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  highlightedTextStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  spacing: 40,
                  itemHeight: 60,
                  isForce2Digits: true,
                  onTimeChange: (time) {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                ),
              ),

              SizedBox(height: 30),

              /// SECOND TITLE
              Text(
                "Which day would you\nlike to meditate?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15),

              Text(
                "Everyday is best, but we recommend picking\nat least five.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 40),

              /// DAY SELECTOR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(days.length, (index) {
                  bool isSelected = selectedDays.contains(index);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedDays.remove(index);
                        } else {
                          selectedDays.add(index);
                        }
                      });
                    },
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? Color(0xFF8E97FD)
                            : Colors.grey.shade200,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        days[index],
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }),
              ),

              //Spacer(),
              SizedBox(height: 57,),

              /// SAVE BUTTON
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // gradient: LinearGradient(
                  //   // colors: [
                  //   //   Color.fromRGBO(142, 151, 253, 1),
                  //   //   Color.fromRGBO(246, 241, 251, 1),
                  //   // ],
                  // ),
                ),
                // child: Padding(
                //   padding: EdgeInsetsGeometry.symmetric(horizontal: 22),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(142, 151, 253, 1),
                        foregroundColor: Color.fromRGBO(246, 241, 251, 1),
                        minimumSize: Size(double.infinity, 55)
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => HomeScreen()));
                    },
                    child: Text("Save"),
                  ),
                ),


              SizedBox(height: 9),

              Center(
                child: Text(
                  "NO THANKS",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}