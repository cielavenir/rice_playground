#if RICE_VERSION >= 40000
#include <rice/rice.hpp>
#else
#include <rice/Class.hpp>
#include <rice/Constructor.hpp>
#include <rice/Module.hpp>
#include <rice/String.hpp>
#endif

extern "C" {
#include <stdlib.h>
}

#if RICE_VERSION >= 30000
#define RICE_PROTECT Rice::detail::protect
#define RICE_TORUBY Rice::detail::to_ruby
#define RICE_CTOR_PARENSL
#define RICE_CTOR_PARENSR
#else
#define RICE_PROTECT Rice::protect
#define RICE_TORUBY to_ruby
#define RICE_CTOR_PARENSL (
#define RICE_CTOR_PARENSR )
#endif

static inline Rice::String MakeStringFromBuffer(const char *ptr, long len){
	return Rice::Builtin_Object<T_STRING>(RICE_PROTECT(rb_str_new, ptr, len));
}

class toyclass{
public:
	void sleep(int duration){
		::sleep(duration);
	}
};

extern "C"
void Init_rice_playground()
{
	auto module = Rice::define_module("RicePlayground")
	;

	Rice::define_class_under<toyclass>(module,"ToyClass")
	.define_constructor(Rice::Constructor<toyclass>())
	.define_method("sleep", &toyclass::sleep)
	;
}
