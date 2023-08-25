import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pagina_actual_provider.g.dart';

@riverpod
class PaginaActual extends _$PaginaActual {
  @override
  int build() {
    return 0;
  }

  void cambiarPagina(int pagina) {
    state = pagina;
  }
}
