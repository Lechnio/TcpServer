#pragma once

#ifdef DEBUG
#   define dlog(msg, ...) printf("D: " msg "\n", __VA_ARGS__)
#else
#   define dlog(msg, ...)
#endif
