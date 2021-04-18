part of 'pages.dart';

class DaftarTempatMakanPage extends StatefulWidget {
  @override
  _DaftarTempatMakanPageState createState() => _DaftarTempatMakanPageState();
}

class _DaftarTempatMakanPageState extends State<DaftarTempatMakanPage> {
  final nmTempatMakanController = TextEditingController();
  final lokasiTempatMakanController = TextEditingController();
  CollectionReference users =
      FirebaseFirestore.instance.collection('TempatMakan');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text(
            'Something is Wrong i can feel it',
            style: blackFontStyle3,
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SpinKitFadingCircle(
            color: mainColor,
            size: 50,
          );
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot snapshot) {
            final nmTempatMakanControllerUpdate =
                TextEditingController(text: snapshot.data()['nama_tempat']);
            final lokasiTempatMakanControllerUpdate =
                TextEditingController(text: snapshot.data()['lokasi_tempat']);
            return GestureDetector(
              onTap: () {
                Get.dialog(AlertDialog(
                  title: Text(
                    'Ubah Data Tempat Makan',
                    textAlign: TextAlign.center,
                    style: blackFontStyle3,
                  ),
                  content: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            controller: nmTempatMakanControllerUpdate,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintStyle: greyFontStyle,
                              hintText: 'Nama Tempat Makan',
                            ),
                            validator: (value) =>
                                value.isNotEmpty ? null : 'Harus di isi',
                          ),
                        )
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            controller: lokasiTempatMakanControllerUpdate,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintStyle: greyFontStyle,
                              hintText: 'Lokasi Tempat Makan',
                            ),
                            validator: (value) =>
                                value.isNotEmpty ? null : 'Harus di isi',
                          ),
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
                        context.read<TempatmakanCubit>().updateDataTempatMakan(
                            snapshot.reference.id,
                            nmTempatMakanControllerUpdate.text,
                            lokasiTempatMakanControllerUpdate.text);
                        Get.back();
                      },
                    ),
                  ],
                ));
              },
              onLongPress: () {
                Get.dialog(AlertDialog(
                  title: Text(
                    'Anda yakin ingin menghapus data ini ? ',
                    style: disclaimerText,
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
                            .deleteDataTempatMakan(snapshot.reference.id);
                        Get.back();
                      },
                    ),
                  ],
                ));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data()['nama_tempat'],
                        style: blackFontStyle3,
                      ),
                      Text(
                        snapshot.data()['lokasi_tempat'],
                        style: blackFontStyle3,
                      )
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
