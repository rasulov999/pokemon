import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/core/models/pokemon_model.dart';
import 'package:pokemon/presentation/utils/colors.dart';
import 'package:pokemon/presentation/utils/images.dart';
import 'package:pokemon/presentation/widgets/custom_textfield.dart';

class InfoPage extends StatelessWidget {
  InfoPage({super.key, required this.pokemonModel, required this.index});
  PokemonModel? pokemonModel;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: MyColors.c_E5E5E5,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 52.h,left: 89.w, bottom: 30.h).r,
              child: Image.asset(
                MyImages.logo,
                width: 252.w,
                height: 88.h,
              ),
            ),
            SizedBox(height: 30.h,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    MyImages.arrowBack,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                CustomTextfield(width: 228.w),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(MyImages.menu),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(left: 21.w, right: 21.w,top: 20.h).r,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('#${pokemonModel?.pokemon?[index].num ?? ""}',style: TextStyle(
                    fontSize: 18.sp,fontWeight: FontWeight.w800,
                    color: MyColors.c_F993FB
                  ),),
                    Text(pokemonModel?.pokemon?[index].name ?? "",style: TextStyle(
                    fontSize: 18.sp,fontWeight: FontWeight.w800,
                    color: Colors.black
                  ),),
                ],
              ),
            ),
            SizedBox(height: 14.h,),
            Stack(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 21.w).r,
                  child: Container(
                    width: 371.w,
                    height: 205.h,
                    decoration: BoxDecoration(
                      color: MyColors.c_FA5AFD,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                ),
                Positioned(
                  left: 54.w,
                  bottom: 20.h,
                  top: 10.h,
                  child: Image.network(
                    pokemonModel?.pokemon?[index].img ?? "",
                    width: 289.w,
                    height: 247.h,
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 21.w).r,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  customContainer(MyColors.c_FCA600.withOpacity(0.97), "Fire"),
                  customContainer(MyColors.c_0083FC.withOpacity(0.46), "Flying")
              ],
            ),
          ),
          SizedBox(height: 25.h,),
          Container(
            width: 415.w,
            height: 309.h,
            decoration: BoxDecoration(
              color: MyColors.c_FA5AFD,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.r), topRight: Radius.circular(60.r))
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 191.h,
                  left: 178.w,
                  child: Image.asset(MyImages.pokemon,width: 233.w,height: 118.h,),),
              Positioned(
                left: 30.w,
                top: 41.h,
                child: stackItems("Height", pokemonModel?.pokemon?[index].height ?? "", "Weight",pokemonModel?.pokemon?[index].weight ?? "" , 
                Column(
                  children: [
                    Text("Skilss",style: TextStyle(
                        fontSize: 18.sp,fontWeight: FontWeight.w800, color: MyColors.white,
                      ),),
                      SizedBox(height: 9.h,),
                    Text("Sea Flames",style: TextStyle(
                        fontSize: 16.sp,fontWeight: FontWeight.w700, color: MyColors.white.withOpacity(0.56),
                          ),
                        ),
                      ],
                    ),
                  ),
                 ),
              Positioned(top: 41.h,
              left: 140.w,
                child: stackItems("Category", "Llama", "Sex", "", const SizedBox(),),),
               Positioned(
                top: 41.h,
                left: 262.w,
                child: stackElement(),),
               ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget customContainer(Color color, String text,){
    return Container(
      width: 174.w,
      height: 38.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color,
      ),
      child: Center(child: Text(text, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800, color: MyColors.white),)),
    );
  }
  Widget stackItems(String title, String height,String title2,String weight, Widget widget){
    return Column(
      children: [
        Text(title,style: TextStyle(
          fontSize: 18.sp,fontWeight: FontWeight.w800, color: MyColors.white,
        ),),
        SizedBox(height: 9.h,),
      Text(height,style: TextStyle(
          fontSize: 16.sp,fontWeight: FontWeight.w700, color: MyColors.white.withOpacity(0.56),
        ),),

        SizedBox(height: 40.h,),
         Text(title2,style: TextStyle(
          fontSize: 18.sp,fontWeight: FontWeight.w800, color: MyColors.white,
        ),),
        SizedBox(height: 9.h,),
      Text(weight,style: TextStyle(
          fontSize: 16.sp,fontWeight: FontWeight.w700, color: MyColors.white.withOpacity(0.56),
        ),),
        SizedBox(height: 44.h,),
        widget,
      ],
    );
  }
  Widget stackElement(){
    return Column(
      children: [
        Text("Weakness",style: TextStyle(
          fontSize: 18.sp,fontWeight: FontWeight.w800, color: MyColors.white,
        ),),
        SizedBox(height: 9.h,),
         Text("Water",style: TextStyle(
          fontSize: 16.sp,fontWeight: FontWeight.w700, color: MyColors.white.withOpacity(0.56),
        ),),
        SizedBox(height: 9.h,),
         Text("Electricity",style: TextStyle(
          fontSize: 16.sp,fontWeight: FontWeight.w700, color: MyColors.white.withOpacity(0.56),
        ),),
        SizedBox(height: 14.h,),
         Text("Rock",style: TextStyle(
          fontSize: 16.sp,fontWeight: FontWeight.w700, color: MyColors.white.withOpacity(0.56),
        ),),
      ],
    );
  }
}
