#include "log.h"
#include "tcpServer.h"

#include <stdio.h>

int main()
{
    showProjectInfo();
    
    TcpServer server = TcpServer(4880);
    
    server.run();
    
    return 0;
}
