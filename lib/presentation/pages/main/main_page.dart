import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/core/models/pokemon_model.dart';
import 'package:pokemon/core/service/service.dart';
import 'package:pokemon/presentation/pages/info/info_page.dart';
import 'package:pokemon/presentation/utils/colors.dart';
import 'package:pokemon/presentation/utils/images.dart';
import 'package:pokemon/presentation/widgets/custom_textfield.dart';
import 'package:pokemon/presentation/widgets/gridview_container.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(padding: EdgeInsets.only(left: 24.w, right: 17.w).r,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: MyColors.c_E5E5E5,
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 52.h, bottom: 30.h),
              child: Image.asset(
                MyImages.logo,
                width: 252.w,
                height: 88.h,
              ),
            ),
              CustomTextfield(width: 296),
              SizedBox(height: 59.h,),
            SizedBox(
              child: FutureBuilder(
                future: Service.getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style:  TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    PokemonModel? model = snapshot.data;
                    return Container(
              height: 600.h,
                      width: double.infinity,
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: model?.pokemon?.length ?? 0,
                          gridDelegate:
                               SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 32.h,
                                  crossAxisSpacing: 19.w),
                          itemBuilder: (context, index) {
                            return GridContainer(
                                imgName: model?.pokemon?[index].img ?? "", 
                                name:   model?.pokemon?[index].name ?? "", 
                                num:  model?.pokemon?[index].num ?? "",
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(pokemonModel: model,
                                  index: index,),),);
                                },);
                          }),
                    );
                  }
                  return const Center(
                    child: Text(
                      "You Are Loser! XA-XA-XA",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
