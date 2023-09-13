import 'package:flutter/material.dart';
import 'package:flutter_groccery_app/constant/App.colors.dart';
import 'package:flutter_groccery_app/constant/custom_textStyle.dart';
import 'package:flutter_groccery_app/screens/get%20started%20view/Bottom%20Navigation%20bar/screens/Home%20Page%20View/home%20page%20widget/home_page_product_data.dart';

class HomePageGridItem extends StatefulWidget {
  final Function(int) addToCartCallBack;

  const HomePageGridItem({super.key, required this.addToCartCallBack});

  @override
  State<HomePageGridItem> createState() => _HomePageGridItemState();
}

class _HomePageGridItemState extends State<HomePageGridItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GridView.builder(
        itemCount: homePageProductData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 252,
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: AppDarkColors.black10,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.network(
                      "${homePageProductData.elementAt(index)["images"]}",
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14, right: 14),
                    child: Divider(
                      color: AppColors.blue,
                      thickness: 0.1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "${homePageProductData.elementAt(index)["price"]}",
                      style: CustomTextStyle18.h1Bold18,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "${homePageProductData.elementAt(index)["description"]}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppDarkColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 15,
                top: 160,
                child: InkWell(
                  onTap: () {
                    widget.addToCartCallBack(index);
                  },
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: AppColors.blue,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}