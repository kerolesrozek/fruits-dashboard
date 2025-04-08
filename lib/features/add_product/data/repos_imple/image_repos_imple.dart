import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/failures.dart';
import 'package:fruits_dashboard/features/add_product/data/data_sources/images_remote_data_source.dart';
import 'package:fruits_dashboard/features/add_product/domain/repos/images_repos.dart';

class ImageReposImple extends ImagesRepos {
  final ImagesRemoteDataSource imagesRemoteDataSource;

  ImageReposImple({required this.imagesRemoteDataSource});
  @override
  Future<Either<Failures, String>> uploadImage({
    required File imageFile,
  }) async {
    try {
      return right(
        await imagesRemoteDataSource.uploadImageToCloudNairy(
          imageFile: imageFile,
        ),
      );
    } catch (e) {
      log(' error in image reposimple is ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
