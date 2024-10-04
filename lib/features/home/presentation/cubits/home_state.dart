part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChangeIndexState extends HomeState{}
final class ProductsLoading extends HomeState{}
final class ProductsSuccess extends HomeState{}
final class ProductsError extends HomeState{
  final String message ;
  ProductsError(this.message);
}
