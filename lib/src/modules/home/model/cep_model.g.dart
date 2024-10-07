// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CepModelAdapter extends TypeAdapter<CepModel> {
  @override
  final int typeId = 0;

  @override
  CepModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CepModel(
      cep: fields[0] as String,
      logradouro: fields[1] as String,
      bairro: fields[2] as String,
      cidade: fields[3] as String,
      uf: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CepModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.cep)
      ..writeByte(1)
      ..write(obj.logradouro)
      ..writeByte(2)
      ..write(obj.bairro)
      ..writeByte(3)
      ..write(obj.cidade)
      ..writeByte(4)
      ..write(obj.uf);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CepModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
