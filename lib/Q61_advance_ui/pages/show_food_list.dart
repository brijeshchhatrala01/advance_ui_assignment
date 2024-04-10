import 'package:advance_ui_assignment/Q61_advance_ui/food_card.dart';
import 'package:advance_ui_assignment/Q61_advance_ui/model/cart_model.dart';
import 'package:advance_ui_assignment/Q61_advance_ui/model/food_model.dart';
import 'package:flutter/material.dart';

class ShowFoodList extends StatelessWidget {
  final CartModel value;
  const ShowFoodList({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      child: Column(
        children: [
          buildAppBar(),
          buildFoodFilter(),
          buildFoodList(value, context),
        ],
      ),
    );
  }
}

Widget buildAppBar() {
  return SafeArea(
    child: Row(
      children: [
        const Text(
          'MENU',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt_outlined),
        ),
      ],
    ),
  );
}

Widget buildFoodFilter() {
  return SizedBox(
    height: 50,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChoiceChip(
            showCheckmark: false,
            label: Text('Index $index'),
            selected: false,
            selectedColor: Colors.yellow,
            onSelected: (value) {},
          ),
        );
      },
    ),
  );
}

Widget buildFoodList(CartModel? cartModel, BuildContext context) {
  // List imageList = [
  //   'assets/images/dish1.png',
  //   'assets/images/dish2.png',
  //   'assets/images/dish3.png',
  //   'assets/images/dish4.png',
  //   'assets/images/ingre1.png',
  //   'assets/images/ingre2.png',
  //   'assets/images/ingre3.png',
  //   'assets/images/ingre4.png',
  //   'assets/images/res_logo.png',
  // ];
  return Expanded(
      child: GridView.count(
    crossAxisCount: 2,
    childAspectRatio: 0.55,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    physics: const BouncingScrollPhysics(),
    children: List.generate(
      foodItems.length,
      (index) => FoodCard(
        image: foodItems[index].image,
        name: foodItems[index].name,
        price: foodItems[index].price,
        rating: foodItems[index].rating,
        onTap: () {
          var food = Food(
            image: foodItems[index].image,
            name: foodItems[index].name,
            discription: foodItems[index].discription,
            price: foodItems[index].price,
            rating: foodItems[index].rating,
          );
          cartModel!.addToCart(food);
          print(cartModel!.cart);
        },
      ),
    ),
  ));
}
