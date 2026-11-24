import 'package:flutter/material.dart';
 import 'Api_service.dart';

class LoginPage extends StatefulWidget {
 final VoidCallback onLoginSuccess;
 
 const LoginPage({super.key, required this.onLoginSuccess});
 
 @override
 State<LoginPage> createState() => _LoginPageState();
}
 
class _LoginPageState extends State<LoginPage> {
 final _formKey = GlobalKey<FormState>();
 final _identifiantController = TextEditingController();
 final _motDePasseController = TextEditingController();
 bool _obscurePassword = true;
 
 @override
 void dispose() {
   _identifiantController.dispose();
   _motDePasseController.dispose();
   super.dispose();
 }
 
 void _seConnecter() {
   if (_formKey.currentState!.validate()) {
     widget.onLoginSuccess();
   }
 }
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Connexion'),
       centerTitle: true,
     ),
     body: Center(
       child: SingleChildScrollView(
         padding: const EdgeInsets.all(24.0),
         child: Form(
           key: _formKey,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               const Icon(
                 Icons.lock_outline,
                 size: 72,
                 color: Colors.indigo,
               ),
               const SizedBox(height: 16),
               const Text(
                 'Bienvenue',
                 textAlign: TextAlign.center,
                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
               ),
               const SizedBox(height: 8),
               const Text(
                 'Connectez-vous pour accéder au CV, à la famille et aux contacts',
                 textAlign: TextAlign.center,
                 style: TextStyle(color: Colors.grey),
               ),
               const SizedBox(height: 32),
               TextFormField(
                 controller: _identifiantController,
                 decoration: const InputDecoration(
                   labelText: 'Identifiant',
                   prefixIcon: Icon(Icons.person_outline),
                   border: OutlineInputBorder(),
                 ),
                 validator: (value) {
                   if (value == null || value.trim().isEmpty) {
                     return 'Veuillez entrer votre identifiant';
                   }
                   return null;
                 },
               ),
               const SizedBox(height: 16),
               TextFormField(
                 controller: _motDePasseController,
                 obscureText: _obscurePassword,
                 decoration: InputDecoration(
                   labelText: 'Mot de passe',
                   prefixIcon: const Icon(Icons.lock_outline),
                   border: const OutlineInputBorder(),
                   suffixIcon: IconButton(
                     icon: Icon(
                       _obscurePassword
                           ? Icons.visibility_off
                           : Icons.visibility,
                     ),
                     onPressed: () {
                       setState(() {
                         _obscurePassword = !_obscurePassword;
                       });
                     },
                   ),
                 ),
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Veuillez entrer votre mot de passe';
                   }
                   return null;
                 },
               ),
               const SizedBox(height: 24),
               ElevatedButton(
                 onPressed: _seConnecter,
                 style: ElevatedButton.styleFrom(
                   padding: const EdgeInsets.symmetric(vertical: 16),
                 ),
                 child: const Text(
                   'Se connecter',
                   style: TextStyle(fontSize: 16),
                 ),import 'package:flutter/material.dart';
 
class CvPage extends StatelessWidget {
 const CvPage({super.key});
 
 Widget _buildSectionCard({
   required IconData icon,
   required String title,
   required Widget child,
 }) {
   return Card(
     elevation: 2,
     margin: const EdgeInsets.only(bottom: 16),
     child: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             children: [
               Icon(icon, color: Colors.indigo),
               const SizedBox(width: 8),
               Text(
                 title,
                 style: const TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ],
           ),
           const Divider(height: 20),
           child,
         ],
       ),
     ),
   );
 }
 
 @override
 Widget build(BuildContext context) {
   return SingleChildScrollView(
     padding: const EdgeInsets.all(16.0),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         // En-tête : photo de profil, nom et titre / profil
         Card(
           elevation: 3,
           margin: const EdgeInsets.only(bottom: 16),
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
               children: [
                 const CircleAvatar(
                   radius: 56,
                   backgroundImage: AssetImage('assets/images/profil.jpg'),
                 ),
                 const SizedBox(height: 14),
                 const Text(
                   'Amani Muhindo Jemima',
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 22,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 const SizedBox(height: 6),
                 const Text(
                   'Étudiante en Informatique & Développement Mobile (Flutter)',
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 15,
                     color: Colors.indigo,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
                 const SizedBox(height: 10),
                 const Text(
                   'Profil : Étudiante motivée et rigoureuse, passionnée par le développement d’applications mobiles, le web et les réseaux informatiques.',
                   textAlign: TextAlign.center,
                   style: TextStyle(color: Colors.black87, height: 1.4),
                 ),
               ],
             ),
           ),
         ),
 
         // Formation
         _buildSectionCard(
           icon: Icons.school,
           title: 'Formation',
           child: const Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'Études supérieures en Informatique — ISIG-GOMA',
                 style: TextStyle(fontWeight: FontWeight.bold),
               ),
               Text('Formation académique et travaux pratiques en génie logiciel / systèmes.'),
               SizedBox(height: 10),
               Text(
                 'Parcours Réseaux (CCNA)',
                 style: TextStyle(fontWeight: FontWeight.bold),
               ),
               Text('Introduction to Networks / Enterprise Networking, Security, and Automation.'),
             ],
           ),
         ),
 
         // Expériences (stages, projets, emplois)
         _buildSectionCard(
           icon: Icons.work_outline,
           title: 'Expériences (Stages, Projets, Emplois)',
           child: const Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'Stage professionnel',
                 style: TextStyle(fontWeight: FontWeight.bold),
               ),
               Text('Participation aux activités pratiques et rédaction d’un rapport de stage.'),
               SizedBox(height: 10),
               Text(
                 'Projets académiques & personnels',
                 style: TextStyle(fontWeight: FontWeight.bold),
               ),
               Text('• Application mobile Flutter (CV, Famille, Contact) hébergée sur GitHub.\n'
                   '• Création et configuration de sites web (WordPress).'),
               SizedBox(height: 10),
               Text(
                 'Encadrement / Animation',
                 style: TextStyle(fontWeight: FontWeight.bold),
               ),
               Text('Initiation et sensibilisation aux bonnes pratiques numériques auprès des jeunes.'),
             ],
           ),
         ),
 
         // Compétences techniques et linguistiques
         _buildSectionCard(
           icon: Icons.code,
           title: 'Compétences techniques et linguistiques',
           child: const Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'Compétences techniques',
                 style: TextStyle(fontWeight: FontWeight.bold),
               ),
               SizedBox(height: 4),
               Text('Flutter / Dart, Git & GitHub, WordPress, bases en réseaux informatiques et bureautique.'),
               SizedBox(height: 12),
               Text(
                 'Compétences linguistiques',
                 style: TextStyle(fontWeight: FontWeight.bold),
               ),
               SizedBox(height: 4),
               Text('Français (courant), Anglais (niveau intermédiaire / lecture technique).'),
             ],
           ),
         ),
 
         // Centres d'intérêt
         _buildSectionCard(
           icon: Icons.favorite_border,
           title: 'Centres d’intérêt',
           child: const Wrap(
             spacing: 8,
             runSpacing: 8,
             children: [
               Chip(label: Text('Développement mobile')),
               Chip(label: Text('Nouvelles technologies')),
               Chip(label: Text('Apprentissage continu')),
               Chip(label: Text('Engagement communautaire')),
             ],
           ),
         ),
       ],
     ),
   );
 }
}

               ),
             ],
           ),
         ),
       ),
     ),
   );
 }
}
import 'package:flutter/material.dart';
 
