import 'package:flutter_test/flutter_test.dart';
import 'package:gkm_mobile/models/dosen_praktisi.dart';
import 'package:gkm_mobile/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> measure(String label, Future<void> Function() action) async {
  final stopwatch = Stopwatch()..start();
  print("=================================================================");
  print("STARTING TEST: $label");
  try {
    await action();
  } catch (e) {
    print("Exception during '$label': $e");
  }
  stopwatch.stop();
  print("FINISHED TEST: $label — Took ${stopwatch.elapsedMilliseconds} ms");
  print("=================================================================\n\n");
}

void main() {
  final apiService = ApiService();
  const String apiToken = "REPLACED"; // Ganti dengan token asli
  int currentId = 0;

  test('Setup API Token', () async {
    await measure('Setup API Token', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', apiToken);
    });
  });

  test('Ambil data Dosen Praktisi', () async {
    await measure('Ambil data Dosen Praktisi', () async {
      final data = await apiService.getData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        "dosen-praktisi",
      );
      print("Data Dosen Praktisi berhasil diambil:");
      print("Jumlah data: ${data.length}");
      for (int i = 0; i < data.length; i++) {
        print("ID ${i + 1}: ${data[i].toJson()})");
      }
    });
  });

  test('Tambah data Dosen Praktisi', () async {
    await measure('Tambah data Dosen Praktisi', () async {
      final body = {
        "nama_dosen": "John Doe",
        "nidk": "123456",
        "perusahaan": "Tech Corp",
        "user_id": 44,
        "tahun_ajaran_id": 1,
        "pendidikan_tertinggi": "S2",
        "bidang_keahlian": "Teknik Informatika",
        "sertifikat_kompetensi": "Sertifikat",
        "mk_diampu": "5",
        "bobot_kredit_sks": 3.0,
      };

      final ret = await apiService.postData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        body,
        "dosen-praktisi",
      );
      currentId = ret.id;
      print("Data berhasil ditambahkan dengan ID: ${ret.id}");
    });
  });

  test('Ambil data Dosen Praktisi Setelah Tambah', () async {
    await measure('Ambil data Dosen Praktisi Setelah Tambah', () async {
      final data = await apiService.getData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        "dosen-praktisi",
      );
      print("Data Dosen Praktisi berhasil diambil:");
      print("Jumlah data: ${data.length}");
      for (int i = 0; i < data.length; i++) {
        print("ID ${i + 1}: ${data[i].toJson()})");
      }
    });
  });

  test('Update data Dosen Praktisi', () async {
    await measure('Update data Dosen Praktisi', () async {
      final body = {
        "nama_dosen": "Jane Doe",
        "nidk": "654321",
        "perusahaan": "New Tech Corp",
        "user_id": 44,
        "tahun_ajaran_id": 1,
        "pendidikan_tertinggi": "S3",
        "bidang_keahlian": "Data Science",
        "sertifikat_kompetensi": "Advanced Certificate",
        "mk_diampu": "3",
        "bobot_kredit_sks": 4.0,
      };

      await apiService.updateData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        currentId,
        body,
        "dosen-praktisi",
      );
      print("Data berhasil diupdate.");
    });
  });

  test('Ambil data Dosen Praktisi Setelah Update', () async {
    await measure('Ambil data Dosen Praktisi Setelah Update', () async {
      final data = await apiService.getData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        "dosen-praktisi",
      );
      print("Data Dosen Praktisi berhasil diambil:");
      print("Jumlah data: ${data.length}");
      for (int i = 0; i < data.length; i++) {
        print("ID ${i + 1}: ${data[i].toJson()})");
      }
    });
  });

  test('Hapus data Dosen Praktisi', () async {
    await measure('Hapus data Dosen Praktisi', () async {
      await apiService.deleteData<DosenPraktisi>(
        currentId,
        "dosen-praktisi",
      );
      print("Data berhasil dihapus.");
    });
  });

  test('Ambil data Dosen Praktisi Setelah Hapus', () async {
    await measure('Ambil data Dosen Praktisi Setelah Hapus', () async {
      final data = await apiService.getData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        "dosen-praktisi",
      );
      print("Data Dosen Praktisi berhasil diambil:");
      print("Jumlah data: ${data.length}");
      for (int i = 0; i < data.length; i++) {
        print("ID ${i + 1}: ${data[i].toJson()})");
      }
    });
  });
}
