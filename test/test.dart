import 'package:test/test.dart';
import 'package:news_app/counter.dart';


void main(){
  test('test counter', (){
    final counter = Counter();
    
    counter.increment();

    expect(counter.value, 1);

  });
}