class MembreFamille {
 final String nom;
 final String lienParente;
 final String imagePath;
 final String roleOuInfo;
 
 const MembreFamille({
   required this.nom,
   required this.lienParente,
   required this.imagePath,
   required this.roleOuInfo,


  class FamillePage extends StatefulWidget {
  const FamillePage({super.key});

  @override
  State<FamillePage> createState() => _FamillePageState();
}

class _FamillePageState extends State<FamillePage> {
  late Future<List<dynamic>> _futureMembres;

  @override
  void initState() {
    super.initState();
    _futureMembres = ApiService.getMembres();
  }

  void _rechargerMembres() {
    setState(() {
      _futureMembres = ApiService.getMembres();
    });
  }

  Future<void> _ouvrirDialogueAjout() async {
    final nomController = TextEditingController();
    final lienController = TextEditingController();

    final valide = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ajouter un membre'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: lienController,
              decoration: const InputDecoration(labelText: 'Lien de parenté'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );

    if (valide == true) {
      final nom = nomController.text.trim();
      final lien = lienController.text.trim();
      if (nom.isNotEmpty && lien.isNotEmpty) {
        await ApiService.ajouterMembre(nom, lien);
        _rechargerMembres();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Famille')),
      floatingActionButton: FloatingActionButton(
        onPressed: _ouvrirDialogueAjout,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _futureMembres,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Erreur : ${snapshot.error}'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _rechargerMembres,
                    child: const Text('Réessayer'),
                  ),
                ],
              ),
            );
          }

          final membres = snapshot.data ?? [];
          if (membres.isEmpty) {
            return const Center(child: Text('Aucun membre trouvé.'));
          }

          return ListView.builder(
            itemCount: membres.length,
            itemBuilder: (context, index) {
              final item = membres[index] as Map<String, dynamic>;
              final nom = item['nom']?.toString() ?? 'Sans nom';
              final lien = item['lienParente']?.toString() ?? '';
              final id = item['id'];

              return ListTile(
                title: Text(nom),
                subtitle: Text(lien),
                trailing: id is int
                    ? IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await ApiService.supprimerMembre(id);
                          _rechargerMembres();
                        },
                      )
                    : null,
              );
            },
          );
        },
      ),
    );
  }
}

     },
   );
 }
}
import 'package:flutter/material.dart';
 
