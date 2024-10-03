import 'package:bloc/bloc.dart';
import 'package:digiflay_task/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:digiflay_task/features/home/data/models/product_model.dart';
import 'package:digiflay_task/features/home/data/repository/product_repository.dart';
import 'package:digiflay_task/features/home/presentation/screens/home_body_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.productRepository) : super(HomeInitial());

  final ProductRepository productRepository;


  List<Widget> screens = [
     const HomeBodyScreen(),
     const SignUpScreen(),
  ];
  int currentIndex = 0;

  void changeIndex(index){
    currentIndex = index ;
    emit(ChangeIndexState());
  }


  // get Products...
  List<ProductModel> products = [];
  void getProducts() async {
    emit(ProductsLoading());
    final result = await productRepository.getProduct();
    result.fold(
          (l) => emit(ProductsError(l)),
          (r) async {
            products = r.products;
        emit(ProductsSuccess());
      },
    );
  }

}


