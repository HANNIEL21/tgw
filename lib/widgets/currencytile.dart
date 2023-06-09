import 'package:tgw/export.dart';

class CurrencyTile extends StatelessWidget {
  final name;
  final code;
  const CurrencyTile({super.key, this.name, this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(C.Cc.primary), borderRadius: BorderRadius.circular(10)),
      child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(),
            Text(name!),
            Text(code!),
          ],
        ),
      ),
    );
  }
}
