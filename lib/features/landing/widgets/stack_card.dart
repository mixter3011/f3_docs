import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class StackCard extends StatefulWidget {
  final String title;
  final String description;
  final List<Color> gradientColors;
  final String? route;
  final String? url;
  final String backgroundImage;

  const StackCard({
    super.key,
    required this.title,
    required this.description,
    required this.gradientColors,
    this.route,
    this.url,
    required this.backgroundImage,
  }) : assert(
         route != null || url != null,
         'Either route or url must be provided',
       );

  @override
  State<StackCard> createState() => _StackCardState();
}

class _StackCardState extends State<StackCard> {
  bool isHovered = false;

  Future<void> _launch() async {
    if (widget.url != null) {
      final Uri url = Uri.parse(widget.url!);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    }
  }

  void _nav() {
    if (widget.route != null) {
      GoRouter.of(context).go(widget.route!);
    } else if (widget.url != null) {
      _launch();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(widget.backgroundImage),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.gradientColors[0].withOpacity(
                isHovered ? 0.6 : 0.2,
              ),
              blurRadius: isHovered ? 15 : 8,
              spreadRadius: isHovered ? 3 : 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                      isHovered
                          ? widget.gradientColors[0]
                          : Colors.grey.shade700,
                  width: isHovered ? 2 : 1,
                ),
                boxShadow:
                    isHovered
                        ? [
                          BoxShadow(
                            color: widget.gradientColors[0].withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 0,
                            blurStyle: BlurStyle.inner,
                          ),
                        ]
                        : [],
              ),
              padding: const EdgeInsets.all(24),
              constraints: const BoxConstraints(minHeight: 250),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: ShadTheme.of(context).textTheme.h2.copyWith(
                      color:
                          isHovered ? widget.gradientColors[0] : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      widget.description,
                      style: ShadTheme.of(context).textTheme.lead,
                    ),
                  ),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: _nav,
                    child: Row(
                      children: [
                        Text(
                          widget.url != null ? 'Visit website' : 'Learn more',
                          style: TextStyle(
                            color: widget.gradientColors[0],
                            fontSize: 16,
                            fontWeight:
                                isHovered ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          widget.url != null
                              ? Icons.open_in_new
                              : Icons.arrow_forward,
                          size: 16,
                          color: widget.gradientColors[0],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
