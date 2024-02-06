import 'package:flutter_riverpod/flutter_riverpod.dart';

// final readOnlyProvider = StateProvider<bool>((ref) => true);
final readOnlyProvider = StateProvider.family<bool, String>((ref, id) => true);