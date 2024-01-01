#include "../include/Http_Server.h"

#include <cstring>
#include <iostream>

#include <sys/socket.h>

int create_socket()
{
  int ServerSocket{};
  ServerSocket = socket(AF_INET, SOCK_STREAM, 0);
  return ServerSocket;
}
