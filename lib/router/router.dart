class AppRouter {
  String name;
  String path;
  AppRouter({
    required this.name,
    required this.path,
  });
}

class Routes {
  static AppRouter navigaiton = AppRouter(name: "/", path: '/');
}
