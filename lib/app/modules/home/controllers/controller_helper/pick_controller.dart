import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:laser/app/components/custom_snackbar.dart';

class PickController extends GetxController {
  RxList<dio.MultipartFile> pickedImages = <dio.MultipartFile>[].obs;
  RxList<dio.MultipartFile> pickedVideos = <dio.MultipartFile>[].obs;
//? pick multiple images from device
  // pickImages() async {
  //   List<XFile>? images = await ImagePicker().pickMultiImage();
  //   if (images == null) return;

  //   if (images.length > 2) {
  //     return CustomSnackBar.showCustomErrorSnackBar(
  //         title: "Error", message: "Please Select Only 2 Photos");
  //   }

  //   List<dio.MultipartFile> imageFiles = [];
  //   for (var image in images.take(2)) {
  //     var multipartFile =
  //         await dio.MultipartFile.fromFile(image.path, filename: image.name);
  //     imageFiles.add(multipartFile);
  //   }
  //   pickedImages.value = imageFiles; // Assign the new list to the observable
  // }

//? pick multiple videos from device using file picker
  pickVideos() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: true,
      allowCompression: true,
    );

    if (result == null || result.files.isEmpty) {
      return CustomSnackBar.showCustomErrorSnackBar(
        title: "Error",
        message: "Please Select Video",
      );
    }

    List<dio.MultipartFile> videoFiles = [];

    for (var video in result.files) {
      if (video.path != null) {
        var multipartFile =
            dio.MultipartFile.fromFileSync(video.path!, filename: video.name);
        videoFiles.add(multipartFile);
      }
    }
    pickedVideos.value = videoFiles; // Assign the new list to the observable
  }

  pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
      allowCompression: true,
    );

    if (result == null || result.files.isEmpty) {
      return CustomSnackBar.showCustomErrorSnackBar(
        title: "Error",
        message: "Please Select Video",
      );
    }

    if (result.files.length > 2) {
      return CustomSnackBar.showCustomErrorSnackBar(
          title: "Error", message: "Please Select Only 2 Photos");
    }
    List<dio.MultipartFile> imageFiles = [];
    for (var image in result.files) {
      if (image.path != null) {
        var multipartFile =
            dio.MultipartFile.fromFileSync(image.path!, filename: image.name);
        imageFiles.add(multipartFile);
      }
    }
    pickedImages.value = imageFiles; // Assign the new list to the observable
  }
}
