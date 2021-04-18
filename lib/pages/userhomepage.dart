part of 'pages.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int bottomNavBarIndex;
  PageController pageController;
  final nmTempatMakanController = TextEditingController();
  final lokasiTempatMakanController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              color: accentColor1,
            ),
            SafeArea(
              child: Container(
                color: Color(0xFFF6F7F9),
              ),
            ),
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                });
              },
              children: [DaftarTempatMakanPage(), GatchaPage()],
            ),
            CustomBottomNavBar(
              bottomNavBarIndex: bottomNavBarIndex,
              onTap: (index) {
                bottomNavBarIndex = index;
                pageController.jumpToPage(index);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 46,
                width: 46,
                margin: EdgeInsets.only(bottom: 42),
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: accentColor2,
                  onPressed: () {
                    Get.dialog(AlertDialog(
                      title: Text(
                        'Tambah Data Tempat Makan',
                        textAlign: TextAlign.center,
                        style: blackFontStyle3,
                      ),
                      content: Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(children: [
                            TextFormField(
                              textCapitalization: TextCapitalization.words,
                              controller: nmTempatMakanController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: greyFontStyle,
                                hintText: 'Nama Tempat Makan',
                              ),
                              validator: (value) =>
                              value.isNotEmpty ? null : 'Harus di isi',
                            )
                          ]),
                          TableRow(children: [
                            TextFormField(
                              textCapitalization: TextCapitalization.words,
                              controller: lokasiTempatMakanController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: greyFontStyle,
                                hintText: 'Lokasi Tempat Makan',
                              ),
                              validator: (value) =>
                              value.isNotEmpty ? null : 'Harus di isi',
                            )
                          ]),
                        ],
                      ),
                      actions: <Widget>[
                        CupertinoButton(
                          child: Text(
                            'Batal',
                            style: disclaimerText,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        CupertinoButton(
                          child: Text(
                            'Ya',
                            style: disclaimerText.copyWith(color: Colors.blue),
                          ),
                          onPressed: () {
                            context
                                .read<TempatmakanCubit>()
                                .submitDataTempatMakan(
                                nmTempatMakanController.text,
                                lokasiTempatMakanController.text);
                            Get.back();
                          },
                        ),
                      ],
                    ));
                  },
                  child: SizedBox(
                    height: 26,
                    width: 26,
                    child: Icon(
                      MdiIcons.notePlus,
                      color: Colors.black.withOpacity(0.54),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
