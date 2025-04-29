import 'package:gkm_mobile/models/dosen_praktisi.dart';
import 'package:gkm_mobile/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Mock SharedPreferences for testing
  SharedPreferences.setMockInitialValues({}); // Mock empty SharedPreferences

  final apiService = ApiService();
  const String apiToken = "REPLACED"; // Replace with your actual token

  // Save API token to shared preferences (if needed)
  Future<void> saveApiToSharedPrefs() async {
    print("Saving API token...");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', apiToken);
    print("API token saved.");
  }

  // Fetch data
  Future<void> fetchDosenPraktisi() async {
    print("Fetching Dosen Praktisi...");
    try {
      final data = await apiService.getData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        "dosen-praktisi",
      );
      print("Fetched ${data.length} records:");
      for (var dosen in data) {
        print("- ${dosen.namaDosen} (${dosen.perusahaan})");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  // Add data
  Future<void> addDosenPraktisi() async {
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
      await apiService.postData<DosenPraktisi>(
        DosenPraktisi.fromJson,
        body,
        "dosen-praktisi",
      );
      print("Dosen Praktisi added successfully.");
    } catch (e) {
      print("Error adding data: $e");
    }
  }

  // Update data
  Future<void> updateDosenPraktisi(int id) async {
    print("Updating Dosen Praktisi with ID $id...");
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
        id,
        body,
        "dosen-praktisi",
      );
      print("Dosen Praktisi updated successfully.");
    } catch (e) {
      print("Error updating data: $e");
    }
  }

  // Delete data
  Future<void> deleteDosenPraktisi(int id) async {
    print("Deleting Dosen Praktisi with ID $id...");
    try {
      await apiService.deleteData<DosenPraktisi>(
        id,
        "dosen-praktisi",
      );
      print("Dosen Praktisi deleted successfully.");
    } catch (e) {
      print("Error deleting data: $e");
    }
  }

  // Run tests
  await saveApiToSharedPrefs();
  await fetchDosenPraktisi();
  await addDosenPraktisi();
  await fetchDosenPraktisi(); // Verify the new data is added
  await updateDosenPraktisi(1); // Replace with a valid ID
  await fetchDosenPraktisi(); // Verify the data is updated
  await deleteDosenPraktisi(1); // Replace with a valid ID
  await fetchDosenPraktisi(); // Verify the data is deleted
}
