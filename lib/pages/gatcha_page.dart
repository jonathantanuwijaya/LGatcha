part of 'pages.dart';

class GatchaPage extends StatefulWidget {
  @override
  _GatchaPageState createState() => _GatchaPageState();
}

class _GatchaPageState extends State<GatchaPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TempatmakanCubit, TempatmakanState>(builder: (_, state) {
      if (state is TempatmakanLoaded) {
        List<TempatMakan> gatchaMKN = state.tempatMakan;
        return Center(
          child: ElevatedButton(
            onPressed: () {
              final _random = new Random();
              int idxG = _random.nextInt(gatchaMKN.length);
              String randomGatcha = gatchaMKN[idxG].namaTempat;
              Get.defaultDialog(
                  title: 'Tempat yang terpilih adalah ',
                  content: Text(
                    randomGatcha,
                    style: blackFontStyle1.copyWith(fontSize: 30),
                  ));
            },
            child: Text(
              'Click me for Gatcha',
              style: disclaimerText.copyWith(color: Colors.white),
            ),
          ),
        );
      } else {
        return SpinKitFadingCircle(
          color: mainColor,
          size: 50,
        );
      }
    });
  }
}
