import 'package:f3_docs/features/docs/bloc/page_transition_bloc.dart';
import 'package:f3_docs/features/docs/bloc/page_transition_event.dart';
import 'package:f3_docs/features/docs/bloc/page_transition_state.dart';
import 'package:f3_docs/features/docs/widgets/doc_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocsLayout extends StatefulWidget {
  final Widget child;

  const DocsLayout({super.key, required this.child});

  @override
  State<DocsLayout> createState() => _DocsLayoutState();
}

class _DocsLayoutState extends State<DocsLayout> {
  late PageTransitionBloc _pageTransitionBloc;

  @override
  void initState() {
    super.initState();
    _pageTransitionBloc = PageTransitionBloc(widget.child);
  }

  @override
  void didUpdateWidget(DocsLayout oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.child.hashCode != oldWidget.child.hashCode) {
      _pageTransitionBloc.add(PageChanged(widget.child));
    }
  }

  @override
  void dispose() {
    _pageTransitionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _pageTransitionBloc,
      child: Scaffold(
        body: Row(
          children: [
            const DocsSidebar(),
            Expanded(
              child: ClipRect(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 20,
                    bottom: 40,
                  ),
                  physics: const ClampingScrollPhysics(),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      width: double.infinity,
                      child: BlocBuilder<
                        PageTransitionBloc,
                        PageTransitionState
                      >(
                        builder: (context, state) {
                          if (state is PageDisplayed) {
                            return AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: 1.0,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                child: IntrinsicHeight(child: state.content),
                              ),
                            );
                          } else if (state is PageTransitioning) {
                            if (!state.isExiting &&
                                state is TransitionLoading) {
                              return Center(
                                child: Container(
                                  height: 400,
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(),
                                ),
                              );
                            }
                            return AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: state.isExiting ? 0.0 : 1.0,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                child: IntrinsicHeight(child: state.content),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
