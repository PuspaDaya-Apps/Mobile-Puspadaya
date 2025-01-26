import 'package:flutter/material.dart';

List<BoxShadow> boxShadowSm() {
  return [
    BoxShadow(
      blurRadius: 2,
      offset: Offset(0, 1),
      color: Colors.black.withOpacity(0.05),
    ),
  ];
}

List<BoxShadow> boxShadow() {
  return [
    BoxShadow(
      blurRadius: 3,
      offset: Offset(0, 1),
      color: Colors.black.withOpacity(0.1),
    ),
    BoxShadow(
      blurRadius: 2,
      offset: Offset(0, 1),
      color: Colors.black.withOpacity(0.1),
    ),
  ];
}

List<BoxShadow> boxShadowMd() {
  return [
    BoxShadow(
      blurRadius: 6,
      offset: Offset(0, 4),
      color: Colors.black.withOpacity(0.1),
    ),
    BoxShadow(
      blurRadius: 4,
      offset: Offset(0, 2),
      color: Colors.black.withOpacity(0.1),
    ),
  ];
}

List<BoxShadow> boxShadowLg() {
  return [
    BoxShadow(
      blurRadius: 15,
      offset: Offset(0, 10),
      color: Colors.black.withOpacity(0.1),
    ),
    BoxShadow(
      blurRadius: 6,
      offset: Offset(0, 4),
      color: Colors.black.withOpacity(0.1),
    ),
  ];
}

List<BoxShadow> boxShadowXl() {
  return [
    BoxShadow(
      blurRadius: 25,
      offset: Offset(0, 20),
      color: Colors.black.withOpacity(0.1),
    ),
    BoxShadow(
      blurRadius: 10,
      offset: Offset(0, 8),
      color: Colors.black.withOpacity(0.1),
    ),
  ];
}

List<BoxShadow> boxShadow2xl() {
  return [
    BoxShadow(
      blurRadius: 50,
      offset: Offset(0, 25),
      color: Colors.black.withOpacity(0.25),
    ),
  ];
}

List<BoxShadow> boxShadowInner() {
  return [
    BoxShadow(
      blurRadius: 4,
      offset: Offset(0, 2),
      color: Colors.black.withOpacity(0.05),
      spreadRadius: 0,
      blurStyle: BlurStyle.inner,
    ),
  ];
}
