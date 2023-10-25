
import 'package:bloc/bloc.dart';
import 'package:bloc_api/bloc/request_event.dart';
import 'package:bloc_api/bloc/request_state.dart';
import '../resources/respository.dart';

class ProductsBloc extends Bloc<RequestEvent,RequestState>{

  final repository = Repository();

  ProductsBloc() : super(RequestState()){
    on<FetchProductEvent>((event, emit) => _onProductFetched(event, emit));
  }

  Future<void> _onProductFetched(
      RequestEvent event,
      Emitter<RequestState> emit) async {
        try {
          if (state.status == RequestStatus.loading) {
            final products = await repository.fetchProducts();
            return emit(
                state.copyWith(
                    status: RequestStatus.success,
                    productModel: products
                )
            );
          }
        }catch(e) {
          emit(
            state.copyWith(status: RequestStatus.error)
          );
        }
  }

}