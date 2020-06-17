import 'dart:async';

class SimpleBloc<T> {
  final _controller = StreamController<T>();

  Stream<T> get stream => _controller.stream;

  void add(T object){
    _controller.add(object);
  }

  void dispose() {
    _controller.close();
  }
}
