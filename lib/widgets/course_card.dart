import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {

  final String title;
  final String subtitle;
  final String duration;
  final Color color;
  final Color buttonColor;
  final Color textColor;
  final String image;
  final VoidCallback onTap;

  const CourseCard({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.color,
    required this.buttonColor,
    required this.textColor,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [
          Align(
            alignment: AlignmentGeometry.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: title == 'Basics' ?
                Image.asset(image, height: 105)
                :
                Align(
                  alignment: .bottomRight,
                  child: Transform.scale(
                    scale: 1.15,
                    child: Image.asset(image, height: 105)
                  ),
                ),
              ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  subtitle,
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      duration,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    child:
                    ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 2)
                        // shape: StadiumBorder(),
                      ),
                      child: Text(
                        "START",
                        style: TextStyle(
                          color: color,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    )
                  ],
                )
              ],
            ),
          ),
            ],
          )
    );
  }
}