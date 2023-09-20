part of 'index.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: ReflectionModelsListRoute.page,
          guards: [ApiKeyGuard()],
        ),
        AutoRoute(
          page: ReflectionModelRoute.page,
          guards: [ApiKeyGuard()],
          children: [
            AutoRoute(
              initial: true,
              page: ReflectionModelDisplayRoute.page,
            ),
            AutoRoute(
              page: ReflectionModelEditorRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: ReflectionRoute.page,
          guards: [ApiKeyGuard()],
          children: [
            AutoRoute(
              initial: true,
              page: ReflectionDisplayRoute.page,
            ),
            AutoRoute(
              page: ReflectionEditorRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: SetupRoute.page,
        ),
      ];
}

class ApiKeyGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (GetIt.I<Box>().get(kOpenAiApiKey) == null) {
      router.push(const SetupRoute());
    } else {
      resolver.next(true);
    }
  }
}
