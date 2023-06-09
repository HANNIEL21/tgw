import 'package:tgw/export.dart';

class CurrencyTile2 extends StatelessWidget {


  final String? name;
  const CurrencyTile2({super.key, this.name});

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
          ],
        ),
      ),
    );
  }
}
