import 'package:dartz/dartz.dart';

import '../../../core/network/network_exception.dart';
import '../entities/space_x_entities.dart';

abstract class SpaceXRepository {
  Future<Either<NetworkExceptions, List<SpaceXEntities>>> getAllSpaceXList();
}
