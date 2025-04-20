import 'package:f3_docs/features/docs/widgets/doc_list.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:flutter/material.dart';

class FirebasePage extends StatelessWidget {
  const FirebasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 270),
      child: Column(
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
        ],
      ),
    );
  }
}
