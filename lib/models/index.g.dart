// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReflectionCollection on Isar {
  IsarCollection<Reflection> get reflections => this.collection();
}

const ReflectionSchema = CollectionSchema(
  name: r'Reflection',
  id: -4896689789499089769,
  properties: {
    r'answers': PropertySchema(
      id: 0,
      name: r'answers',
      type: IsarType.stringList,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _reflectionEstimateSize,
  serialize: _reflectionSerialize,
  deserialize: _reflectionDeserialize,
  deserializeProp: _reflectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'model': LinkSchema(
      id: 1185387919448884790,
      name: r'model',
      target: r'ReflectionModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _reflectionGetId,
  getLinks: _reflectionGetLinks,
  attach: _reflectionAttach,
  version: '3.1.0+1',
);

int _reflectionEstimateSize(
  Reflection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.answers.length * 3;
  {
    for (var i = 0; i < object.answers.length; i++) {
      final value = object.answers[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _reflectionSerialize(
  Reflection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.answers);
  writer.writeDateTime(offsets[1], object.createdAt);
}

Reflection _reflectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Reflection();
  object.answers = reader.readStringList(offsets[0]) ?? [];
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  return object;
}

P _reflectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reflectionGetId(Reflection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reflectionGetLinks(Reflection object) {
  return [object.model];
}

void _reflectionAttach(IsarCollection<dynamic> col, Id id, Reflection object) {
  object.id = id;
  object.model
      .attach(col, col.isar.collection<ReflectionModel>(), r'model', id);
}

extension ReflectionQueryWhereSort
    on QueryBuilder<Reflection, Reflection, QWhere> {
  QueryBuilder<Reflection, Reflection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReflectionQueryWhere
    on QueryBuilder<Reflection, Reflection, QWhereClause> {
  QueryBuilder<Reflection, Reflection, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Reflection, Reflection, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterWhereClause> idBetween(
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
}

extension ReflectionQueryFilter
    on QueryBuilder<Reflection, Reflection, QFilterCondition> {
  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answers',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answers',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> answersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      answersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> idBetween(
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
}

extension ReflectionQueryObject
    on QueryBuilder<Reflection, Reflection, QFilterCondition> {}

extension ReflectionQueryLinks
    on QueryBuilder<Reflection, Reflection, QFilterCondition> {
  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> model(
      FilterQuery<ReflectionModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'model');
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> modelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'model', 0, true, 0, true);
    });
  }
}

extension ReflectionQuerySortBy
    on QueryBuilder<Reflection, Reflection, QSortBy> {
  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }
}

extension ReflectionQuerySortThenBy
    on QueryBuilder<Reflection, Reflection, QSortThenBy> {
  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ReflectionQueryWhereDistinct
    on QueryBuilder<Reflection, Reflection, QDistinct> {
  QueryBuilder<Reflection, Reflection, QDistinct> distinctByAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answers');
    });
  }

  QueryBuilder<Reflection, Reflection, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }
}

extension ReflectionQueryProperty
    on QueryBuilder<Reflection, Reflection, QQueryProperty> {
  QueryBuilder<Reflection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Reflection, List<String>, QQueryOperations> answersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answers');
    });
  }

  QueryBuilder<Reflection, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReflectionModelCollection on Isar {
  IsarCollection<ReflectionModel> get reflectionModels => this.collection();
}

const ReflectionModelSchema = CollectionSchema(
  name: r'ReflectionModel',
  id: 7157879729799426259,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'prompt': PropertySchema(
      id: 2,
      name: r'prompt',
      type: IsarType.string,
    ),
    r'questions': PropertySchema(
      id: 3,
      name: r'questions',
      type: IsarType.stringList,
    )
  },
  estimateSize: _reflectionModelEstimateSize,
  serialize: _reflectionModelSerialize,
  deserialize: _reflectionModelDeserialize,
  deserializeProp: _reflectionModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'links': LinkSchema(
      id: -6501064410781598671,
      name: r'links',
      target: r'Reflection',
      single: false,
      linkName: r'model',
    )
  },
  embeddedSchemas: {},
  getId: _reflectionModelGetId,
  getLinks: _reflectionModelGetLinks,
  attach: _reflectionModelAttach,
  version: '3.1.0+1',
);

