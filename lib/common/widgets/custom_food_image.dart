import 'package:flutter/material.dart';
import '../models/image_data.dart';

class CustomFoodImage extends StatelessWidget {
  final ImageData myFoodIMageList;
  Function functionality;

   CustomFoodImage({required this.myFoodIMageList, required this.functionality});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 155 ,
                height: 145,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    myFoodIMageList.imagePath,
                    fit: BoxFit.cover,
                    // Adjust the height as needed
                  ),
                ),
              ),

              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.redAccent.withOpacity(0.3),
                  ),
                  child: const Center(
                    child: Text(
                      '-20% off',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        // backgroundColor: Colors.redAccent.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -1,
                left: 20,
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent, // Background color of the circle
                        ),
                        child: InkWell(
                          onTap: () => functionality(),
                          child: const Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'ADD',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: IconButton(
                  onPressed: () {},
                  icon: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent.withOpacity(0.4)),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: ListTile(
              title: myFoodIMageList.title,
            ),
          ),
        ],
      ),
    );
  }
}


