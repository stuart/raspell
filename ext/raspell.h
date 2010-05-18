
#ifndef _RASPELL_GLOBAL_H
#define _RASPELL_GLOBAL_H

#include <ruby.h>
#include <aspell.h>

/* Ruby 1.9 compatability */
#ifndef RSTRING_PTR
    #define RSTRING_PTR(x) (RSTRING(X)->ptr)
#endif
#ifndef RSTRING_LEN
    #define RSTRING_LEN(x) (RSTRING(X)->len)
#endif

VALUE cAspell;
VALUE cDictInfo;

VALUE cAspellError;

#endif
