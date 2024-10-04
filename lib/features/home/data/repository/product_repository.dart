import 'package:dartz/dartz.dart';
import 'package:digiflay_task/core/database/api/api_consumer.dart';
import 'package:digiflay_task/core/database/api/end_points.dart';
import 'package:digiflay_task/features/home/data/models/product_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/service/service_locator.dart';

class ProductRepository {


  //get product
  Future<Either<String, GetAllProductsModel>> getProduct() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.products,
      );
      return Right(GetAllProductsModel.fromJson(response));
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }


}
