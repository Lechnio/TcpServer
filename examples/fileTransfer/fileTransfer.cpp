#include "project_info.h"
#include "log.h"
#include "tcpServer.h"

#include <stdio.h>

int main()
{
    printf(
        "Example info:\n"
        "PROJECT_AUTHOR: %s\n"
        "PROJECT_COPYRIGHT: %s\n"
        "PROJECT_LICENSE: %s\n"
        "PROJECT_SITE: %s\n"
        "PROJECT_VERSION: %s\n",
        PROJECT_AUTHOR, PROJECT_COPYRIGHT, PROJECT_LICENSE, PROJECT_SITE, PROJECT_VERSION
    );
    
    TcpServer server = TcpServer(4880);
    
    server.run();
    
    return 0;
}
