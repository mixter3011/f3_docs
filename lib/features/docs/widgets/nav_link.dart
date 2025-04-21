import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavLink extends StatefulWidget {
  final String title;
  final String path;
  final bool isActive;

  const NavLink(this.title, this.path, {super.key, this.isActive = false});

  @override
  State<NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<NavLink> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).go(widget.path);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          margin: const EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            color:
                isHovering
                    ? Theme.of(context).brightness == Brightness.dark
                        ? Colors.white.withOpacity(0.05)
                        : Colors.grey.withOpacity(0.05)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
              color:
                  widget.isActive
                      ? Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Theme.of(context).primaryColor
                      : Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[300]
                      : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }
}
