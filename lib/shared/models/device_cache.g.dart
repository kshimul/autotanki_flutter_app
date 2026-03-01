// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_cache.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDeviceCacheCollection on Isar {
  IsarCollection<DeviceCache> get deviceCaches => this.collection();
}

const DeviceCacheSchema = CollectionSchema(
  name: r'DeviceCache',
  id: -4566714111386267896,
  properties: {
    r'deviceId': PropertySchema(
      id: 0,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'displayName': PropertySchema(
      id: 1,
      name: r'displayName',
      type: IsarType.string,
    ),
    r'isOnline': PropertySchema(
      id: 2,
      name: r'isOnline',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 3,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'macAddress': PropertySchema(
      id: 4,
      name: r'macAddress',
      type: IsarType.string,
    ),
    r'ohtJson': PropertySchema(
      id: 5,
      name: r'ohtJson',
      type: IsarType.string,
    ),
    r'ohtWaterLevel': PropertySchema(
      id: 6,
      name: r'ohtWaterLevel',
      type: IsarType.double,
    ),
    r'ownerId': PropertySchema(
      id: 7,
      name: r'ownerId',
      type: IsarType.string,
    ),
    r'rawJson': PropertySchema(
      id: 8,
      name: r'rawJson',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 9,
      name: r'status',
      type: IsarType.string,
    ),
    r'tankTypeId': PropertySchema(
      id: 10,
      name: r'tankTypeId',
      type: IsarType.string,
    ),
    r'ugtJson': PropertySchema(
      id: 11,
      name: r'ugtJson',
      type: IsarType.string,
    ),
    r'ugtWaterLevel': PropertySchema(
      id: 12,
      name: r'ugtWaterLevel',
      type: IsarType.double,
    ),
    r'wifiSignal': PropertySchema(
      id: 13,
      name: r'wifiSignal',
      type: IsarType.long,
    )
  },
  estimateSize: _deviceCacheEstimateSize,
  serialize: _deviceCacheSerialize,
  deserialize: _deviceCacheDeserialize,
  deserializeProp: _deviceCacheDeserializeProp,
  idName: r'id',
  indexes: {
    r'deviceId': IndexSchema(
      id: 4442814072367132509,
      name: r'deviceId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'deviceId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _deviceCacheGetId,
  getLinks: _deviceCacheGetLinks,
  attach: _deviceCacheAttach,
  version: '3.1.0+1',
);

int _deviceCacheEstimateSize(
  DeviceCache object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.displayName.length * 3;
  {
    final value = object.macAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ohtJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ownerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.rawJson.length * 3;
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tankTypeId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ugtJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _deviceCacheSerialize(
  DeviceCache object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.deviceId);
  writer.writeString(offsets[1], object.displayName);
  writer.writeBool(offsets[2], object.isOnline);
  writer.writeDateTime(offsets[3], object.lastUpdated);
  writer.writeString(offsets[4], object.macAddress);
  writer.writeString(offsets[5], object.ohtJson);
  writer.writeDouble(offsets[6], object.ohtWaterLevel);
  writer.writeString(offsets[7], object.ownerId);
  writer.writeString(offsets[8], object.rawJson);
  writer.writeString(offsets[9], object.status);
  writer.writeString(offsets[10], object.tankTypeId);
  writer.writeString(offsets[11], object.ugtJson);
  writer.writeDouble(offsets[12], object.ugtWaterLevel);
  writer.writeLong(offsets[13], object.wifiSignal);
}

DeviceCache _deviceCacheDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DeviceCache();
  object.deviceId = reader.readString(offsets[0]);
  object.displayName = reader.readString(offsets[1]);
  object.id = id;
  object.isOnline = reader.readBoolOrNull(offsets[2]);
  object.lastUpdated = reader.readDateTime(offsets[3]);
  object.macAddress = reader.readStringOrNull(offsets[4]);
  object.ohtJson = reader.readStringOrNull(offsets[5]);
  object.ohtWaterLevel = reader.readDoubleOrNull(offsets[6]);
  object.ownerId = reader.readStringOrNull(offsets[7]);
  object.rawJson = reader.readString(offsets[8]);
  object.status = reader.readStringOrNull(offsets[9]);
  object.tankTypeId = reader.readStringOrNull(offsets[10]);
  object.ugtJson = reader.readStringOrNull(offsets[11]);
  object.ugtWaterLevel = reader.readDoubleOrNull(offsets[12]);
  object.wifiSignal = reader.readLongOrNull(offsets[13]);
  return object;
}

P _deviceCacheDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _deviceCacheGetId(DeviceCache object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _deviceCacheGetLinks(DeviceCache object) {
  return [];
}

void _deviceCacheAttach(
    IsarCollection<dynamic> col, Id id, DeviceCache object) {
  object.id = id;
}

extension DeviceCacheByIndex on IsarCollection<DeviceCache> {
  Future<DeviceCache?> getByDeviceId(String deviceId) {
    return getByIndex(r'deviceId', [deviceId]);
  }

  DeviceCache? getByDeviceIdSync(String deviceId) {
    return getByIndexSync(r'deviceId', [deviceId]);
  }

  Future<bool> deleteByDeviceId(String deviceId) {
    return deleteByIndex(r'deviceId', [deviceId]);
  }

  bool deleteByDeviceIdSync(String deviceId) {
    return deleteByIndexSync(r'deviceId', [deviceId]);
  }

  Future<List<DeviceCache?>> getAllByDeviceId(List<String> deviceIdValues) {
    final values = deviceIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'deviceId', values);
  }

  List<DeviceCache?> getAllByDeviceIdSync(List<String> deviceIdValues) {
    final values = deviceIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'deviceId', values);
  }

  Future<int> deleteAllByDeviceId(List<String> deviceIdValues) {
    final values = deviceIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'deviceId', values);
  }

  int deleteAllByDeviceIdSync(List<String> deviceIdValues) {
    final values = deviceIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'deviceId', values);
  }

  Future<Id> putByDeviceId(DeviceCache object) {
    return putByIndex(r'deviceId', object);
  }

  Id putByDeviceIdSync(DeviceCache object, {bool saveLinks = true}) {
    return putByIndexSync(r'deviceId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDeviceId(List<DeviceCache> objects) {
    return putAllByIndex(r'deviceId', objects);
  }

  List<Id> putAllByDeviceIdSync(List<DeviceCache> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'deviceId', objects, saveLinks: saveLinks);
  }
}

extension DeviceCacheQueryWhereSort
    on QueryBuilder<DeviceCache, DeviceCache, QWhere> {
  QueryBuilder<DeviceCache, DeviceCache, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DeviceCacheQueryWhere
    on QueryBuilder<DeviceCache, DeviceCache, QWhereClause> {
  QueryBuilder<DeviceCache, DeviceCache, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterWhereClause> deviceIdEqualTo(
      String deviceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'deviceId',
        value: [deviceId],
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterWhereClause> deviceIdNotEqualTo(
      String deviceId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'deviceId',
              lower: [],
              upper: [deviceId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'deviceId',
              lower: [deviceId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'deviceId',
              lower: [deviceId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'deviceId',
              lower: [],
              upper: [deviceId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DeviceCacheQueryFilter
    on QueryBuilder<DeviceCache, DeviceCache, QFilterCondition> {
  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> deviceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      displayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      displayNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      displayNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      displayNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      displayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      displayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      isOnlineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isOnline',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      isOnlineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isOnline',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> isOnlineEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOnline',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'macAddress',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'macAddress',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'macAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'macAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'macAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      macAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'macAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ohtJson',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ohtJson',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ohtJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ohtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ohtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ohtJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ohtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ohtJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ohtJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ohtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ohtJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ohtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ohtJsonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ohtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ohtJsonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ohtJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ohtJson',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ohtJson',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtWaterLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ohtWaterLevel',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtWaterLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ohtWaterLevel',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtWaterLevelEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ohtWaterLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtWaterLevelGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ohtWaterLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtWaterLevelLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ohtWaterLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ohtWaterLevelBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ohtWaterLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ownerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ownerId',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ownerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ownerId',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ownerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ownerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ownerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ownerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ownerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ownerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ownerIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ownerIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ownerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerId',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ownerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownerId',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> rawJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      rawJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> rawJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> rawJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      rawJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rawJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> rawJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rawJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> rawJsonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> rawJsonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      rawJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawJson',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      rawJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawJson',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> statusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      statusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> statusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> statusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tankTypeId',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tankTypeId',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tankTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tankTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tankTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tankTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tankTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tankTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tankTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tankTypeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tankTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      tankTypeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tankTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ugtJson',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ugtJson',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ugtJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ugtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ugtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ugtJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ugtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ugtJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ugtJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ugtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ugtJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ugtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ugtJsonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ugtJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition> ugtJsonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ugtJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ugtJson',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ugtJson',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtWaterLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ugtWaterLevel',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtWaterLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ugtWaterLevel',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtWaterLevelEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ugtWaterLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtWaterLevelGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ugtWaterLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtWaterLevelLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ugtWaterLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      ugtWaterLevelBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ugtWaterLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      wifiSignalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wifiSignal',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      wifiSignalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wifiSignal',
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      wifiSignalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wifiSignal',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      wifiSignalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wifiSignal',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      wifiSignalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wifiSignal',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterFilterCondition>
      wifiSignalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wifiSignal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DeviceCacheQueryObject
    on QueryBuilder<DeviceCache, DeviceCache, QFilterCondition> {}

extension DeviceCacheQueryLinks
    on QueryBuilder<DeviceCache, DeviceCache, QFilterCondition> {}

extension DeviceCacheQuerySortBy
    on QueryBuilder<DeviceCache, DeviceCache, QSortBy> {
  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByIsOnlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByMacAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'macAddress', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByMacAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'macAddress', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByOhtJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtJson', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByOhtJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtJson', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByOhtWaterLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtWaterLevel', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy>
      sortByOhtWaterLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtWaterLevel', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByOwnerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByOwnerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByRawJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawJson', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByRawJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawJson', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByTankTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tankTypeId', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByTankTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tankTypeId', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByUgtJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtJson', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByUgtJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtJson', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByUgtWaterLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtWaterLevel', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy>
      sortByUgtWaterLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtWaterLevel', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByWifiSignal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wifiSignal', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> sortByWifiSignalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wifiSignal', Sort.desc);
    });
  }
}

extension DeviceCacheQuerySortThenBy
    on QueryBuilder<DeviceCache, DeviceCache, QSortThenBy> {
  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByIsOnlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByMacAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'macAddress', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByMacAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'macAddress', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByOhtJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtJson', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByOhtJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtJson', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByOhtWaterLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtWaterLevel', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy>
      thenByOhtWaterLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtWaterLevel', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByOwnerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByOwnerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByRawJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawJson', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByRawJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawJson', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByTankTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tankTypeId', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByTankTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tankTypeId', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByUgtJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtJson', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByUgtJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtJson', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByUgtWaterLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtWaterLevel', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy>
      thenByUgtWaterLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtWaterLevel', Sort.desc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByWifiSignal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wifiSignal', Sort.asc);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QAfterSortBy> thenByWifiSignalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wifiSignal', Sort.desc);
    });
  }
}

extension DeviceCacheQueryWhereDistinct
    on QueryBuilder<DeviceCache, DeviceCache, QDistinct> {
  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByDisplayName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOnline');
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByMacAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'macAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByOhtJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ohtJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByOhtWaterLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ohtWaterLevel');
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByOwnerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByRawJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rawJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByTankTypeId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tankTypeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByUgtJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ugtJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByUgtWaterLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ugtWaterLevel');
    });
  }

  QueryBuilder<DeviceCache, DeviceCache, QDistinct> distinctByWifiSignal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wifiSignal');
    });
  }
}

