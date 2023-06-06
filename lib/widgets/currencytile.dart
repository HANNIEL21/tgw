import 'package:tgw/export.dart';

class CurrencyTile extends StatelessWidget {
  const CurrencyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(C.Cc.primary), borderRadius: BorderRadius.circular(10)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("data"),
                Text("data"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("data"),
                Text("data"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
