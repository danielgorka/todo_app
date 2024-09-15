// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodosDtoImpl _$$TodosDtoImplFromJson(Map json) => _$TodosDtoImpl(
      todos: (json['todos'] as List<dynamic>)
          .map((e) => TodoDto.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$TodosDtoImplToJson(_$TodosDtoImpl instance) =>
    <String, dynamic>{
      'todos': instance.todos.map((e) => e.toJson()).toList(),
    };
