// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry_cache.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTelemetryCacheCollection on Isar {
  IsarCollection<TelemetryCache> get telemetryCaches => this.collection();
}

const TelemetryCacheSchema = CollectionSchema(
  name: r'TelemetryCache',
  id: -7706576763648890230,
  properties: {
    r'deviceId': PropertySchema(
      id: 0,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'energyKwh': PropertySchema(
      id: 1,
      name: r'energyKwh',
      type: IsarType.double,
    ),
    r'firmwareMode': PropertySchema(
      id: 2,
      name: r'firmwareMode',
      type: IsarType.string,
    ),
    r'isSystemSuspended': PropertySchema(
      id: 3,
      name: r'isSystemSuspended',
      type: IsarType.bool,
    ),
    r'ohtLevel': PropertySchema(
      id: 4,
      name: r'ohtLevel',
      type: IsarType.double,
    ),
    r'ohtMotorState': PropertySchema(
      id: 5,
      name: r'ohtMotorState',
      type: IsarType.string,
    ),
    r'powerWatts': PropertySchema(
      id: 6,
      name: r'powerWatts',
      type: IsarType.double,
    ),
    r'timestamp': PropertySchema(
      id: 7,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'ugtLevel': PropertySchema(
      id: 8,
      name: r'ugtLevel',
      type: IsarType.double,
    ),
    r'ugtMotorState': PropertySchema(
      id: 9,
      name: r'ugtMotorState',
      type: IsarType.string,
    )
  },
  estimateSize: _telemetryCacheEstimateSize,
  serialize: _telemetryCacheSerialize,
  deserialize: _telemetryCacheDeserialize,
  deserializeProp: _telemetryCacheDeserializeProp,
  idName: r'id',
  indexes: {
    r'deviceId': IndexSchema(
      id: 4442814072367132509,
      name: r'deviceId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'deviceId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'timestamp': IndexSchema(
      id: 1852253767416892198,
      name: r'timestamp',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'timestamp',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _telemetryCacheGetId,
  getLinks: _telemetryCacheGetLinks,
  attach: _telemetryCacheAttach,
  version: '3.1.0+1',
);

int _telemetryCacheEstimateSize(
  TelemetryCache object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.firmwareMode.length * 3;
  bytesCount += 3 + object.ohtMotorState.length * 3;
  bytesCount += 3 + object.ugtMotorState.length * 3;
  return bytesCount;
}

void _telemetryCacheSerialize(
  TelemetryCache object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.deviceId);
  writer.writeDouble(offsets[1], object.energyKwh);
  writer.writeString(offsets[2], object.firmwareMode);
  writer.writeBool(offsets[3], object.isSystemSuspended);
  writer.writeDouble(offsets[4], object.ohtLevel);
  writer.writeString(offsets[5], object.ohtMotorState);
  writer.writeDouble(offsets[6], object.powerWatts);
  writer.writeDateTime(offsets[7], object.timestamp);
  writer.writeDouble(offsets[8], object.ugtLevel);
  writer.writeString(offsets[9], object.ugtMotorState);
}

TelemetryCache _telemetryCacheDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TelemetryCache();
  object.deviceId = reader.readString(offsets[0]);
  object.energyKwh = reader.readDouble(offsets[1]);
  object.firmwareMode = reader.readString(offsets[2]);
  object.id = id;
  object.isSystemSuspended = reader.readBool(offsets[3]);
  object.ohtLevel = reader.readDouble(offsets[4]);
  object.ohtMotorState = reader.readString(offsets[5]);
  object.powerWatts = reader.readDouble(offsets[6]);
  object.timestamp = reader.readDateTime(offsets[7]);
  object.ugtLevel = reader.readDouble(offsets[8]);
  object.ugtMotorState = reader.readString(offsets[9]);
  return object;
}

P _telemetryCacheDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _telemetryCacheGetId(TelemetryCache object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _telemetryCacheGetLinks(TelemetryCache object) {
  return [];
}

void _telemetryCacheAttach(
    IsarCollection<dynamic> col, Id id, TelemetryCache object) {
  object.id = id;
}

extension TelemetryCacheQueryWhereSort
    on QueryBuilder<TelemetryCache, TelemetryCache, QWhere> {
  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhere> anyTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timestamp'),
      );
    });
  }
}

