import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/failures.dart';

abstract class ImagesRepos {
  Future<Either<Failures, String>> uploadImage({required File imageFile});
}
