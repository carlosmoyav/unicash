// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimientos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addMovimientoHash() => r'0add5f670b102e254787291e341650480eecc8f5';

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

typedef AddMovimientoRef = AutoDisposeFutureProviderRef<String?>;

/// See also [addMovimiento].
@ProviderFor(addMovimiento)
const addMovimientoProvider = AddMovimientoFamily();

/// See also [addMovimiento].
class AddMovimientoFamily extends Family<AsyncValue<String?>> {
  /// See also [addMovimiento].
  const AddMovimientoFamily();

  /// See also [addMovimiento].
  AddMovimientoProvider call(
    String categoria,
    String monto,
    String tipo,
    DateTime fecha,
    String descripcion,
    String metodoPago,
  ) {
    return AddMovimientoProvider(
      categoria,
      monto,
      tipo,
      fecha,
      descripcion,
      metodoPago,
    );
  }

  @override
  AddMovimientoProvider getProviderOverride(
    covariant AddMovimientoProvider provider,
  ) {
    return call(
      provider.categoria,
      provider.monto,
      provider.tipo,
      provider.fecha,
      provider.descripcion,
      provider.metodoPago,
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
  String? get name => r'addMovimientoProvider';
}

/// See also [addMovimiento].
class AddMovimientoProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [addMovimiento].
  AddMovimientoProvider(
    this.categoria,
    this.monto,
    this.tipo,
    this.fecha,
    this.descripcion,
    this.metodoPago,
  ) : super.internal(
          (ref) => addMovimiento(
            ref,
            categoria,
            monto,
            tipo,
            fecha,
            descripcion,
            metodoPago,
          ),
          from: addMovimientoProvider,
          name: r'addMovimientoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addMovimientoHash,
          dependencies: AddMovimientoFamily._dependencies,
          allTransitiveDependencies:
              AddMovimientoFamily._allTransitiveDependencies,
        );

  final String categoria;
  final String monto;
  final String tipo;
  final DateTime fecha;
  final String descripcion;
  final String metodoPago;

  @override
  bool operator ==(Object other) {
    return other is AddMovimientoProvider &&
        other.categoria == categoria &&
        other.monto == monto &&
        other.tipo == tipo &&
        other.fecha == fecha &&
        other.descripcion == descripcion &&
        other.metodoPago == metodoPago;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoria.hashCode);
    hash = _SystemHash.combine(hash, monto.hashCode);
    hash = _SystemHash.combine(hash, tipo.hashCode);
    hash = _SystemHash.combine(hash, fecha.hashCode);
    hash = _SystemHash.combine(hash, descripcion.hashCode);
    hash = _SystemHash.combine(hash, metodoPago.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$obtenerAllTransaccionsHash() =>
    r'5af8444a6f5cd840462ae9c9670d56112d9f851c';

/// See also [obtenerAllTransaccions].
@ProviderFor(obtenerAllTransaccions)
final obtenerAllTransaccionsProvider =
    AutoDisposeFutureProvider<List<Transaction>>.internal(
  obtenerAllTransaccions,
  name: r'obtenerAllTransaccionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$obtenerAllTransaccionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ObtenerAllTransaccionsRef
    = AutoDisposeFutureProviderRef<List<Transaction>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
