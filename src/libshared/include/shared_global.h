#ifndef SHARED_GLOBAL_H
#define SHARED_GLOBAL_H

#ifdef _WIN32
#define DECL_EXPORT __declspec(dllexport)
#define DECL_IMPORT __declspec(dllimport)
#else
#define DECL_EXPORT
#define DECL_IMPORT
#endif

#ifndef LIBSHARED_API
#ifdef LIBSHARED_STATIC
#define LIBSHARED_API
#else
#ifdef LIBSHARED_LIBRARY
#define LIBSHARED_API DECL_EXPORT
#else
#define LIBSHARED_API DECL_IMPORT
#endif
#endif
#endif

#endif // SHARED_GLOBAL_H
