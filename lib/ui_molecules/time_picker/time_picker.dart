import 'package:flutter/material.dart';

class TimePickerWheel extends StatefulWidget {
  const TimePickerWheel({super.key});

  @override
  State<TimePickerWheel> createState() => _TimePickerWheelState();
}

class _TimePickerWheelState extends State<TimePickerWheel> {
  int selectedHour = 0;
  int selectedMinute = 0;

  final FixedExtentScrollController hourController =
      FixedExtentScrollController();
  final FixedExtentScrollController minuteController =
      FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // overall height
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ==== HOURS ====
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: hourController,
              itemExtent: 40,
              perspective: 0.008,
              diameterRatio: 2.5,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedHour = index;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  if (index < 0 || index > 23) return null;
                  return Center(
                    child: Text(
                      index.toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: 22,
                        color: selectedHour == index
                            ? Colors.white
                            : Colors.white54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const Text(
            ":",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          // ==== MINUTES ====
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: minuteController,
              itemExtent: 40,
              perspective: 0.008,
              diameterRatio: 2.5,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedMinute = index;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  if (index < 0 || index > 59) return null;
                  return Center(
                    child: Text(
                      index.toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: 22,
                        color: selectedMinute == index
                            ? Colors.white
                            : Colors.white54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
