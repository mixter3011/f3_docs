import 'package:f3_docs/features/docs/widgets/code_block.dart';
import 'package:f3_docs/features/docs/widgets/doc_link.dart';
import 'package:f3_docs/features/docs/widgets/doc_list.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/sub_heading.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:flutter/material.dart';

class DeploymentPage extends StatelessWidget {
  const DeploymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DocTitle('Deployment'),
        const DocParagraph(
          'Deploying your F3 Stack application involves building and distributing your Flutter app to various platforms, including mobile app stores, web hosting services, and desktop platforms.',
        ),
        const DocHeading('Deployment Platforms'),
        const DocParagraph(
          'F3 Stack applications can be deployed to multiple platforms:',
        ),
        const DocList([
          'Mobile: iOS App Store and Google Play Store',
          'Web: Firebase Hosting, Vercel, Netlify, or any web hosting service',
          'Desktop: Windows, macOS, and Linux',
        ]),
        const DocHeading('Mobile Deployment'),
        const DocSubheading('Android'),
        const DocParagraph(
          'To deploy your F3 Stack application to the Google Play Store:',
        ),
        const DocList(['Configure app signing:']),
        const DocCodeBlock('''
# Create a keystore
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
'''),
        const DocList([
          'Configure signing in android/app/build.gradle',
          'Build the release APK or App Bundle:',
        ]),
        const DocCodeBlock('''
# Build an APK
flutter build apk --release

# Or build an App Bundle (recommended)
flutter build appbundle
'''),
        const DocList([
          'Create a Google Play Developer account if you don\tt have one',
          'Create a new application in the Google Play Console',
          'Upload your APK or App Bundle',
          'Fill in the store listing details, including screenshots, descriptions, and pricing',
          'Submit for review',
        ]),
        const DocHeading('iOS'),
        const DocParagraph(
          'To deploy your F3 Stack application to the Apple App Store:',
        ),
        const DocList([
          'Enroll in the Apple Developer Program',
          'Configure app signing in Xcode',
          'Create an App ID in the Apple Developer Portal',
          'Create a provisioning profile',
          'Build the release IPA:',
        ]),
        const DocCodeBlock('''
flutter build ios --release
'''),
        const DocList(['Open the Xcode workspace:']),
        const DocCodeBlock(''''
open ios/Runner.xcworkspace
'''),
        const DocList([
          'Archive the application in Xcode',
          'Create a new application in App Store Connect',
          'Upload the build using Xcode or Application Loader',
          'Fill in the store listing details, including screenshots, descriptions, and pricing',
          'Submit for review',
        ]),
        const DocHeading('Web Deployment'),
        const DocParagraph(
          'F3 Stack applications can be deployed to the web using Firebase Hosting or other web hosting services.',
        ),
        const DocSubheading('Firebase Hosting'),
        const DocParagraph(
          'To deploy your F3 Stack application to Firebase Hosting:',
        ),
        const DocList(['Build the web version of your app:']),
        const DocCodeBlock('''flutter build web --release'''),
        const DocList(['Install the Firebase CLI if you haven\tt already:']),
        const DocCodeBlock('''npm install -g firebase-tools'''),
        const DocList(['Log in to Firebase:']),
        const DocCodeBlock('''firebase login'''),
        const DocList(['Initialize Firebase Hosting:']),
        const DocCodeBlock('firebase init hosting'),
        const DocList([
          'When prompted, select the Firebase project you created for your app',
          'Set the public directory to build/web',
          'Configure as a single-page app: Yes',
          'Deploy to Firebase Hosting:',
        ]),
        const DocCodeBlock('''firebase deploy --only hosting'''),
        const DocSubheading('Other Web Hosting Services'),
        const DocParagraph(
          'You can also deploy your F3 Stack web application to other hosting services like Vercel, Netlify, or GitHub Pages. The general process is:',
        ),
        const DocList(['Build the web version of your app:']),
        const DocCodeBlock('''flutter build web --release'''),
        const DocList([
          'Upload the contents of the build/web directory to your hosting service',
          'Configure your hosting service to handle single-page applications (SPA) by redirecting all requests to index.html',
        ]),
        const DocHeading('Desktop Deployment'),
        const DocParagraph(
          'F3 Stack applications can be deployed to desktop platforms including Windows, macOS, and Linux.',
        ),
        const DocSubheading('Windows'),
        const DocParagraph('To build a Windows executable:'),
        const DocCodeBlock('''flutter build windows --release'''),
        const DocParagraph(
          'The executable will be in build/windows/runner/Release.',
        ),
        const DocSubheading('macOS'),
        const DocParagraph('To build a macOS application:'),
        const DocCodeBlock('''flutter build macos --release'''),
        const DocParagraph(
          'The application will be in build/macos/Build/Products/Release.',
        ),
        const DocSubheading('Linux'),
        const DocParagraph('To build a Linux application:'),
        const DocCodeBlock('''flutter build linux --release'''),
        const DocParagraph(
          'The application will be in build/linux/x64/release/bundle.',
        ),
        const DocHeading('Continuous Integration and Deployment (CI/CD)'),
        const DocParagraph(
          'F3 Stack applications can benefit from CI/CD pipelines to automate the build and deployment process. Popular CI/CD services for Flutter include:',
        ),
        const DocList([
          'GitHub Actions: Integrated with GitHub repositories',
          'Codemagic: Specialized for Flutter applications',
          'Bitrise: Mobile-focused CI/CD platform',
          'CircleCI: General-purpose CI/CD platform',
        ]),
        const DocParagraph(
          'A typical CI/CD pipeline for an F3 Stack application might include:',
        ),
        const DocList([
          'Running tests on every pull request',
          'Building the application for all target platforms',
          'Deploying to a staging environment for testing',
          'Deploying to production after approval',
        ]),
        const DocHeading('Environment Configuration'),
        const DocParagraph(
          'F3 Stack applications often need different configurations for development, staging, and production environments. You can manage environment-specific configuration using:',
        ),
        const DocList([
          'Firebase Remote Config: For dynamic configuration that can be updated without deploying a new version',
          'Environment Variables: For build-time configuration',
          'Flavor System: For building different versions of your app with different configurations',
        ]),
        const DocCodeBlock('''
# Example of building with a specific flavor
flutter build apk --flavor production --dart-define=ENVIRONMENT=production'''),
        const DocHeading('Best Practices'),
        const DocParagraph(
          'When deploying F3 Stack applications, follow these best practices:',
        ),
        const DocList([
          'Version Management: Use semantic versioning for your app versions',
          'Release Notes: Maintain detailed release notes for each version',
          'Testing: Thoroughly test your app on all target platforms before deployment',
          'Monitoring: Set up crash reporting and analytics to monitor app performance',
          'Gradual Rollout: Use phased releases to gradually roll out updates to users',
          'Backup: Keep backups of your signing keys and important configuration files',
        ]),
        const DocHeading('Next Steps'),
        const DocParagraph(
          'Now that you understand how to deploy F3 Stack applications, you can explore:',
        ),
        Row(
          children: [
            DocLink('Testing', '/docs/testing'),
            const Text(
              ' - Learn how to test your F3 Stack application before deployment',
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            DocLink('Dependency Overrides', '/docs/dependency'),
            const Text(
              ' - Understand how dependency overrides affect deployment',
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            DocLink('CLI', '/docs/overview'),
            const Text(
              ' - Learn how the F3 CLI can help with deployment setup',
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
