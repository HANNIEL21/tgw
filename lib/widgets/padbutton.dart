import 'package:tgw/export.dart';

class PadButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  PadButton({super.key, required this.child, required this.onTap,});

  var buttonColor = Color(C.Cc.background);

  @override
  Widget build(BuildContext context) {
    if (child == "c") {
      buttonColor = Colors.green;
    } else if (child == 'DEL') {
      buttonColor = Colors.red;
    } else if (child == '=') {
      buttonColor = Color(C.Cc.secondary);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Color(C.Cc.primary),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              child,
              style: TextStyle(
                  color: Color(C.Cc.background),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
