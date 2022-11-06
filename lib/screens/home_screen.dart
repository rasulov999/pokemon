import 'package:flutter/material.dart';
import 'package:pokemon/screens/info_screen.dart';
import 'package:pokemon/utils/colors.dart';
import 'package:pokemon/utils/images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 52, left: 24, right: 17),
          color: MyColors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Image.asset(
                MyImages.logo,
                height: 88,
                width: 252,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Search Pokémon", border: OutlineInputBorder(), ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 12,
                    itemBuilder: (context, index) => PokemonContainer(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(),));
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget PokemonContainer(VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 176,
            height: 115,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(child: Image.asset(MyImages.logo))
        ],
      ),
    );
  }
}
