/* times-cc.cc
 *
 * released under the MIT license
 */
#include <nan.h>

// have to declare as extern "C" or name mangling sets in and produces
// a runtime error
extern "C" float times_(float *a, float *b);

NAN_METHOD(times) {
  NanScope();

  float a = args[0]->NumberValue();
  float b = args[1]->NumberValue();

  float r = times_(&a, &b);

  NanReturnValue(v8::Number::New(double(r))); 
};

void init(v8::Handle<v8::Object> exports) {
  NODE_SET_METHOD(exports, "times", times);
}

NODE_MODULE(times, init);
