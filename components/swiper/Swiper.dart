import 'package:flutter/cupertino.dart';

class Swiper extends StatelessWidget {
  List items;
  Widget rightSlide;
  Widget leftSlide;
  Widget content;
  Function onLeftDismiss;
  Function onRightDismiss;
  Function onResize;

  Swiper({
    this.items,
    this.rightSlide,
    this.leftSlide,
    this.content,
    this.onLeftDismiss,
    this.onRightDismiss,
    this.onResize,
  });

//  Widget slideRightBackground() {
//     return Container(
//       color: Colors.green,
//       child: Align(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(
//               width: 20,
//             ),
//             Icon(
//               Icons.edit,
//               color: Colors.white,
//             ),
//             Text(
//               " Edit",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ],
//         ),
//         alignment: Alignment.centerLeft,
//       ),
//     );
//   }

//   Widget slideLeftBackground() {
//     return Container(
//       color: Colors.red,
//       child: Align(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             Icon(
//               Icons.delete,
//               color: Colors.white,
//             ),
//             Text(
//               " Delete",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.right,
//             ),
//             SizedBox(
//               width: 20,
//             ),
//           ],
//         ),
//         alignment: Alignment.centerRight,
//       ),
//     );
//   }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(items[index]),
          confirmDismiss: (DismissDirection direction) async {
            if (direction == DismissDirection.startToEnd) {
              if (onLeftDismiss != null) onLeftDismiss();
            } else {
              if (onRightDismiss != null) onRightDismiss();
            }
            return true;
          },
          onResize: () {
            if (onResize != null) onResize();
          },
          background: leftSlide,
          secondaryBackground: rightSlide,
          child: content,
        );
      },
    );
  }
}
