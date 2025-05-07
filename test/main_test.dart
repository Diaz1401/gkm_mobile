import 'package:flutter_test/flutter_test.dart';
import 'package:gkm_mobile/models/dosen_praktisi.dart';
import 'package:gkm_mobile/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final apiService = ApiService();
  const String apiToken = "REPLACED"; // Ganti dengan token asli
  int currentId = 0;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    print("=================================================================");
    print("Menyimpan API Token ...");
    await prefs.setString('token', apiToken);
    print("API Token disimpan");
    print(
        "=================================================================\n\n");
  });

  test('Ambil data Dosen Praktisi', () async {
    print("=================================================================");
    print("Ambil data Dosen Praktisi ...");
    try {
      final data = await apiService.getData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        "dosen-praktisi",
      );
      print("Data Dosen Praktisi berhasil diambil:");
      print("Jumlah data: ${data.length}");
      print("Data Dosen Praktisi: $data");
      int i = 1;
      for (var dosen in data) {
        print("ID ${i}: ${dosen.toJson()})");
        i++;
      }
      print("Data Dosen Praktisi berhasil diambil");
    } catch (e) {
      print("Error fetching data: $e");
    }
    print(
        "=================================================================\n\n");
  });

  test('Tambah data Dosen Praktisi', () async {
    print("=================================================================");
    print("Adding a new Dosen Praktisi...");
    final body = {
      "nama_dosen": "John Doe",
      "nidk": "123456",
      "perusahaan": "Tech Corp",
      "user_id": 1,
      "tahun_ajaran_id": 1,
      "pendidikan_tertinggi": "S2",
      "bidang_keahlian": "Teknik Informatika",
      "sertifikat_kompetensi": "Sertifikat",
      "mk_diampu": "5",
      "bobot_kredit_sks": 3.0,
    };

    try {
      final ret = await apiService.postData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        body,
        "dosen-praktisi",
      );
      currentId = ret.id;
      print("Data berhasil ditambahkan dengan ID: ${ret.id}");
    } catch (e) {
      print("Error adding data: $e");
    }
    print(
        "=================================================================\n\n");
  });

  test('Ambil data Dosen Praktisi', () async {
    print("=================================================================");
    print("Ambil data Dosen Praktisi ...");
    try {
      final data = await apiService.getData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        "dosen-praktisi",
      );
      print("Data Dosen Praktisi berhasil diambil:");
      print("Jumlah data: ${data.length}");
      print("Data Dosen Praktisi: $data");
      int i = 1;
      for (var dosen in data) {
        print("ID ${i}: ${dosen.toJson()})");
        i++;
      }
      print("Data Dosen Praktisi berhasil diambil");
    } catch (e) {
      print("Error fetching data: $e");
    }
    print(
        "=================================================================\n\n");
  });

  test('Update data Dosen Praktisi', () async {
    print("=================================================================");
    print("Updating Dosen Praktisi with ID $currentId...");
    final body = {
      "nama_dosen": "Jane Doe",
      "nidk": "654321",
      "perusahaan": "New Tech Corp",
      "user_id": 1,
      "tahun_ajaran_id": 1,
      "pendidikan_tertinggi": "S3",
      "bidang_keahlian": "Data Science",
      "sertifikat_kompetensi": "Advanced Certificate",
      "mk_diampu": "3",
      "bobot_kredit_sks": 4.0,
    };

    try {
      await apiService.updateData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        currentId,
        body,
        "dosen-praktisi",
      );
      print("Data berhasil diupdate.");
    } catch (e) {
      print("Error updating data: $e");
    }
    print(
        "=================================================================\n\n");
  });

  test('Ambil data Dosen Praktisi', () async {
    print("=================================================================");
    print("Ambil data Dosen Praktisi ...");
    try {
      final data = await apiService.getData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        "dosen-praktisi",
      );
      print("Data Dosen Praktisi berhasil diambil:");
      print("Jumlah data: ${data.length}");
      print("Data Dosen Praktisi: $data");
      int i = 1;
      for (var dosen in data) {
        print("ID ${i}: ${dosen.toJson()})");
        i++;
      }
      print("Data Dosen Praktisi berhasil diambil");
    } catch (e) {
      print("Error fetching data: $e");
    }
    print(
        "=================================================================\n\n");
  });

  test('Hapus data Dosen Praktisi', () async {
    print("=================================================================");
    print("Deleting Dosen Praktisi with ID $currentId...");
    try {
      await apiService.deleteData<DosenPraktisi>(
        currentId,
        "dosen-praktisi",
      );
      print("Data berhasil dihapus.");
    } catch (e) {
      print("Error deleting data: $e");
    }
    print(
        "=================================================================\n\n");
  });

  test('Ambil data Dosen Praktisi', () async {
    print("=================================================================");
    print("Ambil data Dosen Praktisi ...");
    try {
      final data = await apiService.getData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        "dosen-praktisi",
      );
      print("Data Dosen Praktisi berhasil diambil:");
      print("Jumlah data: ${data.length}");
      print("Data Dosen Praktisi: $data");
      int i = 1;
      for (var dosen in data) {
        print("ID ${i}: ${dosen.toJson()})");
        i++;
      }
      print("Data Dosen Praktisi berhasil diambil");
    } catch (e) {
      print("Error fetching data: $e");
    }
    print(
        "=================================================================\n\n");
  });
}
