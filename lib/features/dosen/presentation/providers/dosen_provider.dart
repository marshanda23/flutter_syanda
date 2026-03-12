import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/dosen_model.dart';
import '../../data/repositories/dosen_repository.dart';

final dosenRepositoryProvider = Provider<DosenRepository>((ref) {
  return DosenRepository();
});

class DosenNotifier extends AutoDisposeAsyncNotifier<List<DosenModel>> {
  @override
  Future<List<DosenModel>> build() async {
    return ref.read(dosenRepositoryProvider).getDosenList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final data = await ref.read(dosenRepositoryProvider).getDosenList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final dosenNotifierProvider =
    AutoDisposeAsyncNotifierProvider<DosenNotifier, List<DosenModel>>(
  DosenNotifier.new,
);