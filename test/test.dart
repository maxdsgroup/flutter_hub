import 'package:test/test.dart';
import 'package:flutter_hub/counter.dart';


void main(){
  test('test counter', (){
    final counter = Counter();
    
    counter.increment();

    expect(counter.value, 1);

  });
}