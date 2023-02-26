import 'package:dartz/dartz.dart';

import '../../network/network_exception.dart';
import '../entities/space_x_entities.dart';
import '../repositories/space_x_repository.dart';

class SpaceXLaunch {
  final SpaceXRepository _spaceXRepository;

  SpaceXLaunch(this._spaceXRepository);

  Future<Either<NetworkExceptions, List<SpaceXEntities>>> getAllSpaceXList() {
    return _spaceXRepository.getAllSpaceXList();
  }
}
