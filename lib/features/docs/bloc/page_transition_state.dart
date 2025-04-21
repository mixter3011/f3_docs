import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PageTransitionState extends Equatable {
  const PageTransitionState();

  @override
  List<Object?> get props => [];
}

class PageDisplayed extends PageTransitionState {
  final Widget content;

  const PageDisplayed(this.content);

  @override
  List<Object?> get props => [content.hashCode];
}

class PageTransitioning extends PageTransitionState {
  final bool isExiting;
  final Widget content;

  const PageTransitioning({required this.isExiting, required this.content});

  @override
  List<Object?> get props => [isExiting, content.hashCode];
}

class TransitionLoading extends PageTransitioning {
  const TransitionLoading({required super.isExiting, required super.content});
}
