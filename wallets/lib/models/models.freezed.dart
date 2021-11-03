// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return _Wallet.fromJson(json);
}

/// @nodoc
class _$WalletTearOff {
  const _$WalletTearOff();

  _Wallet call(
      {required String publicAddress,
      required String organizationId,
      required String name}) {
    return _Wallet(
      publicAddress: publicAddress,
      organizationId: organizationId,
      name: name,
    );
  }

  Wallet fromJson(Map<String, Object?> json) {
    return Wallet.fromJson(json);
  }
}

/// @nodoc
const $Wallet = _$WalletTearOff();

/// @nodoc
mixin _$Wallet {
  String get publicAddress => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res>;
  $Res call({String publicAddress, String organizationId, String name});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res> implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  final Wallet _value;
  // ignore: unused_field
  final $Res Function(Wallet) _then;

  @override
  $Res call({
    Object? publicAddress = freezed,
    Object? organizationId = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      publicAddress: publicAddress == freezed
          ? _value.publicAddress
          : publicAddress // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$WalletCopyWith(_Wallet value, $Res Function(_Wallet) then) =
      __$WalletCopyWithImpl<$Res>;
  @override
  $Res call({String publicAddress, String organizationId, String name});
}

/// @nodoc
class __$WalletCopyWithImpl<$Res> extends _$WalletCopyWithImpl<$Res>
    implements _$WalletCopyWith<$Res> {
  __$WalletCopyWithImpl(_Wallet _value, $Res Function(_Wallet) _then)
      : super(_value, (v) => _then(v as _Wallet));

  @override
  _Wallet get _value => super._value as _Wallet;

  @override
  $Res call({
    Object? publicAddress = freezed,
    Object? organizationId = freezed,
    Object? name = freezed,
  }) {
    return _then(_Wallet(
      publicAddress: publicAddress == freezed
          ? _value.publicAddress
          : publicAddress // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: organizationId == freezed
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Wallet with DiagnosticableTreeMixin implements _Wallet {
  _$_Wallet(
      {required this.publicAddress,
      required this.organizationId,
      required this.name});

  factory _$_Wallet.fromJson(Map<String, dynamic> json) =>
      _$$_WalletFromJson(json);

  @override
  final String publicAddress;
  @override
  final String organizationId;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Wallet(publicAddress: $publicAddress, organizationId: $organizationId, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Wallet'))
      ..add(DiagnosticsProperty('publicAddress', publicAddress))
      ..add(DiagnosticsProperty('organizationId', organizationId))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Wallet &&
            (identical(other.publicAddress, publicAddress) ||
                other.publicAddress == publicAddress) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, publicAddress, organizationId, name);

  @JsonKey(ignore: true)
  @override
  _$WalletCopyWith<_Wallet> get copyWith =>
      __$WalletCopyWithImpl<_Wallet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletToJson(this);
  }
}

abstract class _Wallet implements Wallet {
  factory _Wallet(
      {required String publicAddress,
      required String organizationId,
      required String name}) = _$_Wallet;

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$_Wallet.fromJson;

  @override
  String get publicAddress;
  @override
  String get organizationId;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$WalletCopyWith<_Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$DisplayableWalletTearOff {
  const _$DisplayableWalletTearOff();

  _DisplayableWallet call(
      {required String organizationName,
      required Wallet data,
      required double balance}) {
    return _DisplayableWallet(
      organizationName: organizationName,
      data: data,
      balance: balance,
    );
  }
}

/// @nodoc
const $DisplayableWallet = _$DisplayableWalletTearOff();

/// @nodoc
mixin _$DisplayableWallet {
  String get organizationName => throw _privateConstructorUsedError;
  Wallet get data => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DisplayableWalletCopyWith<DisplayableWallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayableWalletCopyWith<$Res> {
  factory $DisplayableWalletCopyWith(
          DisplayableWallet value, $Res Function(DisplayableWallet) then) =
      _$DisplayableWalletCopyWithImpl<$Res>;
  $Res call({String organizationName, Wallet data, double balance});

  $WalletCopyWith<$Res> get data;
}

/// @nodoc
class _$DisplayableWalletCopyWithImpl<$Res>
    implements $DisplayableWalletCopyWith<$Res> {
  _$DisplayableWalletCopyWithImpl(this._value, this._then);

  final DisplayableWallet _value;
  // ignore: unused_field
  final $Res Function(DisplayableWallet) _then;

  @override
  $Res call({
    Object? organizationName = freezed,
    Object? data = freezed,
    Object? balance = freezed,
  }) {
    return _then(_value.copyWith(
      organizationName: organizationName == freezed
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Wallet,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $WalletCopyWith<$Res> get data {
    return $WalletCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$DisplayableWalletCopyWith<$Res>
    implements $DisplayableWalletCopyWith<$Res> {
  factory _$DisplayableWalletCopyWith(
          _DisplayableWallet value, $Res Function(_DisplayableWallet) then) =
      __$DisplayableWalletCopyWithImpl<$Res>;
  @override
  $Res call({String organizationName, Wallet data, double balance});

  @override
  $WalletCopyWith<$Res> get data;
}

/// @nodoc
class __$DisplayableWalletCopyWithImpl<$Res>
    extends _$DisplayableWalletCopyWithImpl<$Res>
    implements _$DisplayableWalletCopyWith<$Res> {
  __$DisplayableWalletCopyWithImpl(
      _DisplayableWallet _value, $Res Function(_DisplayableWallet) _then)
      : super(_value, (v) => _then(v as _DisplayableWallet));

  @override
  _DisplayableWallet get _value => super._value as _DisplayableWallet;

  @override
  $Res call({
    Object? organizationName = freezed,
    Object? data = freezed,
    Object? balance = freezed,
  }) {
    return _then(_DisplayableWallet(
      organizationName: organizationName == freezed
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Wallet,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_DisplayableWallet
    with DiagnosticableTreeMixin
    implements _DisplayableWallet {
  _$_DisplayableWallet(
      {required this.organizationName,
      required this.data,
      required this.balance});

  @override
  final String organizationName;
  @override
  final Wallet data;
  @override
  final double balance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DisplayableWallet(organizationName: $organizationName, data: $data, balance: $balance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DisplayableWallet'))
      ..add(DiagnosticsProperty('organizationName', organizationName))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('balance', balance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DisplayableWallet &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizationName, data, balance);

  @JsonKey(ignore: true)
  @override
  _$DisplayableWalletCopyWith<_DisplayableWallet> get copyWith =>
      __$DisplayableWalletCopyWithImpl<_DisplayableWallet>(this, _$identity);
}

abstract class _DisplayableWallet implements DisplayableWallet {
  factory _DisplayableWallet(
      {required String organizationName,
      required Wallet data,
      required double balance}) = _$_DisplayableWallet;

  @override
  String get organizationName;
  @override
  Wallet get data;
  @override
  double get balance;
  @override
  @JsonKey(ignore: true)
  _$DisplayableWalletCopyWith<_DisplayableWallet> get copyWith =>
      throw _privateConstructorUsedError;
}

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return _Organization.fromJson(json);
}

/// @nodoc
class _$OrganizationTearOff {
  const _$OrganizationTearOff();

  _Organization call(
      {required String id,
      required String ownerId,
      required String name,
      required String entepriseNumber}) {
    return _Organization(
      id: id,
      ownerId: ownerId,
      name: name,
      entepriseNumber: entepriseNumber,
    );
  }

  Organization fromJson(Map<String, Object?> json) {
    return Organization.fromJson(json);
  }
}

/// @nodoc
const $Organization = _$OrganizationTearOff();

/// @nodoc
mixin _$Organization {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get entepriseNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationCopyWith<Organization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationCopyWith<$Res> {
  factory $OrganizationCopyWith(
          Organization value, $Res Function(Organization) then) =
      _$OrganizationCopyWithImpl<$Res>;
  $Res call({String id, String ownerId, String name, String entepriseNumber});
}

/// @nodoc
class _$OrganizationCopyWithImpl<$Res> implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._value, this._then);

  final Organization _value;
  // ignore: unused_field
  final $Res Function(Organization) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = freezed,
    Object? name = freezed,
    Object? entepriseNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: ownerId == freezed
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entepriseNumber: entepriseNumber == freezed
          ? _value.entepriseNumber
          : entepriseNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$OrganizationCopyWith<$Res>
    implements $OrganizationCopyWith<$Res> {
  factory _$OrganizationCopyWith(
          _Organization value, $Res Function(_Organization) then) =
      __$OrganizationCopyWithImpl<$Res>;
  @override
  $Res call({String id, String ownerId, String name, String entepriseNumber});
}

/// @nodoc
class __$OrganizationCopyWithImpl<$Res> extends _$OrganizationCopyWithImpl<$Res>
    implements _$OrganizationCopyWith<$Res> {
  __$OrganizationCopyWithImpl(
      _Organization _value, $Res Function(_Organization) _then)
      : super(_value, (v) => _then(v as _Organization));

  @override
  _Organization get _value => super._value as _Organization;

  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = freezed,
    Object? name = freezed,
    Object? entepriseNumber = freezed,
  }) {
    return _then(_Organization(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: ownerId == freezed
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entepriseNumber: entepriseNumber == freezed
          ? _value.entepriseNumber
          : entepriseNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Organization with DiagnosticableTreeMixin implements _Organization {
  _$_Organization(
      {required this.id,
      required this.ownerId,
      required this.name,
      required this.entepriseNumber});

  factory _$_Organization.fromJson(Map<String, dynamic> json) =>
      _$$_OrganizationFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String name;
  @override
  final String entepriseNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Organization(id: $id, ownerId: $ownerId, name: $name, entepriseNumber: $entepriseNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Organization'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('ownerId', ownerId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('entepriseNumber', entepriseNumber));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Organization &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.entepriseNumber, entepriseNumber) ||
                other.entepriseNumber == entepriseNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, ownerId, name, entepriseNumber);

  @JsonKey(ignore: true)
  @override
  _$OrganizationCopyWith<_Organization> get copyWith =>
      __$OrganizationCopyWithImpl<_Organization>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrganizationToJson(this);
  }
}

abstract class _Organization implements Organization {
  factory _Organization(
      {required String id,
      required String ownerId,
      required String name,
      required String entepriseNumber}) = _$_Organization;

  factory _Organization.fromJson(Map<String, dynamic> json) =
      _$_Organization.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get name;
  @override
  String get entepriseNumber;
  @override
  @JsonKey(ignore: true)
  _$OrganizationCopyWith<_Organization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DisplayableWalletTransactionTearOff {
  const _$DisplayableWalletTransactionTearOff();

  _DisplayableWalletTransaction call(
      {required String fromOrganizationName,
      required String toOrganizationName,
      required double amount,
      required double isPayment}) {
    return _DisplayableWalletTransaction(
      fromOrganizationName: fromOrganizationName,
      toOrganizationName: toOrganizationName,
      amount: amount,
      isPayment: isPayment,
    );
  }
}

/// @nodoc
const $DisplayableWalletTransaction = _$DisplayableWalletTransactionTearOff();

/// @nodoc
mixin _$DisplayableWalletTransaction {
  String get fromOrganizationName => throw _privateConstructorUsedError;
  String get toOrganizationName => throw _privateConstructorUsedError;
  double get amount =>
      throw _privateConstructorUsedError; // True when [amount] went out of the wallet.
// And false when [amount] went into the wallet.
  double get isPayment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DisplayableWalletTransactionCopyWith<DisplayableWalletTransaction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayableWalletTransactionCopyWith<$Res> {
  factory $DisplayableWalletTransactionCopyWith(
          DisplayableWalletTransaction value,
          $Res Function(DisplayableWalletTransaction) then) =
      _$DisplayableWalletTransactionCopyWithImpl<$Res>;
  $Res call(
      {String fromOrganizationName,
      String toOrganizationName,
      double amount,
      double isPayment});
}

/// @nodoc
class _$DisplayableWalletTransactionCopyWithImpl<$Res>
    implements $DisplayableWalletTransactionCopyWith<$Res> {
  _$DisplayableWalletTransactionCopyWithImpl(this._value, this._then);

  final DisplayableWalletTransaction _value;
  // ignore: unused_field
  final $Res Function(DisplayableWalletTransaction) _then;

  @override
  $Res call({
    Object? fromOrganizationName = freezed,
    Object? toOrganizationName = freezed,
    Object? amount = freezed,
    Object? isPayment = freezed,
  }) {
    return _then(_value.copyWith(
      fromOrganizationName: fromOrganizationName == freezed
          ? _value.fromOrganizationName
          : fromOrganizationName // ignore: cast_nullable_to_non_nullable
              as String,
      toOrganizationName: toOrganizationName == freezed
          ? _value.toOrganizationName
          : toOrganizationName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      isPayment: isPayment == freezed
          ? _value.isPayment
          : isPayment // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$DisplayableWalletTransactionCopyWith<$Res>
    implements $DisplayableWalletTransactionCopyWith<$Res> {
  factory _$DisplayableWalletTransactionCopyWith(
          _DisplayableWalletTransaction value,
          $Res Function(_DisplayableWalletTransaction) then) =
      __$DisplayableWalletTransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String fromOrganizationName,
      String toOrganizationName,
      double amount,
      double isPayment});
}

/// @nodoc
class __$DisplayableWalletTransactionCopyWithImpl<$Res>
    extends _$DisplayableWalletTransactionCopyWithImpl<$Res>
    implements _$DisplayableWalletTransactionCopyWith<$Res> {
  __$DisplayableWalletTransactionCopyWithImpl(
      _DisplayableWalletTransaction _value,
      $Res Function(_DisplayableWalletTransaction) _then)
      : super(_value, (v) => _then(v as _DisplayableWalletTransaction));

  @override
  _DisplayableWalletTransaction get _value =>
      super._value as _DisplayableWalletTransaction;

  @override
  $Res call({
    Object? fromOrganizationName = freezed,
    Object? toOrganizationName = freezed,
    Object? amount = freezed,
    Object? isPayment = freezed,
  }) {
    return _then(_DisplayableWalletTransaction(
      fromOrganizationName: fromOrganizationName == freezed
          ? _value.fromOrganizationName
          : fromOrganizationName // ignore: cast_nullable_to_non_nullable
              as String,
      toOrganizationName: toOrganizationName == freezed
          ? _value.toOrganizationName
          : toOrganizationName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      isPayment: isPayment == freezed
          ? _value.isPayment
          : isPayment // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_DisplayableWalletTransaction
    with DiagnosticableTreeMixin
    implements _DisplayableWalletTransaction {
  _$_DisplayableWalletTransaction(
      {required this.fromOrganizationName,
      required this.toOrganizationName,
      required this.amount,
      required this.isPayment});

  @override
  final String fromOrganizationName;
  @override
  final String toOrganizationName;
  @override
  final double amount;
  @override // True when [amount] went out of the wallet.
// And false when [amount] went into the wallet.
  final double isPayment;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DisplayableWalletTransaction(fromOrganizationName: $fromOrganizationName, toOrganizationName: $toOrganizationName, amount: $amount, isPayment: $isPayment)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DisplayableWalletTransaction'))
      ..add(DiagnosticsProperty('fromOrganizationName', fromOrganizationName))
      ..add(DiagnosticsProperty('toOrganizationName', toOrganizationName))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('isPayment', isPayment));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DisplayableWalletTransaction &&
            (identical(other.fromOrganizationName, fromOrganizationName) ||
                other.fromOrganizationName == fromOrganizationName) &&
            (identical(other.toOrganizationName, toOrganizationName) ||
                other.toOrganizationName == toOrganizationName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.isPayment, isPayment) ||
                other.isPayment == isPayment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, fromOrganizationName, toOrganizationName, amount, isPayment);

  @JsonKey(ignore: true)
  @override
  _$DisplayableWalletTransactionCopyWith<_DisplayableWalletTransaction>
      get copyWith => __$DisplayableWalletTransactionCopyWithImpl<
          _DisplayableWalletTransaction>(this, _$identity);
}

abstract class _DisplayableWalletTransaction
    implements DisplayableWalletTransaction {
  factory _DisplayableWalletTransaction(
      {required String fromOrganizationName,
      required String toOrganizationName,
      required double amount,
      required double isPayment}) = _$_DisplayableWalletTransaction;

  @override
  String get fromOrganizationName;
  @override
  String get toOrganizationName;
  @override
  double get amount;
  @override // True when [amount] went out of the wallet.
// And false when [amount] went into the wallet.
  double get isPayment;
  @override
  @JsonKey(ignore: true)
  _$DisplayableWalletTransactionCopyWith<_DisplayableWalletTransaction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$CreateWalletViewArgumentsTearOff {
  const _$CreateWalletViewArgumentsTearOff();

  _CreateWalletViewArguments call(
      {required Organization organization,
      required String walletPublicAddress}) {
    return _CreateWalletViewArguments(
      organization: organization,
      walletPublicAddress: walletPublicAddress,
    );
  }
}

/// @nodoc
const $CreateWalletViewArguments = _$CreateWalletViewArgumentsTearOff();

/// @nodoc
mixin _$CreateWalletViewArguments {
  Organization get organization => throw _privateConstructorUsedError;
  String get walletPublicAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateWalletViewArgumentsCopyWith<CreateWalletViewArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWalletViewArgumentsCopyWith<$Res> {
  factory $CreateWalletViewArgumentsCopyWith(CreateWalletViewArguments value,
          $Res Function(CreateWalletViewArguments) then) =
      _$CreateWalletViewArgumentsCopyWithImpl<$Res>;
  $Res call({Organization organization, String walletPublicAddress});

  $OrganizationCopyWith<$Res> get organization;
}

/// @nodoc
class _$CreateWalletViewArgumentsCopyWithImpl<$Res>
    implements $CreateWalletViewArgumentsCopyWith<$Res> {
  _$CreateWalletViewArgumentsCopyWithImpl(this._value, this._then);

  final CreateWalletViewArguments _value;
  // ignore: unused_field
  final $Res Function(CreateWalletViewArguments) _then;

  @override
  $Res call({
    Object? organization = freezed,
    Object? walletPublicAddress = freezed,
  }) {
    return _then(_value.copyWith(
      organization: organization == freezed
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Organization,
      walletPublicAddress: walletPublicAddress == freezed
          ? _value.walletPublicAddress
          : walletPublicAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $OrganizationCopyWith<$Res> get organization {
    return $OrganizationCopyWith<$Res>(_value.organization, (value) {
      return _then(_value.copyWith(organization: value));
    });
  }
}

/// @nodoc
abstract class _$CreateWalletViewArgumentsCopyWith<$Res>
    implements $CreateWalletViewArgumentsCopyWith<$Res> {
  factory _$CreateWalletViewArgumentsCopyWith(_CreateWalletViewArguments value,
          $Res Function(_CreateWalletViewArguments) then) =
      __$CreateWalletViewArgumentsCopyWithImpl<$Res>;
  @override
  $Res call({Organization organization, String walletPublicAddress});

  @override
  $OrganizationCopyWith<$Res> get organization;
}

/// @nodoc
class __$CreateWalletViewArgumentsCopyWithImpl<$Res>
    extends _$CreateWalletViewArgumentsCopyWithImpl<$Res>
    implements _$CreateWalletViewArgumentsCopyWith<$Res> {
  __$CreateWalletViewArgumentsCopyWithImpl(_CreateWalletViewArguments _value,
      $Res Function(_CreateWalletViewArguments) _then)
      : super(_value, (v) => _then(v as _CreateWalletViewArguments));

  @override
  _CreateWalletViewArguments get _value =>
      super._value as _CreateWalletViewArguments;

  @override
  $Res call({
    Object? organization = freezed,
    Object? walletPublicAddress = freezed,
  }) {
    return _then(_CreateWalletViewArguments(
      organization: organization == freezed
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Organization,
      walletPublicAddress: walletPublicAddress == freezed
          ? _value.walletPublicAddress
          : walletPublicAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateWalletViewArguments
    with DiagnosticableTreeMixin
    implements _CreateWalletViewArguments {
  _$_CreateWalletViewArguments(
      {required this.organization, required this.walletPublicAddress});

  @override
  final Organization organization;
  @override
  final String walletPublicAddress;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateWalletViewArguments(organization: $organization, walletPublicAddress: $walletPublicAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateWalletViewArguments'))
      ..add(DiagnosticsProperty('organization', organization))
      ..add(DiagnosticsProperty('walletPublicAddress', walletPublicAddress));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateWalletViewArguments &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.walletPublicAddress, walletPublicAddress) ||
                other.walletPublicAddress == walletPublicAddress));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, organization, walletPublicAddress);

  @JsonKey(ignore: true)
  @override
  _$CreateWalletViewArgumentsCopyWith<_CreateWalletViewArguments>
      get copyWith =>
          __$CreateWalletViewArgumentsCopyWithImpl<_CreateWalletViewArguments>(
              this, _$identity);
}

abstract class _CreateWalletViewArguments implements CreateWalletViewArguments {
  factory _CreateWalletViewArguments(
      {required Organization organization,
      required String walletPublicAddress}) = _$_CreateWalletViewArguments;

  @override
  Organization get organization;
  @override
  String get walletPublicAddress;
  @override
  @JsonKey(ignore: true)
  _$CreateWalletViewArgumentsCopyWith<_CreateWalletViewArguments>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$TransactionTearOff {
  const _$TransactionTearOff();

  _Transaction call(
      {required String fromAddress,
      required String toAddress,
      required double amount}) {
    return _Transaction(
      fromAddress: fromAddress,
      toAddress: toAddress,
      amount: amount,
    );
  }
}

/// @nodoc
const $Transaction = _$TransactionTearOff();

/// @nodoc
mixin _$Transaction {
  String get fromAddress => throw _privateConstructorUsedError;
  String get toAddress => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res>;
  $Res call({String fromAddress, String toAddress, double amount});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  final Transaction _value;
  // ignore: unused_field
  final $Res Function(Transaction) _then;

  @override
  $Res call({
    Object? fromAddress = freezed,
    Object? toAddress = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      fromAddress: fromAddress == freezed
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: toAddress == freezed
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(
          _Transaction value, $Res Function(_Transaction) then) =
      __$TransactionCopyWithImpl<$Res>;
  @override
  $Res call({String fromAddress, String toAddress, double amount});
}

/// @nodoc
class __$TransactionCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(
      _Transaction _value, $Res Function(_Transaction) _then)
      : super(_value, (v) => _then(v as _Transaction));

  @override
  _Transaction get _value => super._value as _Transaction;

  @override
  $Res call({
    Object? fromAddress = freezed,
    Object? toAddress = freezed,
    Object? amount = freezed,
  }) {
    return _then(_Transaction(
      fromAddress: fromAddress == freezed
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: toAddress == freezed
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Transaction with DiagnosticableTreeMixin implements _Transaction {
  _$_Transaction(
      {required this.fromAddress,
      required this.toAddress,
      required this.amount});

  @override
  final String fromAddress;
  @override
  final String toAddress;
  @override
  final double amount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Transaction(fromAddress: $fromAddress, toAddress: $toAddress, amount: $amount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Transaction'))
      ..add(DiagnosticsProperty('fromAddress', fromAddress))
      ..add(DiagnosticsProperty('toAddress', toAddress))
      ..add(DiagnosticsProperty('amount', amount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Transaction &&
            (identical(other.fromAddress, fromAddress) ||
                other.fromAddress == fromAddress) &&
            (identical(other.toAddress, toAddress) ||
                other.toAddress == toAddress) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fromAddress, toAddress, amount);

  @JsonKey(ignore: true)
  @override
  _$TransactionCopyWith<_Transaction> get copyWith =>
      __$TransactionCopyWithImpl<_Transaction>(this, _$identity);
}

abstract class _Transaction implements Transaction {
  factory _Transaction(
      {required String fromAddress,
      required String toAddress,
      required double amount}) = _$_Transaction;

  @override
  String get fromAddress;
  @override
  String get toAddress;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$TransactionCopyWith<_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
