import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/feature/home/presentation/view/widgets/un_active_icon.dart';

class IconListView extends StatefulWidget {
  const IconListView({super.key});

  @override
  State<IconListView> createState() => _IconListViewState();
}

class _IconListViewState extends State<IconListView> {
  int currentIndex = 0;
  List<IconData> iconList = [
    Icons.house,
    Icons.favorite,
    FontAwesomeIcons.filter,
    FontAwesomeIcons.cartShopping,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.sizeOf(context).width * .15,
            ),
            child: UnActiveAndActiveIcon(
              onPressed: () {
                setState(() {
                  currentIndex = index;
                });
              },
              isActive: currentIndex == index,
              icon: iconList[index],
            ),
          );
        },
      ),
    );
  }
}
