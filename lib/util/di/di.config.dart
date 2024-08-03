// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../features/about/data/source/remote/about_remote_datasource.dart'
    as _i84;
import '../../features/about/data/source/remote/about_remote_datasource_imp.dart'
    as _i582;
import '../../features/about/domain/repository/about_repository.dart' as _i649;
import '../../features/about/domain/repository/about_repository_imp.dart'
    as _i77;
import '../../features/about/domain/usecases/get_about.dart' as _i351;
import '../../features/about/domain/usecases/get_faqs.dart' as _i761;
import '../../features/about/domain/usecases/get_privacy_policy.dart' as _i1058;
import '../../features/about/domain/usecases/get_terms_and_conditions.dart'
    as _i554;
import '../../features/auth/data/repository/auth_repository_imp.dart' as _i794;
import '../../features/auth/data/source/local/auth_local_datasource_imp.dart'
    as _i115;
import '../../features/auth/data/source/remote/auth_remote_datasource_imp.dart'
    as _i716;
import '../../features/auth/domain/data/auth_local_datasource.dart' as _i1068;
import '../../features/auth/domain/data/auth_remote_datasource.dart' as _i998;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecases/current_user.dart' as _i659;
import '../../features/auth/domain/usecases/delete_auth.dart' as _i263;
import '../../features/auth/domain/usecases/delete_user.dart' as _i206;
import '../../features/auth/domain/usecases/get_auth.dart' as _i95;
import '../../features/auth/domain/usecases/initiate_reset_password_verification.dart'
    as _i777;
import '../../features/auth/domain/usecases/login_driver.dart' as _i358;
import '../../features/auth/domain/usecases/register_driver.dart' as _i159;
import '../../features/auth/domain/usecases/reset_password.dart' as _i1066;
import '../../features/auth/domain/usecases/save_auth.dart' as _i83;
import '../../features/auth/domain/usecases/update_profile.dart' as _i340;
import '../../features/auth/domain/usecases/verify_otp.dart' as _i975;
import '../../features/google_maps/domain/usecases/request_location_permission.dart'
    as _i659;
import '../../features/image_picker/data/source/remote/image_picker_data_source_impl.dart'
    as _i966;
import '../../features/image_picker/domain/data/image_picker_data_source.dart'
    as _i284;
import '../../features/image_picker/domain/usecases/pick_camera_image_usecase.dart'
    as _i125;
import '../../features/image_picker/domain/usecases/pick_gallery_image_usecase.dart'
    as _i109;
import '../../features/image_picker/domain/usecases/pick_multi_images_usecase.dart'
    as _i263;
import '../../features/image_picker/domain/usecases/request_camera_permission.dart'
    as _i45;
import '../../features/image_picker/domain/usecases/request_storage_permission.dart'
    as _i720;
import '../../helpers/network_call_helper/http_network_call_helper_impl.dart'
    as _i336;
import '../../helpers/network_call_helper/network_call_helper.dart' as _i73;
import '../../helpers/persistence/persistence_helper.dart' as _i86;
import '../../helpers/persistence/persistence_helper_imp.dart' as _i462;
import 'di.dart' as _i913;

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
    gh.lazySingleton<_i659.RequestLocationPermissionUsecase>(
        () => _i659.RequestLocationPermissionUsecase());
    gh.lazySingleton<_i45.RequestCameraPermissionUsecase>(
        () => _i45.RequestCameraPermissionUsecase());
    gh.lazySingleton<_i720.RequestStoragePermissionUsecase>(
        () => _i720.RequestStoragePermissionUsecase());
    gh.lazySingleton<_i974.Logger>(() => _i913.LoggerImp());
    gh.singleton<_i86.PersistenceHelper>(() => _i462.PersistenceHelperImpl());
    gh.lazySingleton<_i284.ImagePickerHelper>(
        () => _i966.ImagePickerImagePickerHelper());
    gh.lazySingleton<_i125.PickCameraImageUsecase>(() =>
        _i125.PickCameraImageUsecase(image: gh<_i284.ImagePickerHelper>()));
    gh.lazySingleton<_i109.PickGalleryImageUsecase>(() =>
        _i109.PickGalleryImageUsecase(image: gh<_i284.ImagePickerHelper>()));
    gh.lazySingleton<_i263.PickMultiGalleryImagesUsecase>(() =>
        _i263.PickMultiGalleryImagesUsecase(
            image: gh<_i284.ImagePickerHelper>()));
    gh.lazySingleton<_i1068.AuthLocalDataSource>(
        () => _i115.AuthLocalDataSourceImp(
              logger: gh<_i974.Logger>(),
              persistenceHelper: gh<_i86.PersistenceHelper>(),
            ));
    gh.lazySingleton<_i73.NetworkCallHelper>(
        () => _i336.HttpNetworkCallHelperImpl(logger: gh<_i974.Logger>()));
    gh.lazySingleton<_i84.AboutRemoteDataSource>(
        () => _i582.AboutRemoteDataSourceImp(
              logger: gh<_i974.Logger>(),
              networkCallHelper: gh<_i73.NetworkCallHelper>(),
            ));
    gh.lazySingleton<_i649.AboutRepository>(() => _i77.AboutRepositoryImp(
        aboutRemoteDataSource: gh<_i84.AboutRemoteDataSource>()));
    gh.lazySingleton<_i998.AuthRemoteDataSource>(
        () => _i716.AuthRemoteDataSourceImp(
              logger: gh<_i974.Logger>(),
              networkCallHelper: gh<_i73.NetworkCallHelper>(),
            ));
    gh.lazySingleton<_i351.GetAboutUsecase>(() =>
        _i351.GetAboutUsecase(aboutRepository: gh<_i649.AboutRepository>()));
    gh.lazySingleton<_i761.GetFaqsUsecase>(() =>
        _i761.GetFaqsUsecase(aboutRepository: gh<_i649.AboutRepository>()));
    gh.lazySingleton<_i1058.GetPrivacyPolicyUsecase>(() =>
        _i1058.GetPrivacyPolicyUsecase(
            aboutRepository: gh<_i649.AboutRepository>()));
    gh.lazySingleton<_i554.GetTermsAndConditionsUsecase>(() =>
        _i554.GetTermsAndConditionsUsecase(
            aboutRepository: gh<_i649.AboutRepository>()));
    gh.lazySingleton<_i961.AuthRepository>(() => _i794.AuthRepositoryImp(
          authRemoteDataSource: gh<_i998.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i1068.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i659.CurrentUserUsecase>(() =>
        _i659.CurrentUserUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i263.DeleteAuthUsecase>(() =>
        _i263.DeleteAuthUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i206.DeleteUserUsecase>(() =>
        _i206.DeleteUserUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i95.GetAuthUsecase>(
        () => _i95.GetAuthUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i777.InitiateResetPasswordVerificationUsecase>(() =>
        _i777.InitiateResetPasswordVerificationUsecase(
            authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i358.LoginDriverUsecase>(() =>
        _i358.LoginDriverUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i159.RegisterDriverUsecase>(() =>
        _i159.RegisterDriverUsecase(
            authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i1066.ResetPasswordUsecase>(() =>
        _i1066.ResetPasswordUsecase(
            authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i83.SaveAuthUsecase>(
        () => _i83.SaveAuthUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i340.UpdateProfileUsecase>(() =>
        _i340.UpdateProfileUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i975.VerifyOtpUsecase>(() =>
        _i975.VerifyOtpUsecase(authRepository: gh<_i961.AuthRepository>()));
    return this;
  }
}
