part of 'services.dart';

class TMKnServices {
  static CollectionReference tmknCollection =
      FirebaseFirestore.instance.collection('TempatMakan');

  static Future<void> saveTempatMakan(String namaTempat, String lokasi) async {
    await tmknCollection
        .doc()
        .set({'nama_tempat': namaTempat, 'lokasi_tempat': lokasi});
  }

  static Future<List<TempatMakan>> getAll() async {
    QuerySnapshot snapshot = await tmknCollection.get();
    var document = snapshot.docs;
    List<TempatMakan> tmptMkn = [];
    for (var doc in document) {
      tmptMkn.add(TempatMakan(
          id: doc.reference.id,
          namaTempat: doc.data()['nama_tempat'],
          lokasi: doc.data()['lokasi_tempat']));
    }
    print('Isi snapshot get = $tmptMkn');
    return tmptMkn;
  }

  static Future<void> updateTempatMakan(String id, String nmTempat, String lokasi) async {
    print('Updating Data = $id');
    print('Updating Nama Tempat = $nmTempat');
    print('Updating Lokasi Tempat = $lokasi');
    await tmknCollection
        .doc(id)
        .update({'nama_tempat': nmTempat, 'lokasi_tempat': lokasi});
  }

  static Future<void> deleteTempatMakan(String idTmptMakan) async {
    await tmknCollection.doc(idTmptMakan).delete();
  }
}
