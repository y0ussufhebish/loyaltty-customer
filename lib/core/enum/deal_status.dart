import 'package:flutter/material.dart';

enum DealStatus{
  active(Color(0xFF159F3C)),
  upcoming(Color(0xFFF0AF08)),
  past(Color(0xFFA4A4A4));

  final Color statusColor;

  const DealStatus(this.statusColor);
}