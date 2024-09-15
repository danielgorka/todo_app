// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoDtoImpl _$$TodoDtoImplFromJson(Map json) => _$TodoDtoImpl(
      id: (json['id'] as num).toInt(),
      todo: json['todo'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$TodoDtoImplToJson(_$TodoDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todo': instance.todo,
      'completed': instance.completed,
    };
