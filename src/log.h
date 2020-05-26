#pragma once

#include "project_info.h"
#include <stdio.h>

#ifdef DEBUG
#   define dlog(msg, ...) printf("D: " msg "\n", ## __VA_ARGS__)
#else
#   define dlog(msg, ...)
#endif

inline void showProjectInfo()
{
    printf(
        "PROJECT_AUTHOR: %s\n"
        "PROJECT_COPYRIGHT: %s\n"
        "PROJECT_LICENSE: %s\n"
        "PROJECT_SITE: %s\n"
        "PROJECT_VERSION: %s\n",
        PROJECT_AUTHOR, PROJECT_COPYRIGHT, PROJECT_LICENSE, PROJECT_SITE, PROJECT_VERSION);
}
