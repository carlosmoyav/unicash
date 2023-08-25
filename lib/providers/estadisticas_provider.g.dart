// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estadisticas_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$obtenerEstadisticasHash() =>
    r'5a3326f506e72b5bfeecb6f591849499f187cb26';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef ObtenerEstadisticasRef
    = AutoDisposeFutureProviderRef<List<Transaction>>;

/// See also [obtenerEstadisticas].
@ProviderFor(obtenerEstadisticas)
const obtenerEstadisticasProvider = ObtenerEstadisticasFamily();

/// See also [obtenerEstadisticas].
class ObtenerEstadisticasFamily extends Family<AsyncValue<List<Transaction>>> {
  /// See also [obtenerEstadisticas].
  const ObtenerEstadisticasFamily();

  /// See also [obtenerEstadisticas].
  ObtenerEstadisticasProvider call({
    required String tipo,
    required String rango,
  }) {
    return ObtenerEstadisticasProvider(
      tipo: tipo,
      rango: rango,
    );
  }

  @override
  ObtenerEstadisticasProvider getProviderOverride(
    covariant ObtenerEstadisticasProvider provider,
  ) {
    return call(
      tipo: provider.tipo,
      rango: provider.rango,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'obtenerEstadisticasProvider';
}

/// See also [obtenerEstadisticas].
class ObtenerEstadisticasProvider
    extends AutoDisposeFutureProvider<List<Transaction>> {
  /// See also [obtenerEstadisticas].
  ObtenerEstadisticasProvider({
    required this.tipo,
    required this.rango,
  }) : super.internal(
          (ref) => obtenerEstadisticas(
            ref,
            tipo: tipo,
            rango: rango,
          ),
          from: obtenerEstadisticasProvider,
          name: r'obtenerEstadisticasProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$obtenerEstadisticasHash,
          dependencies: ObtenerEstadisticasFamily._dependencies,
          allTransitiveDependencies:
              ObtenerEstadisticasFamily._allTransitiveDependencies,
        );

  final String tipo;
  final String rango;

  @override
  bool operator ==(Object other) {
    return other is ObtenerEstadisticasProvider &&
        other.tipo == tipo &&
        other.rango == rango;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tipo.hashCode);
    hash = _SystemHash.combine(hash, rango.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
