import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final testProvider = StateProvider<bool>((ref) => true);

final scrrenProvider = StateProvider<bool>((ref) => false);

final authProvider = StateProvider<bool>((ref) => false);
