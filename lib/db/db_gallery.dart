import 'package:diary/model/gallerymodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<GalleryModel>> galleryNotifierList = ValueNotifier([]);

class GalleryDbFunctions extends ChangeNotifier {
  //adding diary
  Future addgallery(GalleryModel gallery) async {
    final Box<GalleryModel> box = await Hive.openBox<GalleryModel>('gallery');
    await box.add(gallery);
    // await getgallery();
    await box.close();
    galleryNotifierList.value.add(gallery);
    galleryNotifierList.notifyListeners();
  }

  Future<void> updategallery() async {
    final Box<GalleryModel> box = await Hive.openBox<GalleryModel>('gallery');
    galleryNotifierList.value.clear();
    galleryNotifierList.value.addAll(box.values);
    galleryNotifierList.notifyListeners();
  }

  Future<void> editgary(GalleryModel editgalleryy, int key) async {
    final Box<GalleryModel> box = await Hive.openBox<GalleryModel>('gallery');
    await box.put(key, editgalleryy);
    await updategallery();
  }

  editGallery(GalleryModel galleryfolder, GalleryModel galleryModel) {}

  Future<void> deleteGallery(int id) async {
    final Box<GalleryModel> box = await Hive.openBox<GalleryModel>('gallery');
    box.delete(id);
    updategallery();
  }
}