class ContactPage extends StatelessWidget {
 const ContactPage({super.key});
 
 Widget _buildContactCard({
   required BuildContext context,
   required IconData icon,
   required String titre,
   required String valeur,
   required String messageSnackBar,
 }) {
   return Card(
     elevation: 2,
     margin: const EdgeInsets.only(bottom: 14),
     child: ListTile(
       leading: CircleAvatar(
         backgroundColor: Colors.indigo.withValues(alpha: 0.12),
         child: Icon(icon, color: Colors.indigo),
       ),
       title: Text(
         titre,
         style: const TextStyle(fontWeight: FontWeight.bold),
       ),
       subtitle: Text(valeur),
       trailing: const Icon(Icons.chevron_right),
       onTap: () {
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(messageSnackBar)),
         );
       },
     ),
   );
 }
 
 @override
 Widget build(BuildContext context) {
   return ListView(
     padding: const EdgeInsets.all(16.0),
     children: [
       const Card(
         elevation: 3,
         margin: EdgeInsets.only(bottom: 18),
         child: Padding(
           padding: EdgeInsets.all(16.0),
           child: Column(
             children: [
               Icon(Icons.contact_mail, size: 44, color: Colors.indigo),
               SizedBox(height: 8),
               Text(
                 'Mes coordonnées',
                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
               ),
               SizedBox(height: 4),
               Text(
                 'Appuyez sur une carte pour voir les détails ou copier l’information.',
                 textAlign: TextAlign.center,
                 style: TextStyle(color: Colors.grey),
               ),
             ],
           ),
         ),
       ),
       _buildContactCard(
         context: context,
         icon: Icons.location_on,
         titre: 'Adresse',
         valeur: 'Goma, Nord-Kivu, République Démocratique du Congo',
         messageSnackBar: 'Adresse : Goma, Nord-Kivu, RDC',
       ),
       _buildContactCard(
         context: context,
         icon: Icons.phone,
         titre: 'Téléphone',
         valeur: '+243 000 000 000',
         messageSnackBar: 'Téléphone : +243 000 000 000',
       ),
       _buildContactCard(
         context: context,
         icon: Icons.email,
         titre: 'E-mail',
         valeur: 'amani.jemima@exemple.com',
         messageSnackBar: 'E-mail : amani.jemima@exemple.com',
       ),
       _buildContactCard(
         context: context,
         icon: Icons.code,
         titre: 'GitHub',
         valeur: 'github.com/jemimamuhindo83-gif',
         messageSnackBar: 'Dépôt : github.com/jemimamuhindo83-gif/cv_flutter_amani',
       ),
       _buildContactCard(
         context: context,
         icon: Icons.public,
         titre: 'Réseaux sociaux & liens utiles',
         valeur: 'LinkedIn • Portfolio / Projets',
         messageSnackBar: 'Profils sociaux et liens utiles disponibles',
       ),
     ],
   );
 }
}
