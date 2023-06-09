import 'package:tgw/export.dart';

class Button extends StatelessWidget {
  final String child;
  final color;
  final textColor;
  final VoidCallback onTap;
  Button({super.key, required this.child, required this.onTap, this.color, this.textColor,});

  var buttonColor = Color(C.Cc.background);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              child,
              style: TextStyle(
                  color: Color(C.Cc.background),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
