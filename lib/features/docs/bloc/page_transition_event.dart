import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PageTransitionEvent extends Equatable {
  const PageTransitionEvent();

  @override
  List<Object?> get props => [];
}

class PageChanged extends PageTransitionEvent {
  final Widget newContent;

  const PageChanged(this.newContent);

  @override
  List<Object?> get props => [newContent.hashCode];
}
