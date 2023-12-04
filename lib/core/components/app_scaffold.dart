import 'package:basic_app/core/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class ScaffoldCustom extends StatelessWidget {
//   final PreferredSizeWidget? appBar;
//   final Widget body;
//   final FloatingActionButtonLocation? floatingActionButtonLocation;
//   final Widget? floatingActionButton;
//   const ScaffoldCustom(
//       {Key? key,
//       this.appBar,
//       required this.body,
//       this.floatingActionButtonLocation,
//       this.floatingActionButton})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BackdropScaffold(
//       backLayerBackgroundColor: AppColor.color1,
//       backgroundColor: AppColor.color1,
//       appBar: appBar,
//       backLayer: const Center(
//         child: Text("Back Layer"),
//       ),
//       frontLayer: body,
//       floatingActionButtonLocation: floatingActionButtonLocation,
//       floatingActionButton: floatingActionButton,
//     );
//   }
// }

class AppScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget? bottomAppBar;
  final Widget? body;
  final bool? resizeToAvoidBottomInset;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final bool? isStack;
  final bool? scrollBody;
  final Color? backgroundColor;

  // ignore: sort_constructors_first
  const AppScaffold(
      {required this.body,
      this.appBar,
      this.bottomAppBar,
      this.resizeToAvoidBottomInset = true,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.isStack = false,
      this.scrollBody = false,
      this.backgroundColor = Colors.white,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    if (appBar != null) {
      widgets.add(appBar!);
    }
    if (isStack!) {
      Widget item = Expanded(
        child: Container(
          color: backgroundColor,
          height: Get.height,
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  // Here the height of the container is 45% of our total height
                  height: 200,
                  decoration: BoxDecoration(
                      color: AppColor.kPrimary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: body,
                ),
                Positioned(
                    top: 25,
                    left: 0,
                    right: 0,
                    child: bottomAppBar ?? Container())
              ],
            ),
          ),
        ),
      );
      // item.add(Positioned(
      //   top: 0,
      //   left: 0,
      //   right: 0,
      //   child: Container(
      //     height: 120,
      //     color: AppColor.color1,
      //   ),
      // ));
      // if (bottomAppBar != null) {
      //   item.add(Positioned(top: 25, left: 0, right: 0, child: bottomAppBar!));
      // }
      widgets.add(item);
    } else {
      // if (appBar != null) {
      //   widgets.add(Container(
      //       color: backgroundColor,
      //       child: ClipRRect(
      //           borderRadius:
      //               const BorderRadius.only(bottomLeft: Radius.circular(30)),
      //           child: appBar!)));
      // }
      if (bottomAppBar != null) {
        widgets.add(bottomAppBar!);
      }
      widgets.add(Expanded(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Container(
            color: backgroundColor,
            height: MediaQuery.of(context).size.height,
            child: body,
          ),
        ),
      ));
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          // appBar: appBar!,
          // backgroundColor: AppColor.color1,
          body: Container(
            color: AppColor.kPrimary,
            child: Column(
              children: widgets,
            ),
          ),
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButton: floatingActionButton),
    );
  }
}
