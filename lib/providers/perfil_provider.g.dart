// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$actualizarFotoPerfilHash() =>
    r'd90c48614f6f8be8ca3108799e559c7836d1223d';

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

typedef ActualizarFotoPerfilRef = AutoDisposeFutureProviderRef<Respuesta>;

/// See also [actualizarFotoPerfil].
@ProviderFor(actualizarFotoPerfil)
const actualizarFotoPerfilProvider = ActualizarFotoPerfilFamily();

/// See also [actualizarFotoPerfil].
class ActualizarFotoPerfilFamily extends Family<AsyncValue<Respuesta>> {
  /// See also [actualizarFotoPerfil].
  const ActualizarFotoPerfilFamily();

  /// See also [actualizarFotoPerfil].
  ActualizarFotoPerfilProvider call(
    XFile foto,
  ) {
    return ActualizarFotoPerfilProvider(
      foto,
    );
  }

  @override
  ActualizarFotoPerfilProvider getProviderOverride(
    covariant ActualizarFotoPerfilProvider provider,
  ) {
    return call(
      provider.foto,
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
  String? get name => r'actualizarFotoPerfilProvider';
}

/// See also [actualizarFotoPerfil].
class ActualizarFotoPerfilProvider
    extends AutoDisposeFutureProvider<Respuesta> {
  /// See also [actualizarFotoPerfil].
  ActualizarFotoPerfilProvider(
    this.foto,
  ) : super.internal(
          (ref) => actualizarFotoPerfil(
            ref,
            foto,
          ),
          from: actualizarFotoPerfilProvider,
          name: r'actualizarFotoPerfilProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$actualizarFotoPerfilHash,
          dependencies: ActualizarFotoPerfilFamily._dependencies,
          allTransitiveDependencies:
              ActualizarFotoPerfilFamily._allTransitiveDependencies,
        );

  final XFile foto;

  @override
  bool operator ==(Object other) {
    return other is ActualizarFotoPerfilProvider && other.foto == foto;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, foto.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$editarUsuarioHash() => r'03cd10ac7ceae1d5c1c4c1a62b81359a0c813903';
typedef EditarUsuarioRef = AutoDisposeFutureProviderRef<Respuesta>;

/// See also [editarUsuario].
@ProviderFor(editarUsuario)
const editarUsuarioProvider = EditarUsuarioFamily();

/// See also [editarUsuario].
class EditarUsuarioFamily extends Family<AsyncValue<Respuesta>> {
  /// See also [editarUsuario].
  const EditarUsuarioFamily();

  /// See also [editarUsuario].
  EditarUsuarioProvider call(
    String nombres,
    String apellidos,
    String fechaNacimiento,
    String correo,
  ) {
    return EditarUsuarioProvider(
      nombres,
      apellidos,
      fechaNacimiento,
      correo,
    );
  }

  @override
  EditarUsuarioProvider getProviderOverride(
    covariant EditarUsuarioProvider provider,
  ) {
    return call(
      provider.nombres,
      provider.apellidos,
      provider.fechaNacimiento,
      provider.correo,
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
  String? get name => r'editarUsuarioProvider';
}

/// See also [editarUsuario].
class EditarUsuarioProvider extends AutoDisposeFutureProvider<Respuesta> {
  /// See also [editarUsuario].
  EditarUsuarioProvider(
    this.nombres,
    this.apellidos,
    this.fechaNacimiento,
    this.correo,
  ) : super.internal(
          (ref) => editarUsuario(
            ref,
            nombres,
            apellidos,
            fechaNacimiento,
            correo,
          ),
          from: editarUsuarioProvider,
          name: r'editarUsuarioProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editarUsuarioHash,
          dependencies: EditarUsuarioFamily._dependencies,
          allTransitiveDependencies:
              EditarUsuarioFamily._allTransitiveDependencies,
        );

  final String nombres;
  final String apellidos;
  final String fechaNacimiento;
  final String correo;

  @override
  bool operator ==(Object other) {
    return other is EditarUsuarioProvider &&
        other.nombres == nombres &&
        other.apellidos == apellidos &&
        other.fechaNacimiento == fechaNacimiento &&
        other.correo == correo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nombres.hashCode);
    hash = _SystemHash.combine(hash, apellidos.hashCode);
    hash = _SystemHash.combine(hash, fechaNacimiento.hashCode);
    hash = _SystemHash.combine(hash, correo.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
