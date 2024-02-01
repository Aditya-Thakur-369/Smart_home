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
  static AppRouter homescreen = AppRouter(name: "/home", path: '/home');
  static AppRouter detailsscreen =
      AppRouter(name: "/details", path: "/details");
}
