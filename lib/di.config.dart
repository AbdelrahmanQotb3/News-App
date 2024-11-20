// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;

import 'Data/Repos/news_repo/data_sources/local_data_source/news_local_data_source.dart'
    as _i928;
import 'Data/Repos/news_repo/data_sources/local_data_source/news_local_data_source_impl.dart'
    as _i519;
import 'Data/Repos/news_repo/data_sources/news_repo.dart' as _i728;
import 'Data/Repos/news_repo/data_sources/news_repo_impl.dart' as _i23;
import 'Data/Repos/news_repo/data_sources/remote_data_sources/news_remot_data_source_impl.dart'
    as _i206;
import 'Data/Repos/news_repo/data_sources/remote_data_sources/news_remote_data_source.dart'
    as _i456;
import 'third_party_package_module.dart' as _i136;
import 'ui/screens/home/tabs/news/TabsDetails/tabs_details_view_model.dart'
    as _i12;
import 'ui/screens/home/tabs/news/TabsList/tabs_list_view_model.dart' as _i751;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyPackagesModule = _$ThirdPartyPackagesModule();
    gh.factory<_i161.InternetConnection>(
        () => thirdPartyPackagesModule.provideInternetConnectionChecker());
    gh.factory<_i456.NewsRemoteDateSource>(
        () => _i206.NewsRemoteDataSourceImpl());
    gh.factory<_i928.NewsLocalDataSource>(
        () => _i519.NewsLocalDataSourceImpl());
    gh.factory<_i728.NewsRepo>(() => _i23.NewsRepoImpl(
          gh<_i456.NewsRemoteDateSource>(),
          gh<_i928.NewsLocalDataSource>(),
          gh<_i161.InternetConnection>(),
        ));
    gh.factory<_i12.TabsDetailsViewModel>(
        () => _i12.TabsDetailsViewModel(gh<_i728.NewsRepo>()));
    gh.factory<_i751.TabsListViewModel>(
        () => _i751.TabsListViewModel(gh<_i728.NewsRepo>()));
    return this;
  }
}

class _$ThirdPartyPackagesModule extends _i136.ThirdPartyPackagesModule {}
