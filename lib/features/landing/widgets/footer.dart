import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width >= 768;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isWideScreen ? 0 : 24,
        horizontal: 16,
      ),
      height: isWideScreen ? 96 : null,
      child:
          isWideScreen
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buildtext(), _buildlinks()],
              )
              : Column(
                children: [
                  _buildtext(),
                  const SizedBox(height: 16),
                  _buildlinks(),
                ],
              ),
    );
  }

  Widget _buildtext() {
    return Text.rich(
      TextSpan(
        text: 'Built with Flutter. The source code is available on ',
        style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        children: [
          TextSpan(
            text: 'GitHub',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationThickness: 1.5,
              decorationColor: Colors.grey.shade400,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap =
                      () =>
                          _launchURL('https://github.com/mixter3011/f3-stack'),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }

  Widget _buildlinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            'Documentation',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationThickness: 1.5,
            ),
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () => _launchURL('https://github.com/mixter3011'),
          child: Text(
            'GitHub',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationThickness: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
