import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DocList extends StatelessWidget {
  final List<String> items;
  final bool isOrdered;

  const DocList(this.items, {this.isOrdered = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            items.asMap().entries.map((entry) {
              final item = entry.value;

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isOrdered)
                      SizedBox(
                        width: 12,
                        child: Text(
                          '•',
                          style: ShadTheme.of(context).textTheme.h4,
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 8),
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    Expanded(
                      child: Text(
                        item,
                        style: ShadTheme.of(context).textTheme.list,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
