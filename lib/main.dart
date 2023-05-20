import 'package:flutter/material.dart';

import 'add_to_cart_page/presentation/widget/rotated_image_backgroud_widget.dart';
import 'add_to_cart_page/presentation/widget/rotated_image_widget.dart';
import 'add_to_cart_page/utils/function/get_current_offset_page_controller.dart';
import 'food_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyFoodScreen(),
    );
  }
}

class MyFoodScreen extends StatefulWidget {
  const MyFoodScreen({super.key});

  @override
  State<MyFoodScreen> createState() => _MyFoodScreenState();
}

class _MyFoodScreenState extends State<MyFoodScreen>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  List<FoodModel> foodlist = foodList;

  double currentOffset() => getCurrentOffsetPageController(pageController);

  int get currentIndex => currentOffset().round() % foodlist.length;

  @override
  void initState() {
    pageController = PageController(
      initialPage: foodlist.length,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          return _buildScreen();
        },
      ),
    );
  }

  Stack _buildScreen() {
    final Size size = MediaQuery.of(context).size;
    final FoodModel currentFood = foodlist[currentIndex];
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -size.width * 0.6,
          child: RotatedImageBackgroundWidget(
            currentIndex: currentIndex,
            imageFood: currentFood.image,
            pageOffset: currentOffset(),
          ),
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                currentFood.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "\$${currentFood.price}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.pink.shade800,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: size.height * 0.1),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.3,
                      vertical: size.height * 0.03,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {},
                child: const Text(
                  "Add to cart",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Swipe to see Recipes",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: SizedBox(
            height: size.width,
            child: RotatedImageWidget(
              currentOffset: currentOffset(),
              image: (index) => foodlist[index % foodlist.length].image,
              pageController: pageController,
            ) 
          ),
        ),
      ],
    );
  }
}
