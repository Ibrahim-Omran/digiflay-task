import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../service/service_locator.dart';
import '../cache/cache_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());


  //bool isArabic = false ;
  String langCode = 'en';
  void changeLang(String codeLang)async{
  emit(ChangeLangLoading());
  //isArabic = !isArabic;
  langCode = codeLang;
  await sl<CacheHelper>().cacheLanguage(codeLang);
  emit(ChangeLangSuccess());
  }

  void getCachedLang(){
  emit(ChangeLangLoading());
  final cachedLang = sl<CacheHelper>().getCachedLanguage();
  langCode = cachedLang;
  emit(ChangeLangSuccess());
  }

}

