#ifndef _HTTP_SERVER_H_
#define _HTTP_SERVER_H_

//! Declare the Standard Library
#include <cstring>
#include <string>

#include <netinet/in.h>
#include <sys/socket.h>
//! Function to create the connection socket
int create_socket();

//! Function to bind to the connection socket
void bind_socket();

//! Function to listen to socket
void listen_socket();

void accept();

#endif  //! _HTTP_SERVER_H_
