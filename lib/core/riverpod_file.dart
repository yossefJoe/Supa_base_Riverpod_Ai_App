import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarIndexNotifier extends StateNotifier<int> {
  NavBarIndexNotifier() : super(0); // Initial index is 0

  void setIndex(int newIndex) {
    state = newIndex; // Update state when tab is changed
  }
}

// Define a provider for the Bottom Navigation Bar
final navBarIndexProvider =
    StateNotifierProvider<NavBarIndexNotifier, int>((ref) => NavBarIndexNotifier());