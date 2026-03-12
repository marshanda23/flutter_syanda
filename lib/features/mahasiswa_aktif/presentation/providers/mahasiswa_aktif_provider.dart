import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/mahasiswa_aktif_model.dart';
import '../../data/repositories/mahasiswa_aktif_repository.dart';

final mahasiswaAktifRepositoryProvider =
    Provider<MahasiswaAktifRepository>((ref) {
  return MahasiswaAktifRepository();
});

class MahasiswaAktifNotifier
    extends AutoDisposeAsyncNotifier<List<MahasiswaAktifModel>> {
  @override
  Future<List<MahasiswaAktifModel>> build() async {
    return ref
        .read(mahasiswaAktifRepositoryProvider)
        .getMahasiswaAktifList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final data = await ref
          .read(mahasiswaAktifRepositoryProvider)
          .getMahasiswaAktifList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final mahasiswaAktifNotifierProvider =
    AutoDisposeAsyncNotifierProvider<MahasiswaAktifNotifier,
        List<MahasiswaAktifModel>>(
  MahasiswaAktifNotifier.new,
);