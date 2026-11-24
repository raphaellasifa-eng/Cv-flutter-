import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost/api-test/public⁠';

  static Future<List<dynamic>> getMembres() async {
    final response = await http.get(
      Uri.parse('$baseUrl/famille-membres'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Erreur de chargement');
  }

  static Future<void> ajouterMembre(
      String nom, String lien) async {
    final response = await http.post(
      Uri.parse('$baseUrl/famille-membres'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nom': nom,
        'lienParente': lien,
      }),
    );

    if (response.statusCode != 200 &&
        response.statusCode != 201) {
      throw Exception('Erreur ajout');
    }
  }

  static Future<void> supprimerMembre(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/famille-membres/$id'),
    );

    if (response.statusCode != 200 &&
        response.statusCode != 204) {
      throw Exception('Erreur suppression');
    }
  }
}
