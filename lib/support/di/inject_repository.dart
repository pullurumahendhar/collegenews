import 'package:FlutterNews/repository/notice_repository/notice_repository.dart';
import 'package:FlutterNews/support/conection/api.dart';
import 'package:bsev/bsev.dart';
import 'package:bsev/flavors.dart';

injectRepository(Injector injector) {
  // https://code.swecha.org/KarthikPonnam/collegenews/raw/master/news.json
  injector.registerSingleton((i) {
    Api _api;
    switch (Flavors().getFlavor()) {
      case Flavor.PROD:
        // _api = Api("http://104.131.18.84");
        _api =
            Api("https://raw.githubusercontent.com/pullurumahendhar/newsdata/");
        break;
      case Flavor.HOMOLOG:
        _api = Api("");
        break;
      case Flavor.DEBUG:
        _api = Api("");
        break;
    }
    return _api;
  });

  injector.registerDependency<NoticeRepository>(
      (i) => NoticeRepositoryImpl(i.getDependency()));
}
