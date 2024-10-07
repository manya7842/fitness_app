import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/constants/padding_margin.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> workoutCategories = ["Beginner", "Intermediate", "Advanced"];
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.04),
          child: Container(
            padding: AppPadding.horizontalPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello User",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Text(
                  "Good morning.",
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    color: Colors.white30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Workouts",
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Fri, 4 Oct",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: PrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ImageStack(
                    size: size,
                    image: "assets/onboardingImages/lower2.jpg",
                    title: "Lower Body training",
                    time: "50 min",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                  Container(
                  width: size.width * 0.9,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ImageStack(
                    size: size,
                    image: "assets/onboardingImages/endurance.jpeg",
                    title: "Endurance training",
                    time: "90 mins",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                 Container(
                  width: size.width * 0.9,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ImageStack(
                    size: size,
                    image: "assets/onboardingImages/strength.jpg",
                    title: "Strength training",
                    time: "60 mins",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                 Container(
                  width: size.width * 0.9,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ImageStack(
                    size: size,
                    image: "assets/onboardingImages/circuit.jpg",
                    title: "Circuit training",
                    time: "30-60 mins",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's workout plan",
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/workoutCategories');
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          color: PrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ToggleButtons(
                  isSelected: List.generate(workoutCategories.length,
                      (index) => index == selectedCategory),
                  onPressed: (int index) {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  children: workoutCategories.map((category) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedCategory ==
                                  workoutCategories.indexOf(category)
                              ? PrimaryColor
                              : Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: selectedCategory ==
                                        workoutCategories.indexOf(category)
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ));
                  }).toList(),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height * 0.2,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: size.width * 0.8,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ImageStack(
                            size: size,
                            title: "Push Up",
                            time: "100 Push up a day",
                            image: 'assets/onboardingImages/pushup.jpg'),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Container(
                        width: size.width * 0.8,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ImageStack(
                            size: size,
                            title: "Situp",
                            time: "20 sit up a day",
                            image: 'assets/onboardingImages/situp.jpeg'),
                      ),
                       Container(
                        width: size.width * 0.8,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ImageStack(
                            size: size,
                            title: "Knee push up",
                            time: "20 knee push up a day",
                            image: 'assets/onboardingImages/kneepushup.jpg'),
                      ),
                       Container(
                        width: size.width * 0.8,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ImageStack(
                            size: size,
                            title: "wall pushup",
                            time: "100 wall push up a day",
                            image: 'assets/onboardingImages/wallpushup.jpg'),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Text(
                  "Best for you",
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.2,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Container(
                        width: size.width * 0.5,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ImageStack(
                            size: size,
                            title: "Belly fat burner",
                            time: "10 min",
                            image: 'assets/onboardingImages/bellyfat.jpg'),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Container(
                        width: size.width * 0.5,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ImageStack(
                            size: size,
                            title: "Plank",
                            time: "5 min",
                            image: 'assets/onboardingImages/plank.png'),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                       Container(
                        width: size.width * 0.5,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ImageStack(
                            size: size,
                            title: "Lose Fat",
                            time: "10 min",
                            image: 'assets/onboardingImages/losefat.jpeg'),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                    ],
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

class ImageStack extends StatelessWidget {
  const ImageStack(
      {super.key,
      required this.size,
      required this.image,
      required this.title,
      required this.time});

  final Size size;
  final String image;
  final String title;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width * 0.9,
          height: size.height * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          left: size.width * 0.05,
          top: size.height * 0.125,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: size.width * 0.052,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: size.width * 0.035,
                  color: PrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
