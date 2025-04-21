import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f3_docs/features/docs/bloc/page_transition_event.dart';
import 'package:f3_docs/features/docs/bloc/page_transition_state.dart';

class PageTransitionBloc
    extends Bloc<PageTransitionEvent, PageTransitionState> {
  PageTransitionBloc(Widget initialContent)
    : super(PageDisplayed(initialContent)) {
    on<PageChanged>(_onPageChanged);
  }

  Future<void> _onPageChanged(
    PageChanged event,
    Emitter<PageTransitionState> emit,
  ) async {
    if (state is PageDisplayed) {
      final currentState = state as PageDisplayed;
      if (currentState.content.hashCode != event.newContent.hashCode) {
        emit(PageTransitioning(isExiting: true, content: currentState.content));

        await Future.delayed(const Duration(milliseconds: 200));

        emit(TransitionLoading(isExiting: false, content: event.newContent));

        await Future.delayed(const Duration(milliseconds: 300));

        emit(PageTransitioning(isExiting: false, content: event.newContent));

        await Future.delayed(const Duration(milliseconds: 200));

        emit(PageDisplayed(event.newContent));
      }
    }
  }
}
