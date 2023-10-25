

import 'package:bloc_api/models/product_model.dart';
import 'package:equatable/equatable.dart';

enum RequestStatus { loading, success, error}

class RequestState extends Equatable{

  const RequestState({ // initial value
    this.status = RequestStatus.loading,
    this.productModel = const ProductModel(products: <Product>[], total: 0, skip: 0, limit: 0)
  });

  final RequestStatus status;
  final ProductModel productModel;

  RequestState copyWith({ // update value
    RequestStatus? status,
    ProductModel? productModel,
  }) {
    return RequestState(
      status: status ?? this.status,
      productModel: productModel ?? this.productModel,
    );
  }

  @override
  List<Object?> get props => [ status , productModel ];

}