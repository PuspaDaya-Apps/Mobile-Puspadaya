import 'package:flutter/material.dart';

List<BoxShadow> shadowSm = [
  BoxShadow(
    color: Colors.black.withOpacity(0.05), // Transparansi rendah
    blurRadius: 4,
    spreadRadius: 1,
    offset: Offset(0, 2),
  ),
];

List<BoxShadow> shadowMd = [
  BoxShadow(
    color: Colors.black.withOpacity(0.1), // Lebih terlihat dari sm
    blurRadius: 8,
    spreadRadius: 2,
    offset: Offset(0, 4),
  ),
];

List<BoxShadow> shadowLg = [
  BoxShadow(
    color: Colors.black.withOpacity(0.15), // Shadow lebih kuat
    blurRadius: 16,
    spreadRadius: 4,
    offset: Offset(0, 8),
  ),
];

List<BoxShadow> shadowXl = [
  BoxShadow(
    color: Colors.black.withOpacity(0.2), // Shadow tebal
    blurRadius: 32,
    spreadRadius: 8,
    offset: Offset(0, 16),
  ),
];