extension TelemetryCacheQueryWhere
    on QueryBuilder<TelemetryCache, TelemetryCache, QWhereClause> {
  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause> idBetween(
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause>
      deviceIdEqualTo(String deviceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'deviceId',
        value: [deviceId],
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause>
      deviceIdNotEqualTo(String deviceId) {
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause>
      timestampEqualTo(DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'timestamp',
        value: [timestamp],
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause>
      timestampNotEqualTo(DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause>
      timestampGreaterThan(
    DateTime timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [timestamp],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause>
      timestampLessThan(
    DateTime timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [],
        upper: [timestamp],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterWhereClause>
      timestampBetween(
    DateTime lowerTimestamp,
    DateTime upperTimestamp, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [lowerTimestamp],
        includeLower: includeLower,
        upper: [upperTimestamp],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TelemetryCacheQueryFilter
    on QueryBuilder<TelemetryCache, TelemetryCache, QFilterCondition> {
  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      deviceIdEqualTo(
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      deviceIdBetween(
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      energyKwhEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'energyKwh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      energyKwhGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'energyKwh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      energyKwhLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'energyKwh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      energyKwhBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'energyKwh',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      firmwareModeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firmwareMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      firmwareModeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firmwareMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      firmwareModeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firmwareMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      firmwareModeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firmwareMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      firmwareModeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firmwareMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      firmwareModeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firmwareMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      firmwareModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firmwareMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      firmwareModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firmwareMode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      firmwareModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firmwareMode',
        value: '',
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      firmwareModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firmwareMode',
        value: '',
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      isSystemSuspendedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSystemSuspended',
        value: value,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtLevelEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ohtLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtLevelGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ohtLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtLevelLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ohtLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtLevelBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ohtLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtMotorStateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ohtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtMotorStateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ohtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtMotorStateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ohtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtMotorStateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ohtMotorState',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtMotorStateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ohtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtMotorStateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ohtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtMotorStateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ohtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtMotorStateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ohtMotorState',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtMotorStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ohtMotorState',
        value: '',
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ohtMotorStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ohtMotorState',
        value: '',
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      powerWattsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'powerWatts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      powerWattsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'powerWatts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      powerWattsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'powerWatts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      powerWattsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'powerWatts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtLevelEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ugtLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtLevelGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ugtLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtLevelLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ugtLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtLevelBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ugtLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtMotorStateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ugtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtMotorStateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ugtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtMotorStateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ugtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtMotorStateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ugtMotorState',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtMotorStateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ugtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtMotorStateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ugtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtMotorStateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ugtMotorState',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtMotorStateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ugtMotorState',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtMotorStateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ugtMotorState',
        value: '',
      ));
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterFilterCondition>
      ugtMotorStateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ugtMotorState',
        value: '',
      ));
    });
  }
}

extension TelemetryCacheQueryObject
    on QueryBuilder<TelemetryCache, TelemetryCache, QFilterCondition> {}

extension TelemetryCacheQueryLinks
    on QueryBuilder<TelemetryCache, TelemetryCache, QFilterCondition> {}

extension TelemetryCacheQuerySortBy
    on QueryBuilder<TelemetryCache, TelemetryCache, QSortBy> {
  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> sortByEnergyKwh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'energyKwh', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByEnergyKwhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'energyKwh', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByFirmwareMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmwareMode', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByFirmwareModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmwareMode', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByIsSystemSuspended() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemSuspended', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByIsSystemSuspendedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemSuspended', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> sortByOhtLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtLevel', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByOhtLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtLevel', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByOhtMotorState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtMotorState', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByOhtMotorStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtMotorState', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByPowerWatts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'powerWatts', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByPowerWattsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'powerWatts', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> sortByUgtLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtLevel', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByUgtLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtLevel', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByUgtMotorState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtMotorState', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      sortByUgtMotorStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtMotorState', Sort.desc);
    });
  }
}

extension TelemetryCacheQuerySortThenBy
    on QueryBuilder<TelemetryCache, TelemetryCache, QSortThenBy> {
  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> thenByEnergyKwh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'energyKwh', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByEnergyKwhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'energyKwh', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByFirmwareMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmwareMode', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByFirmwareModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firmwareMode', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByIsSystemSuspended() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemSuspended', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByIsSystemSuspendedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystemSuspended', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> thenByOhtLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtLevel', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByOhtLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtLevel', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByOhtMotorState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtMotorState', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByOhtMotorStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ohtMotorState', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByPowerWatts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'powerWatts', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByPowerWattsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'powerWatts', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy> thenByUgtLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtLevel', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByUgtLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtLevel', Sort.desc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByUgtMotorState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtMotorState', Sort.asc);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QAfterSortBy>
      thenByUgtMotorStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ugtMotorState', Sort.desc);
    });
  }
}

extension TelemetryCacheQueryWhereDistinct
    on QueryBuilder<TelemetryCache, TelemetryCache, QDistinct> {
  QueryBuilder<TelemetryCache, TelemetryCache, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QDistinct>
      distinctByEnergyKwh() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'energyKwh');
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QDistinct>
      distinctByFirmwareMode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firmwareMode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QDistinct>
      distinctByIsSystemSuspended() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSystemSuspended');
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QDistinct> distinctByOhtLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ohtLevel');
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QDistinct>
      distinctByOhtMotorState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ohtMotorState',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QDistinct>
      distinctByPowerWatts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'powerWatts');
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QDistinct> distinctByUgtLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ugtLevel');
    });
  }

  QueryBuilder<TelemetryCache, TelemetryCache, QDistinct>
      distinctByUgtMotorState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ugtMotorState',
          caseSensitive: caseSensitive);
    });
  }
}

extension TelemetryCacheQueryProperty
    on QueryBuilder<TelemetryCache, TelemetryCache, QQueryProperty> {
  QueryBuilder<TelemetryCache, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TelemetryCache, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<TelemetryCache, double, QQueryOperations> energyKwhProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'energyKwh');
    });
  }

  QueryBuilder<TelemetryCache, String, QQueryOperations>
      firmwareModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firmwareMode');
    });
  }

  QueryBuilder<TelemetryCache, bool, QQueryOperations>
      isSystemSuspendedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSystemSuspended');
    });
  }

  QueryBuilder<TelemetryCache, double, QQueryOperations> ohtLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ohtLevel');
    });
  }

  QueryBuilder<TelemetryCache, String, QQueryOperations>
      ohtMotorStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ohtMotorState');
    });
  }

  QueryBuilder<TelemetryCache, double, QQueryOperations> powerWattsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'powerWatts');
    });
  }

  QueryBuilder<TelemetryCache, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<TelemetryCache, double, QQueryOperations> ugtLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ugtLevel');
    });
  }

  QueryBuilder<TelemetryCache, String, QQueryOperations>
      ugtMotorStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ugtMotorState');
    });
  }
}
