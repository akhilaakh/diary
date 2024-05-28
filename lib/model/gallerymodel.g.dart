// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallerymodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GalleryModelAdapter extends TypeAdapter<GalleryModel> {
  @override
  final int typeId = 3;

  @override
  GalleryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GalleryModel(
      date: fields[1] as String,
      memoryimage: (fields[2] as List?)?.cast<String>(),
      name: fields[0] as String,
      id: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, GalleryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.memoryimage)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GalleryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