extension DeviceCacheQueryProperty
    on QueryBuilder<DeviceCache, DeviceCache, QQueryProperty> {
  QueryBuilder<DeviceCache, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DeviceCache, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<DeviceCache, String, QQueryOperations> displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<DeviceCache, bool?, QQueryOperations> isOnlineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOnline');
    });
  }

  QueryBuilder<DeviceCache, DateTime, QQueryOperations> lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<DeviceCache, String?, QQueryOperations> macAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'macAddress');
    });
  }

  QueryBuilder<DeviceCache, String?, QQueryOperations> ohtJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ohtJson');
    });
  }

  QueryBuilder<DeviceCache, double?, QQueryOperations> ohtWaterLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ohtWaterLevel');
    });
  }

  QueryBuilder<DeviceCache, String?, QQueryOperations> ownerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerId');
    });
  }

  QueryBuilder<DeviceCache, String, QQueryOperations> rawJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rawJson');
    });
  }

  QueryBuilder<DeviceCache, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<DeviceCache, String?, QQueryOperations> tankTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tankTypeId');
    });
  }

  QueryBuilder<DeviceCache, String?, QQueryOperations> ugtJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ugtJson');
    });
  }

  QueryBuilder<DeviceCache, double?, QQueryOperations> ugtWaterLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ugtWaterLevel');
    });
  }

  QueryBuilder<DeviceCache, int?, QQueryOperations> wifiSignalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wifiSignal');
    });
  }
}
