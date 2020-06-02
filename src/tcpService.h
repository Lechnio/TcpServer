#include "tcpClient.h"

class TcpServer {
    
    int port;
    
    public:
        TcpServer(int port);
        
        void run();
};
