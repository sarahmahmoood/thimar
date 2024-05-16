import 'package:app_package_maker_appimage/app_package_maker_appimage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:semar/core/design/app_image.dart';
import 'package:semar/features/categories/cubit.dart';
import 'package:semar/features/categories/states.dart';
import 'package:semar/features/slider/cubit.dart';
import 'package:semar/features/slider/states.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int currentImages = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          BlocBuilder<SliderCubit, SliderStates>(builder: (context, state) {
            if (state is GetSliderFailedState) {
              return Text("Failed");
            } else if (state is GetSliderSuccessState) {
              return Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false,
                      height: 164,
                      onPageChanged: (index, reason) {
                        currentImages = index;
                        setState(() {});
                      },
                    ),
                    items: state.list.map((element) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(color: Colors.amber),
                              child: AppImage(
                                element.image,
                                fit: BoxFit.cover,
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      state.list.length,
                      (index) => Padding(
                        padding: EdgeInsetsDirectional.only(end: 3),
                        child: CircleAvatar(
                            radius: 3.5,
                            backgroundColor: currentImages == index
                                ? Theme.of(context).primaryColor
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.38)),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
          SizedBox(
            height: 18,
          ),
          BlocBuilder<CategoriesCubit, CategoriesStates>(
              builder: (context, state) {
            if (state is GetCategoriesFailedState) {
              return Text("Failed");
            } else if (state is GetCategoriesSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 9),
                    child: Text("الاقسام",
                        style: TextStyle(fontWeight: FontWeight.w800)),
                  ),
                  SizedBox(
                    height: 103,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsetsDirectional.only(end: 16),
                        child: Column(
                          children: [
                            Expanded(
                              child: AppImage(
                                state.list[index].images,
                                width: 73,
                              ),
                            ),
                            Text(state.list[index].name),
                          ],
                        ),
                      ),
                      itemCount: state.list.length,
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
          SizedBox(
            height: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsetsDirectional.only(start: 16)),
              Text(
                "الأصناف",
                style: TextStyle(fontWeight: FontWeight.w800),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            SizedBox(
              height: 40,
            ),
            SvgPicture.asset(
              "assets/images/logo.svg",
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "سله ثمار",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 2),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "التوصيل إلى",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "شارع الملك فهد - جدة",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Spacer(flex: 3),
            SvgPicture.asset(
              "assets/icons/cart.svg",
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
