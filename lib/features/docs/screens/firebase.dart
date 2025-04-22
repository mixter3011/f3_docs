import 'package:f3_docs/features/docs/widgets/doc_list.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:f3_docs/features/docs/widgets/sub_heading.dart';
import 'package:f3_docs/features/docs/widgets/code_block.dart';
import 'package:flutter/material.dart';

class FirebasePage extends StatelessWidget {
  const FirebasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DocTitle('Firebase'),
        const DocParagraph(
          'Firebase is a comprehensive app development platform that provides a suite of tools and services to help you build, improve, and grow your app. In F3 Stack, Firebase Authentication is pre-configured to provide a solid foundation for user management, while the stack makes it easy to add other Firebase services as needed.',
        ),

        const DocHeading('Why Firebase?'),
        const DocParagraph(
          'Firebase offers several advantages that make it an ideal choice for modern application development:',
        ),

        const DocList([
          'Serverless architecture: No need to manage servers or write backend code.',
          'Real-time database: Data is synchronized across all clients in real-time.',
          'Authentication: Secure authentication with multiple providers (email/password, Google, Facebook, etc.).',
          'Cloud storage: Store and serve user-generated content like images and videos.',
          'Cloud functions: Run backend code in response to events.',
          'Analytics: Gain insights into user behavior and app performance.',
        ]),

        const DocHeading('Firebase in F3 Stack'),
        const DocParagraph(
          'In F3 Stack, Firebase Authentication is pre-configured and ready to use. The F3 CLI tool sets up the necessary configuration and boilerplate code to get you started quickly with user authentication. You can easily extend your application with other Firebase services as your project grows.',
        ),

        const DocSubheading('Pre-configured Firebase Services'),
        const DocParagraph(
          'F3 Stack comes with pre-configured user authentication and management, including login, registration, and password reset functionality.',
        ),

        const DocParagraph(
          'You can easily add other Firebase services to your project as needed:',
        ),

        const DocList([
          'Cloud Firestore: A NoSQL document database for storing and syncing data.',
          'Firebase Storage: For storing user-generated content like images and files.',
          'Firebase Analytics: For tracking user behavior and app performance.',
          'Firebase Crashlytics: For tracking and fixing app crashes.',
        ]),

        const DocSubheading('Firebase Configuration'),
        const DocParagraph(
          'When you create a new F3 Stack project and run flutterfire configure, it generates a firebase_options.dart file with your Firebase project configuration.',
        ),

        const DocCodeBlock('''
// Example of firebase_options.dart
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'YOUR_API_KEY',
    appId: 'YOUR_APP_ID',
    messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
    projectId: 'YOUR_PROJECT_ID',
    authDomain: 'YOUR_AUTH_DOMAIN',
    storageBucket: 'YOUR_STORAGE_BUCKET',
  );

  // Other platform configurations...
}
'''),

        const DocSubheading('Firebase Initialization'),
        const DocParagraph(
          'In your main.dart file, Firebase is initialized before the app starts:',
        ),

        const DocCodeBlock('''
// Example of Firebase initialization in main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
'''),

        const DocSubheading('Firebase Authentication'),
        const DocParagraph(
          'F3 Stack provides a pre-configured authentication system using Firebase Authentication. It includes:',
        ),

        const DocList([
          'Email/password authentication',
          'Social authentication (Google, Facebook, etc.)',
          'User profile management',
          'Password reset functionality',
        ]),

        const DocCodeBlock('''
// Example of Firebase Authentication in F3 Stack
class FirebaseAuthDatasource implements AuthDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? 'Authentication failed');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Other authentication methods...
}
'''),

        const DocHeading('Best Practices'),
        const DocParagraph(
          'When working with Firebase in F3 Stack, follow these best practices:',
        ),

        const DocList([
          'Use the repository pattern: Abstract Firebase-specific code behind repository interfaces.',
          'Implement proper error handling: Catch and handle Firebase exceptions appropriately.',
          'Secure your data: Set up proper security rules in Firebase Console.',
          'Optimize queries: Use indexes and limit the amount of data you fetch.',
          'Use transactions for complex operations: Ensure data consistency with Firestore transactions.',
        ]),
      ],
    );
  }
}
