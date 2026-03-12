import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/dashboard_model.dart';
import '../../data/repositories/dashboard_repository.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository();
});

class DashboardNotifier extends AutoDisposeAsyncNotifier<DashboardData> {
  @override
  Future<DashboardData> build() async {
    return ref.read(dashboardRepositoryProvider).getDashboardData();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final data = await ref.read(dashboardRepositoryProvider).getDashboardData();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final dashboardNotifierProvider =
    AutoDisposeAsyncNotifierProvider<DashboardNotifier, DashboardData>(
  DashboardNotifier.new,
);

/// Selected Stat Provider
final selectedStatIndexProvider = StateProvider<int>((ref) => 0);

/// Theme Mode Provider
final themeModeProvider = StateProvider<bool>(
  (ref) => false,
); // false = light, true = dark