int _reflectionModelEstimateSize(
  ReflectionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.prompt.length * 3;
  bytesCount += 3 + object.questions.length * 3;
  {
    for (var i = 0; i < object.questions.length; i++) {
      final value = object.questions[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _reflectionModelSerialize(
  ReflectionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.prompt);
  writer.writeStringList(offsets[3], object.questions);
}

ReflectionModel _reflectionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReflectionModel();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.prompt = reader.readString(offsets[2]);
  object.questions = reader.readStringList(offsets[3]) ?? [];
  return object;
}

P _reflectionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reflectionModelGetId(ReflectionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reflectionModelGetLinks(ReflectionModel object) {
  return [object.links];
}

void _reflectionModelAttach(
    IsarCollection<dynamic> col, Id id, ReflectionModel object) {
  object.id = id;
  object.links.attach(col, col.isar.collection<Reflection>(), r'links', id);
}

extension ReflectionModelQueryWhereSort
    on QueryBuilder<ReflectionModel, ReflectionModel, QWhere> {
  QueryBuilder<ReflectionModel, ReflectionModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReflectionModelQueryWhere
    on QueryBuilder<ReflectionModel, ReflectionModel, QWhereClause> {
  QueryBuilder<ReflectionModel, ReflectionModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterWhereClause> idBetween(
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
}

extension ReflectionModelQueryFilter
    on QueryBuilder<ReflectionModel, ReflectionModel, QFilterCondition> {
  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
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

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
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

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      promptEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      promptGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      promptLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      promptBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prompt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      promptStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      promptEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      promptContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      promptMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prompt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      promptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prompt',
        value: '',
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      promptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prompt',
        value: '',
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questions',
        value: '',
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questions',
        value: '',
      ));
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      questionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ReflectionModelQueryObject
    on QueryBuilder<ReflectionModel, ReflectionModel, QFilterCondition> {}

extension ReflectionModelQueryLinks
    on QueryBuilder<ReflectionModel, ReflectionModel, QFilterCondition> {
  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition> links(
      FilterQuery<Reflection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'links');
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      linksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'links', length, true, length, true);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      linksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'links', 0, true, 0, true);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      linksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'links', 0, false, 999999, true);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      linksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'links', 0, true, length, include);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      linksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'links', length, include, 999999, true);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterFilterCondition>
      linksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'links', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ReflectionModelQuerySortBy
    on QueryBuilder<ReflectionModel, ReflectionModel, QSortBy> {
  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy> sortByPrompt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prompt', Sort.asc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy>
      sortByPromptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prompt', Sort.desc);
    });
  }
}

extension ReflectionModelQuerySortThenBy
    on QueryBuilder<ReflectionModel, ReflectionModel, QSortThenBy> {
  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy> thenByPrompt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prompt', Sort.asc);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QAfterSortBy>
      thenByPromptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prompt', Sort.desc);
    });
  }
}

extension ReflectionModelQueryWhereDistinct
    on QueryBuilder<ReflectionModel, ReflectionModel, QDistinct> {
  QueryBuilder<ReflectionModel, ReflectionModel, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QDistinct> distinctByPrompt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prompt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReflectionModel, ReflectionModel, QDistinct>
      distinctByQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questions');
    });
  }
}

extension ReflectionModelQueryProperty
    on QueryBuilder<ReflectionModel, ReflectionModel, QQueryProperty> {
  QueryBuilder<ReflectionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReflectionModel, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ReflectionModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ReflectionModel, String, QQueryOperations> promptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prompt');
    });
  }

  QueryBuilder<ReflectionModel, List<String>, QQueryOperations>
      questionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questions');
    });
  }
}
