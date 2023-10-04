import 'package:flutter/material.dart';
import 'package:imbti/const/question_list.dart';

class MainDrawer extends StatefulWidget {
  final PageController pageController;
  final List<bool> isChecked;
  const MainDrawer(
      {super.key, required this.pageController, required this.isChecked});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
          itemCount: questionList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                widget.pageController.jumpToPage(index);
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(
                  '문제 ${index + 1}',
                  textAlign: TextAlign.center,
                ),
                trailing: widget.isChecked[index]
                    ? Icon(Icons.check_circle_outline)
                    : Icon(Icons.circle_outlined),
              ),
            );
          }),
    );
  }
}
