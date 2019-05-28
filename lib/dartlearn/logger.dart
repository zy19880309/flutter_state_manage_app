class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = {};

  Logger._internal(this.name);

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}
