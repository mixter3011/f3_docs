import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CodeBlock extends StatefulWidget {
  const CodeBlock({super.key});

  @override
  State<CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<CodeBlock> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth >= 768;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade700),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('f3-stack create', style: ShadTheme.of(context).textTheme.p),
          Image.asset('assets/images/ascii-art.png'),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('|→'),
              const SizedBox(width: 4),
              Text('?', style: TextStyle(color: Colors.green.shade400)),
              const SizedBox(width: 4),
              Text('What will your project be called? f3auth'),
            ],
          ),
          Row(
            children: [
              Text('Using:', style: TextStyle(color: Colors.cyan.shade200)),
              const SizedBox(width: 2),
              Text('flutter create f3auth'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('✓', style: TextStyle(color: Colors.green.shade400)),
              const SizedBox(width: 4),
              Text('f3-stack', style: TextStyle(color: Colors.cyan.shade200)),
              const SizedBox(width: 4),
              Text('f3auth'),
              const SizedBox(width: 4),
              Text(
                'scaffolded successfully!',
                style: TextStyle(color: Colors.green.shade400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('|→'),
              const SizedBox(width: 4),
              Text('〄'),
              const SizedBox(width: 4),
              Text(
                'Installing dependencies...',
                style: TextStyle(color: Colors.cyan.shade200),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 38),
              Text('['),
              const SizedBox(width: 4),
              Text(
                '✓ Successfully installed dependencies!',
                style: TextStyle(color: Colors.green.shade400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('|→'),
              const SizedBox(width: 4),
              Text('〄'),
              const SizedBox(width: 4),
              Text(
                'Generating folder structure...',
                style: TextStyle(color: Colors.cyan.shade200),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 38),
              Text('['),
              const SizedBox(width: 4),
              Text(
                '✓ Successfully created folder structure!',
                style: TextStyle(color: Colors.green.shade400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('|→'),
              const SizedBox(width: 4),
              Text('〄'),
              const SizedBox(width: 4),
              Text(
                'Adding Assets...',
                style: TextStyle(color: Colors.cyan.shade200),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 38),
              Text('['),
              const SizedBox(width: 4),
              Text(
                '✓ Successfully added assets!',
                style: TextStyle(color: Colors.green.shade400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('|→'),
              const SizedBox(width: 4),
              Text('〄'),
              const SizedBox(width: 4),
              Text(
                'Updating logs...',
                style: TextStyle(color: Colors.cyan.shade200),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 38),
              Text('['),
              const SizedBox(width: 4),
              Text(
                '✓ Successfully updated logs!',
                style: TextStyle(color: Colors.green.shade400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('|→'),
              const SizedBox(width: 4),
              Text('〄'),
              const SizedBox(width: 4),
              Text(
                'Adding boilerplate...',
                style: TextStyle(color: Colors.cyan.shade200),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 38),
              Text('['),
              const SizedBox(width: 4),
              Text(
                '✓ Successfully added boilerplate codes for auth!',
                style: TextStyle(
                  color: Colors.green.shade400,
                  fontSize: isWideScreen ? null : 11,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 38),
              Text('['),
              const SizedBox(width: 4),
              Text(
                '✓ Successfully added boilerplate codes for layout!',
                style: TextStyle(
                  color: Colors.green.shade400,
                  fontSize: isWideScreen ? null : 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('|→'),
              const SizedBox(width: 4),
              Text('〄'),
              const SizedBox(width: 4),
              Text(
                'Updating Info.plist file...',
                style: TextStyle(color: Colors.cyan.shade200),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 38),
              Text('['),
              const SizedBox(width: 4),
              Text(
                '✓ Successfully updated Info.plist!',
                style: TextStyle(color: Colors.green.shade400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('|→'),
              const SizedBox(width: 4),
              Text('〄'),
              const SizedBox(width: 4),
              Text(
                'Running build_runner...',
                style: TextStyle(color: Colors.cyan.shade200),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 38),
              Text('['),
              const SizedBox(width: 4),
              Text(
                '✓ Successfully ran build_runner!',
                style: TextStyle(color: Colors.green.shade400),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 38),
              Text('['),
              const SizedBox(width: 4),
              Text(
                '✓ Successfully generated freezed files!',
                style: TextStyle(color: Colors.green.shade400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('['),
              const SizedBox(width: 4),
              Text(
                '✓ Project scaffolded successfully!',
                style: TextStyle(color: Colors.green.shade400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text('Next steps:', style: TextStyle(color: Colors.cyan.shade200)),
          Row(
            children: [
              const SizedBox(width: 18),
              Text('cd f3auth', style: TextStyle(color: Colors.green.shade400)),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 18),
              Text(
                'flutter run',
                style: TextStyle(color: Colors.green.shade400),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 18),
              Text(
                'Connect to Firebase: https://console.firebase.google.com',
                style: TextStyle(
                  color: Colors.green.shade400,
                  fontSize: isWideScreen ? null : 10.9,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
