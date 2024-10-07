import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/material.dart';

class workoutProgress extends StatefulWidget {
  const workoutProgress({super.key});

  @override
  State<workoutProgress> createState() => _WorkoutProgressState();
}

class _WorkoutProgressState extends State<workoutProgress> {
  final _firstController = CalendarSliderController();
  late DateTime _selectedDateAppBBar;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 56, 64, 70), // Dark background
      appBar: CalendarSlider(
        controller: _firstController,
        selectedDayPosition: SelectedDayPosition.center,
        fullCalendarScroll: FullCalendarScroll.vertical,
        backgroundColor:
            const Color.fromARGB(0, 94, 100, 104), // Greyish background
        fullCalendarWeekDay: WeekDay.short,
        selectedTileBackgroundColor:
            const Color(0xFFA48AED), // Purple selection
        monthYearButtonBackgroundColor: const Color(0xFF8B8F92), // Light grey
        monthYearTextColor: Colors.white,
        tileBackgroundColor:
            const Color.fromARGB(0, 139, 143, 146), // Light grey tile
        selectedDateColor: const Color(0xFF384046), // Darker selection text
        dateColor: Colors.white,
        tileShadow: BoxShadow(
          color: Colors.black.withOpacity(1),
        ),
        locale: 'en',
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 100)),
        lastDate: DateTime.now().add(const Duration(days: 100)),
        onDateSelected: (date) {
          setState(() {
            _selectedDateAppBBar = date;
          });
        },
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Workout Progress',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxProgressBar(
                    text: '652 Cal',
                    subText: 'Active Calories',
                    color: const Color(0xFFED4747), // Red color for calories
                    value: 0.65,
                    size: size.width * 0.35,
                  ),
                  BoxProgressBar(
                    text: '72bpm',
                    subText: 'Heart',
                    color: const Color(0xFFFCC46F), // Orange/Yellow for heart
                    value: 0.62,
                    size: size.width * 0.35,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularIndicatorText(
                    text: '6540',
                    subText: 'Steps',
                    color: const Color(0xFFED4747), // Red for steps
                    strokeWidth: 7,
                    size: size.width * 0.26,
                    value: 0.8,
                  ),
                  CircularIndicatorText(
                    text: '45min',
                    subText: 'Time',
                    color: const Color(0xFF95CCE3), // Blue for time
                    strokeWidth: 7,
                    size: size.width * 0.26,
                    value: 0.45,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxProgressBar(
                    text: '7h 30m',
                    subText: 'Sleep',
                    color: const Color(0xFFA48AED), // Purple for sleep
                    value: 0.75,
                    size: size.width * 0.35,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Water Intake',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: size.height * 0.01),
                    LinearProgressIndicator(
                      value: 0.6, // 60% water intake
                      backgroundColor: Colors.grey[800],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF95CCE3), // Blue for water intake
                      ),
                      minHeight: 15,
                    ),
                    SizedBox(height: size.height * 0.01),
                    const Text(
                      '1200 ml / 2000 ml',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxProgressBar extends StatelessWidget {
  const BoxProgressBar({
    super.key,
    required this.text,
    required this.subText,
    required this.color,
    required this.value,
    this.size,
  });

  final String text;
  final String subText;
  final Color color;
  final double value;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size! * 0.8,
      width: size,
      decoration: BoxDecoration(
        color: const Color(0xFF5E6468), // Grey box background
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey[800],
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 10,
          ),
          Text(
            subText,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class CircularIndicatorText extends StatelessWidget {
  const CircularIndicatorText({
    super.key,
    required this.text,
    required this.subText,
    required this.color,
    required this.strokeWidth,
    this.size,
    required this.value,
  });

  final String text;
  final double? size;
  final String subText;
  final Color color;
  final double strokeWidth;
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              value: value,
              backgroundColor: Colors.grey[800],
              valueColor: AlwaysStoppedAnimation<Color>(color),
              strokeWidth: strokeWidth,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 26, color: Colors.white),
              ),
              Text(
                subText,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
