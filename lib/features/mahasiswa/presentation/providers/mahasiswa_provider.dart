import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/mahasiswa_model.dart';
import '../../data/repositories/mahasiswa_repository.dart';

final mahasiswaRepositoryProvider = Provider<MahasiswaRepository>((ref) {
  return MahasiswaRepository();
});

class MahasiswaNotifier extends AutoDisposeAsyncNotifier<List<MahasiswaModel>> {
  @override
  Future<List<MahasiswaModel>> build() async {
    return ref.read(mahasiswaRepositoryProvider).getMahasiswaList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final data = await ref.read(mahasiswaRepositoryProvider).getMahasiswaList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final mahasiswaNotifierProvider =
    AutoDisposeAsyncNotifierProvider<MahasiswaNotifier, List<MahasiswaModel>>(
  MahasiswaNotifier.new,
);