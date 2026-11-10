---
type: class
class_kind: textbook
status: seed
created: 2026-11-09
updated: 2026-11-09
tags:
  - class
  - textbook
area:
next:
---
# Chapter - 16
**Source:**
**Read from:**
**Course role:**
## Chapter Summary
<!-- The chapter's one-sentence claim with exactly one ==highlight==, then a *Mechanism:* line. -->
## Key Concepts
<!-- Each concept defined in context, with its role and the condition that prevents misuse. -->
## Full Reading Notes
# 16.1 to 16.3.2 
````
# Chapter - 16: Network IPC: Sockets
## Chapter Summary
==Sockets provide a unified endpoint abstraction that enables bidirectional communication between processes across distinct networked hosts or within the same machine using standard file descriptors.==
*Mechanism:* A process invokes socket() to allocate a kernel-managed network communication endpoint specified by domain, socket type, and protocol, obtaining a socket descriptor that operates with standard I/O system calls like read() and write() (pp. 589–590). Before exchanging binary data across a network, processes serialize addresses and integer payloads into big-endian network byte order using conversion functions (htonl/htons), populate domain-specific address structures (sockaddr_in or sockaddr_in6) cast to generic sockaddr pointers, and coordinate connection states or endpoint termination via shutdown() independently of descriptor reference counts (pp. 592–596).
## Key Concepts
- **socket**: An abstraction of a communication endpoint implemented as a file descriptor in the UNIX System (p. 589–590; Lec15).
- **network IPC**: Interprocess communication mechanisms enabling processes running on different computers over a network to exchange data (p. 589).
- **TCP/IP protocol suite**: The de facto standard network protocol suite for Internet communication (p. 589; Lec15).
- **socket descriptor**: File descriptor returned by socket() representing an active network endpoint (p. 590; Lec15).
- **socket**: System call creating a communication endpoint defined by domain, type, and protocol (p. 590; Lec15).
- **AF_INET**: Address family constant representing the IPv4 Internet communication domain (p. 590; Lec15).
- **AF_INET6**: Address family constant representing the IPv6 Internet communication domain (p. 590; Lec15).
- **AF_UNIX**: Address family constant representing the UNIX domain local communication interface (p. 590).
- **AF_LOCAL**: POSIX alias for AF_UNIX representing local intramachine socket communication (p. 590).
- **AF_UNSPEC**: Wildcard address family constant representing an unspecified communication domain (p. 590).
- **SOCK_STREAM**: Socket type providing sequenced, reliable, bidirectional, connection-oriented byte streams without message boundaries (p. 590–591; Lec15).
- **SOCK_DGRAM**: Socket type providing fixed-length, connectionless, unreliable message datagrams (p. 590–591; Lec15).
- **SOCK_SEQPACKET**: Socket type providing fixed-length, sequenced, reliable, connection-oriented messages preserving record boundaries (p. 590–591).
- **SOCK_RAW**: Socket type providing a datagram interface directly to the underlying network layer (IP), bypassing transport protocols and requiring superuser privileges (p. 590–592).
- **IPPROTO_TCP**: Transport protocol constant selecting Transmission Control Protocol (p. 590–591; Lec15).
- **IPPROTO_UDP**: Transport protocol constant selecting User Datagram Protocol (p. 591; Lec15).
- **IPPROTO_IP**: Protocol constant selecting IPv4 Internet Protocol (p. 591).
- **IPPROTO_IPV6**: Protocol constant selecting IPv6 Internet Protocol (p. 591).
- **IPPROTO_ICMP**: Protocol constant selecting Internet Control Message Protocol (p. 591).
- **IPPROTO_RAW**: Protocol constant selecting raw IP packet access (p. 591).
- **SCTP**: Stream Control Transmission Protocol providing a sequential packet service in the Internet domain (p. 591).
- **shutdown**: System call disabling read, write, or bidirectional socket communication independently of open descriptor reference counts (p. 592–593).
- **SHUT_RD**: Option flag to shutdown disabling socket read operations (p. 592).
- **SHUT_WR**: Option flag to shutdown disabling socket transmission and transmitting an end-of-file indication to the peer (p. 592–593).
- **SHUT_RDWR**: Option flag to shutdown disabling both data transmission and data reception (p. 592).
- **port number**: 16-bit integer identifying a specific service or receiving process on a networked host (p. 593; Lec15).
- **byte order**: Processor architecture characteristic dictating how bytes are ordered within multi-byte data types in memory (p. 593; Lec15).
- **big-endian**: Byte ordering where the most significant byte is stored at the lowest byte address (p. 593–594).
- **little-endian**: Byte ordering where the least significant byte is stored at the lowest byte address (p. 593–594).
- **most significant byte** (MSB): The highest-order byte of a numeric value, positioned leftmost in positional notation (p. 593).
- **least significant byte** (LSB): The lowest-order byte of a numeric value, positioned rightmost in positional notation (p. 593).
- **network byte order**: Standard big-endian byte order mandated by the TCP/IP protocol suite for packet headers and network addresses (p. 594; Lec15).
- **host byte order**: The native byte ordering supported by the local machine's processor architecture (p. 594; Lec15).
- **htonl**: Function converting a 32-bit unsigned integer from host byte order to network byte order (p. 594).
- **htons**: Function converting a 16-bit unsigned integer from host byte order to network byte order (p. 594).
- **ntohl**: Function converting a 32-bit unsigned integer from network byte order to host byte order (p. 594).
- **ntohs**: Function converting a 16-bit unsigned integer from network byte order to host byte order (p. 594).
- **struct sockaddr**: Generic socket address structure to which domain-specific address structures are cast when passed to socket functions (p. 595).
- **sa_family_t**: Primitive integer data type representing the address family of a socket address structure (p. 595).
- **struct sockaddr_in**: Domain-specific IPv4 socket address structure defined in `<netinet/in.h>` (p. 595; Lec16).
- **in_port_t**: Unsigned 16-bit integer type (`uint16_t`) storing an Internet port number in network byte order (p. 595).
- **in_addr_t**: Unsigned 32-bit integer type (`uint32_t`) storing an IPv4 address in network byte order (p. 595).
- **struct in_addr**: Structure holding a 32-bit IPv4 address member `s_addr` (p. 595).
- **sin_zero**: Padding field in `struct sockaddr_in` reserved to align structure size with generic `struct sockaddr` (p. 596).
- **struct sockaddr_in6**: Domain-specific IPv6 socket address structure defined in `<netinet/in.h>` (p. 595–596).
- **struct in6_addr**: Structure holding a 128-bit IPv6 address byte array `s6_addr` (p. 595).
- ==**inet_ntop**==: Function converting a binary network address in network byte order into a human-readable text string (p. 596).
- **inet_pton**: Function converting a human-readable text string into a binary network address in network byte order (p. 596).
- **INET_ADDRSTRLEN**: System constant (16 bytes) specifying the buffer size needed to hold an IPv4 dotted-decimal string (p. 596).
- **INET6_ADDRSTRLEN**: System constant (46 bytes) specifying the buffer size needed to hold an IPv6 text string (p. 596).
## Full Reading Notes
### 16.1 Introduction
Classical IPC mechanisms (pipes, FIFOs, message queues, semaphores, shared memory) allow processes running on the same computer to communicate (p. 589).
Network IPC enables processes executing on different computers connected across a network to exchange data (p. 589).
A core design goal of the socket interface is providing a single, uniform API that operates identically for both intermachine (network) communication and intramachine (local) communication (p. 589).
Although sockets support diverse protocol families, this chapter restricts discussion to the TCP/IP protocol suite as the de facto Internet standard (p. 589).
The POSIX.1 socket API is derived from the 4.4BSD socket interface, which closely mirrors the original 4.2BSD implementation from the early 1980s (p. 589).
### 16.2 Socket Descriptors
A socket is an abstraction of a communication endpoint accessed by applications using socket descriptors (p. 590).
Socket descriptors are implemented as standard UNIX file descriptors, allowing file functions like `read()` and `write()` to operate directly on connected sockets (p. 590).
*Function Prototype (`<sys/socket.h>`):*
```c
#include <sys/socket.h>

int socket(int domain, int type, int protocol);
````

Returns: socket descriptor if OK, -1 on error (p. 590). _Argument Definitions:_

1. `domain`: Selects the communication domain and address family, prefixed with `AF_` (Figure 16.1, p. 590):

- `AF_INET`: IPv4 Internet domain (p. 590).
- `AF_INET6`: IPv6 Internet domain (optional in POSIX.1) (p. 590).
- `AF_UNIX`: UNIX domain for local intramachine communication (alias `AF_LOCAL`) (p. 590).
- `AF_UNSPEC`: Wildcard representing "any" unspecified domain (p. 590).

2. `type`: Establishes socket communication characteristics (Figure 16.2, p. 590):

- `SOCK_STREAM`: Sequenced, reliable, bidirectional, connection-oriented byte streams (p. 590).
- `SOCK_DGRAM`: Fixed-length, connectionless, unreliable messages (datagrams) (p. 590).
- `SOCK_SEQPACKET`: Fixed-length, sequenced, reliable, connection-oriented messages (p. 590).
- `SOCK_RAW`: Direct datagram interface to the network layer (IP), bypassing transport protocols; requires superuser privilege to prevent rogue packet crafting (pp. 590–592).

3. `protocol`: Selects transport protocol; passing 0 chooses the default protocol for the given domain and type (Figure 16.3, pp. 590–591):

- `AF_INET` with `SOCK_STREAM`: Defaults to `IPPROTO_TCP` (Transmission Control Protocol) (pp. 590–591).
- `AF_INET` with `SOCK_DGRAM`: Defaults to `IPPROTO_UDP` (User Datagram Protocol) (p. 591).
- Other defined Internet protocols: `IPPROTO_IP` (IPv4), `IPPROTO_IPV6` (IPv6), `IPPROTO_ICMP` (Internet Control Message Protocol), `IPPROTO_RAW` (Raw IP packets) (p. 591). _Datagram vs. Byte Stream Characteristics:_
- Connectionless Datagrams (`SOCK_DGRAM`): Peers require no logical connection setup; messages are addressed and dispatched independently; arrival is unreliable and unsequenced (p. 591).
- Connection-Oriented Byte Streams (`SOCK_STREAM`): Peers must establish an end-to-end logical connection before exchanging data; delivery is reliable and byte-ordered (p. 591). ==Unlike datagram sockets, a SOCK_STREAM byte-stream socket preserves no record or message boundaries; data emitted in multiple write operations may be coalesced or delivered across arbitrary read chunks.==
- Sequenced Packet Service (`SOCK_SEQPACKET`): Reliable and connection-oriented like `SOCK_STREAM`, but message-based like `SOCK_DGRAM`; `read()` returns the exact record boundary chunk written by the sender (Stream Control Transmission Protocol / SCTP provides this in the Internet domain) (p. 591). _File Descriptor Functions on Sockets (Figure 16.4):_
- `close()`: Relinquishes access and deallocates the socket descriptor (p. 592).
- `dup()` / `dup2()`: Duplicates the socket descriptor normally (p. 592).
- `fchdir()`: Fails, setting `errno` to `ENOTDIR` (p. 592).
- `fchmod()`: Unspecified behavior (p. 592).
- `fchown()`: Implementation-defined behavior (p. 592).
- `fcntl()`: Supports commands `F_DUPFD`, `F_DUPFD_CLOEXEC`, `F_GETFD`, `F_SETFD`, `F_GETFL`, `F_SETFL`, `F_GETOWN`, and `F_SETOWN` (p. 592).
- `fdatasync()` / `fsync()`: Implementation-defined behavior (p. 592).
- `fstat()`: Supports select `stat` structure fields; specific population is implementation-defined (p. 592).
- `lseek()`: Fails, setting `errno` to `ESPIPE` because sockets do not support file offsets (p. 592).
- `read()` / `readv()`: Equivalent to `recv()` without options (p. 592).
- `write()` / `writev()`: Equivalent to `send()` without options (p. 592). _shutdown Function Prototype (`<sys/socket.h>`):_

```
#include <sys/socket.h>

int shutdown(int sockfd, int how);
```

Returns: 0 if OK, -1 on error (p. 592). _Operational Flags for how:_

- `SHUT_RD`: Disables reading from the socket (p. 592).
- `SHUT_WR`: Disables transmission from the socket (transmits FIN/EOF indicator to peer) (p. 592).
- `SHUT_RDWR`: Disables both reading and transmission (p. 592). _shutdown versus close:_

1. Descriptor Reference Counts: `close()` deallocates a socket endpoint only when its last active reference is closed (if a descriptor was duplicated via `fork()` or `dup()`, the socket remains active until all referencing descriptors are closed); `shutdown()` deactivates the socket endpoint immediately regardless of how many descriptors reference it (p. 593).
2. Unidirectional Teardown: `shutdown(sockfd, SHUT_WR)` allows a process to close its transmission channel to signal EOF to the remote peer while keeping the receive channel open to read the peer's response (p. 593).

### 16.3 Addressing

Identifying a network communication target requires two components: a network host address (identifying the destination computer) and a port number (identifying the specific process/service on that host) (p. 593).

### 16.3.1 Byte Ordering

Byte order is a hardware processor architecture characteristic dictating the storage arrangement of bytes within multi-byte data types (p. 593). _Endianness Definitions (Figure 16.5):_

- Big-endian: The most significant byte (MSB) is stored at the lowest byte memory address ($n$), while the least significant byte (LSB) is stored at the highest memory address ($n+3$) (p. 593).
- Little-endian: The least significant byte (LSB) is stored at the lowest byte memory address ($n$), while the most significant byte (MSB) is stored at the highest memory address ($n+3$) (p. 593).
- Byte Positions: Regardless of endianness, in written integer notation the MSB is on the left and the LSB is on the right (p. 593). _Value 0x04030201 Memory Layout:_ For integer `0x04030201`, MSB is `0x04` and LSB is `0x01` (p. 593). Casting character pointer `cp` to the integer address:
- Little-endian: `cp == 0x01` (LSB), `cp == 0x02`, `cp == 0x03`, `cp == 0x04` (MSB) (p. 593–594).
- Big-endian: `cp == 0x04` (MSB), `cp == 0x03`, `cp == 0x02`, `cp == 0x01` (LSB) (p. 594). _Platform Byte Order (Figure 16.6):_
- FreeBSD 8.0 (Intel Pentium): little-endian (p. 594).
- Linux 3.2.0 (Intel Core i5): little-endian (p. 594).
- Mac OS X 10.6.8 (Intel Core 2 Duo): little-endian (p. 594).
- Solaris 10 (Sun SPARC): big-endian (p. 594). _Network Byte Order Requirement:_ The TCP/IP protocol suite defines network byte order as big-endian (p. 594). All protocol headers and numeric addresses transmitted over the network must be formatted in network byte order (p. 594). _Byte Order Conversion Functions (`<arpa/inet.h>`):_

```
#include <arpa/inet.h>

uint32_t htonl(uint32_t hostint32);
uint16_t htons(uint16_t hostint16);
uint32_t ntohl(uint32_t netint32);
uint16_t ntohs(uint16_t netint16);
```

- `htonl()`: Converts a 32-bit integer from host byte order to network byte order; returns 32-bit integer in network byte order (p. 594).
- `htons()`: Converts a 16-bit integer from host byte order to network byte order; returns 16-bit integer in network byte order (p. 594).
- `ntohl()`: Converts a 32-bit integer from network byte order to host byte order; returns 32-bit integer in host byte order (p. 594).
- `ntohs()`: Converts a 16-bit integer from network byte order to host byte order; returns 16-bit integer in host byte order (p. 594).
- Naming Mnemonic: `h` = host, `n` = network, `l` = long (32-bit integer), `s` = short (16-bit integer) (p. 594). Often implemented as macros (p. 594).

### 16.3.2 Address Formats

An address identifies a socket endpoint within a specific communication domain (p. 595). Because address formats differ across domains, addresses are cast to a generic `struct sockaddr` when passed to socket functions (p. 595). _Generic Socket Address Structure (`<sys/socket.h>`):_

```
struct sockaddr {
    sa_family_t sa_family; /* address family */
    char        sa_data[];  /* variable-length address */
};
```

Platform Implementations: On Linux, `sa_data` is declared as `char sa_data;`; on FreeBSD, the structure includes a length field: `unsigned char sa_len; sa_family_t sa_family; char sa_data;` (p. 595). _IPv4 Socket Address Structures (`<netinet/in.h>`):_

```
struct in_addr {
    in_addr_t s_addr; /* IPv4 address */
};

struct sockaddr_in {
    sa_family_t    sin_family; /* address family */
    in_port_t      sin_port;   /* port number */
    struct in_addr sin_addr;   /* IPv4 address */
};
```

Data types: `in_port_t` is `uint16_t` and `in_addr_t` is `uint32_t` (from `<stdint.h>`) (p. 595). Both must be stored in network byte order (p. 594). On Linux, `struct sockaddr_in` includes padding: `unsigned char sin_zero;`, which must be zero-filled to match generic `sockaddr` size (p. 596). _IPv6 Socket Address Structures (`<netinet/in.h>`):_

```
struct in6_addr {
    uint8_t s6_addr; /* IPv6 address */
};

struct sockaddr_in6 {
    sa_family_t     sin6_family;   /* address family */
    in_port_t       sin6_port;     /* port number */
    uint32_t        sin6_flowinfo; /* traffic class and flow info */
    struct in6_addr sin6_addr;     /* IPv6 address */
    uint32_t        sin6_scope_id; /* set of interfaces for scope */
};
```

Required by the Single UNIX Specification; `sin6_addr` contains a 128-bit (16-byte) network address (p. 595–596). Both `sockaddr_in` and `sockaddr_in6` are cast to `(struct sockaddr *)` when passed to socket APIs (p. 596). _Address Presentation Conversion Functions (`<arpa/inet.h>`):_

```
#include <arpa/inet.h>

const char *inet_ntop(int domain, const void *restrict addr,
                      char *restrict str, socklen_t size);
int inet_pton(int domain, const char *restrict str,
              void *restrict addr);
```

- `inet_ntop()`: Converts a binary network address in network byte order into a text string; returns pointer to `str` on success, or NULL on error (p. 596). Buffer size is passed in `size`; constants `INET_ADDRSTRLEN` (16 bytes) and `INET6_ADDRSTRLEN` (46 bytes) guarantee sufficient buffer capacity (p. 596).
- `inet_pton()`: Converts a text string into a binary network address in network byte order; returns 1 on success, 0 if the string is invalid, or -1 on error (p. 596). The `addr` buffer must be 32 bits for `AF_INET` or 128 bits for `AF_INET6` (p. 596).
- Supported Domains: Both functions support only `AF_INET` and `AF_INET6`, replacing obsolete IPv4-only functions `inet_addr()` and `inet_ntoa()` (p. 596).

## Worked Example

Tracing integer `0x04030201` on a little-endian Linux host (Intel x86) through `htonl()` and `ntohl()`:

1. _Variable Definition & Initial Assignment:_ A program initializes `uint32_t host_val = 0x04030201;` (p. 593). In hexadecimal notation, `0x04` is the most significant byte (MSB) and `0x01` is the least significant byte (LSB).
2. _Host Memory Layout (Figure 16.5 & Figure 16.6):_ Because Linux on Intel architecture is little-endian, multi-byte integers place the least significant byte at the lowest memory address (p. 593–594). Casting a pointer `unsigned char *cp = (unsigned char *)&host_val;` reveals memory addresses $n$ through $n+3$:

- `cp` (address $n$): `0x01` (LSB)
- `cp` (address $n+1$): `0x02`
- `cp` (address $n+2$): `0x03`
- `cp` (address $n+3$): `0x04` (MSB)

3. _Conversion to Network Byte Order via htonl():_ The program executes `uint32_t net_val = htonl(host_val);` (p. 594). Network byte order requires big-endian format, where the most significant byte (`0x04`) must reside at the lowest memory address ($n$) (p. 594).
4. _Memory Transformation on Little-Endian Host:_ ==Applying htonl to 0x04030201 on a little-endian host reverses the byte sequence in memory from 0x01, 0x02, 0x03, 0x04 to 0x04, 0x03, 0x02, 0x01, converting host representation 0x04030201 into integer value 0x01020304 whose memory layout matches big-endian network byte order.== Examining `unsigned char *np = (unsigned char *)&net_val;`:

- `np` (address $n$): `0x04` (MSB of the original quantity)
- `np` (address $n+1$): `0x03`
- `np` (address $n+2$): `0x02`
- `np` (address $n+3$): `0x01` (LSB of the original quantity) As an integer evaluated under little-endian rules, `net_val` evaluates to `0x01020304`. When transmitted byte-by-byte across the network starting at address $n$, bytes arrive as `0x04`, `0x03`, `0x02`, `0x01`—the exact big-endian sequence required by network protocols.

5. _Restoration via ntohl():_ The receiver (or host) calls `uint32_t restored_val = ntohl(net_val);`. On little-endian hardware, `ntohl()` reverses the bytes again, restoring `restored_val` to `0x04030201` with memory bytes `0x01, 0x02, 0x03, 0x04`. On a big-endian machine (like Sun SPARC Solaris 10), `htonl()` and `ntohl()` are defined as no-op identity macros leaving bytes unaltered (p. 594).

## Connections

_Lecture Framing (Lec15 & Lec16):_

- Lec15 (slides 10–14) framed sockets by comparing them to pipes: like pipes, sockets use `read()`/`write()` and pass arbitrary byte streams that can block; unlike pipes, sockets communicate across different computers, require an IP address to name a machine, require a port to name a process, involve timing synchronization (is the peer running?), and demand explicit data formatting conventions (integer byte size and endianness).
- ==Lec15 slides 17–29 (the 5-layer network stack, IPv4 address chunking, packet loss rates, and DNS UDP lookups) represent lecture-only background not covered in APUE Chapter 16.==
- Lec15 (slides 30–33) defined the 5-tuple identifying a network connection (Source IP, Source Port, Destination IP, Destination Port, Protocol), 16-bit port numbers (0–65535), well-known ports (SSH 22, DNS 53, HTTP 80, HTTPS 443), and ephemeral client ports.
- Lec16 (slides 11, 23–25) introduced the socket system call sequence and emphasized setting `sin_family = AF_INET`, converting ports via `htons()`, and assigning `sin_addr.s_addr` using `htonl(INADDR_ANY)` or `inet_pton()`.
- _Skipped Content:_ The professor skipped `SOCK_SEQPACKET`, `SOCK_RAW`, the file descriptor functions socket compatibility table (Fig 16.4), `shutdown()` vs `close()`, and IPv6 `struct sockaddr_in6` field mechanics.
- _Other-Chapter Pull-In:_ Chapter 15 (Pipes & IPC, contrasting unnamed pipes with network sockets); Chapter 3 (File I/O for `read`, `write`, `close`, `dup2`, `fcntl`); Chapter 10 (Signals, for `SIGPIPE` generated when writing to a closed socket and `SIGURG` for out-of-band data). _Textbook Connections:_ (pending next parts).

## Open Questions

- [ ] ==Demonstrate that calling shutdown(sockfd, SHUT_WR) sends a FIN packet causing peer read() to return 0 (EOF) while still allowing the local socket to read incoming data.==
- [ ] Write a C test program verifying that `lseek()` on a socket descriptor fails with `errno == ESPIPE`.
- [ ] Inspect the memory layout of `struct sockaddr_in` on Linux to verify that zeroing `sin_zero` aligns the total structure size to 16 bytes matching `struct sockaddr`.
- [ ] Test `inet_pton()` with invalid IPv4 strings (e.g., values > 255) to verify it returns 0 rather than -1.

## Flashcards

Why does reading from a `SOCK_STREAM` socket require a loop rather than assuming a single `read()` retrieves the entire message?::`SOCK_STREAM` provides a continuous byte stream with no message boundaries; the kernel may deliver data across arbitrary chunk sizes regardless of how many bytes were passed to the sender's `write()`. #cards/csci4061 ==How does shutdown() differ fundamentally from close() when operating on a socket descriptor?==::close() only tears down the socket endpoint once all duplicated file descriptors referencing it are closed, whereas shutdown() deactivates communication immediately regardless of reference count and permits unidirectional shutdown (such as SHUT_WR). #cards/csci4061 What is the structural difference between big-endian and little-endian byte ordering for multi-byte integers?::Big-endian stores the most significant byte at the lowest memory address, whereas little-endian stores the least significant byte at the lowest memory address. #cards/csci4061 Why must network applications convert port numbers and IP addresses using `htons()` and `htonl()` before sending them across a socket?::Internet protocols mandate big-endian network byte order; host architectures using little-endian (e.g., Intel x86) must reverse integer byte order so remote hosts interpret values consistently. #cards/csci4061 Why must pointers to `struct sockaddr_in` and `struct sockaddr_in6` be cast to `struct sockaddr *` when passed to socket system calls?::The socket API defines generic `struct sockaddr` as a polymorphic interface accepting domain-specific address structures of varying lengths and internal layouts. #cards/csci4061 How do `inet_ntop()` and `inet_pton()` improve upon legacy functions `inet_addr()` and `inet_ntoa()`?::`inet_ntop()` and `inet_pton()` provide protocol-independent address conversion supporting both IPv4 (AF_INET) and IPv6 (AF_INET6) with safe buffer size parameters. #cards/csci4061
# 16.3.3 to 16.3.4
````
### 16.3.3 Address Lookup
Network configuration information can be maintained in static system files (such as `/etc/hosts`, `/etc/services`, `/etc/protocols`, `/etc/networks`) or managed dynamically through network directory services such as the Domain Name System (DNS) or Network Information Service (NIS) (p. 597). The POSIX network database interfaces abstract these underlying storage backends behind standardized lookup APIs declared in `<netdb.h>` (p. 597).
*Historical Network Databases & Iterators (`<netdb.h>`):*
Each administrative database provides sequential scanning (`get*ent`), file rewind/open with a `stayopen` persistence flag (`set*ent`), and closing (`end*ent`) primitives (pp. 597–599; Table 6.6):
1. Host Database (`/etc/hosts`):
```c
struct hostent *gethostent(void);
void sethostent(int stayopen);
void endhostent(void);
````

All return a pointer to a statically allocated **struct hostent** on success, or NULL on error (p. 597). The structure contains: `char *h_name` (canonical host name), `char **h_aliases` (array of alternative host name aliases), `int h_addrtype` (address family, e.g., `AF_INET`), `int h_length` (address byte length), and `char **h_addr_list` (array of pointers to network addresses in network byte order) (pp. 597–598). Legacy lookup functions **gethostbyname** and **gethostbyaddr** originally belonged to this interface but are obsolete and removed from SUSv4 (p. 597). 2. Networks Database (`/etc/networks`):

```
struct netent *getnetbyaddr(uint32_t net, int type);
struct netent *getnetbyname(const char *name);
struct netent *getnetent(void);
void setnetent(int stayopen);
void endnetent(void);
```

Returns a pointer to **struct netent** containing: `char *n_name` (network name), `char **n_aliases` (alias pointers), `int n_addrtype` (address family), and `uint32_t n_net` (network number in network byte order) (p. 598). 3. Protocols Database (`/etc/protocols`):

```
struct protoent *getprotobyname(const char *name);
struct protoent *getprotobynumber(int proto);
struct protoent *getprotoent(void);
void setprotoent(int stayopen);
void endprotoent(void);
```

Returns a pointer to **struct protoent** containing: `char *p_name` (official protocol name), `char **p_aliases` (alias pointers), and `int p_proto` (assigned protocol number) (p. 598). 4. Services Database (`/etc/services`):

```
struct servent *getservbyname(const char *name, const char *proto);
struct servent *getservbyport(int port, const char *proto);
struct servent *getservent(void);
void setservent(int stayopen);
void endservent(void);
```

Returns a pointer to **struct servent** containing: `char *s_name` (service name), `char **s_aliases` (alias pointers), `int s_port` (port number in network byte order), and `char *s_proto` (protocol name) (pp. 598–599). _getaddrinfo and freeaddrinfo Functions:_ The POSIX.1 **getaddrinfo** function replaces `gethostbyname` and `getservbyname`, translating host names and service names into socket addresses in a protocol-independent manner (p. 599).

```
#include <sys/socket.h>
#include <netdb.h>

int getaddrinfo(const char *restrict host,
                const char *restrict service,
                const struct addrinfo *restrict hint,
                struct addrinfo **restrict res);
void freeaddrinfo(struct addrinfo *ai);
```

`getaddrinfo()` returns 0 on success, or a nonzero error code on failure (p. 599). Either `host` (node name or dotted-decimal string) or `service` (service name or decimal port string) must be supplied; if one is omitted, it must be passed as NULL (p. 599). ==The getaddrinfo function dynamically allocates and returns a linked list of addrinfo structures matching the requested host and service criteria, which must be completely deallocated by passing the head pointer to freeaddrinfo to prevent memory leaks.== _struct addrinfo Definition:_

```
struct addrinfo {
    int              ai_flags;     /* customize behavior */
    int              ai_family;    /* address family: AF_INET, AF_INET6, AF_UNSPEC */
    int              ai_socktype;  /* socket type: SOCK_STREAM, SOCK_DGRAM */
    int              ai_protocol;  /* protocol: IPPROTO_TCP, IPPROTO_UDP, or 0 */
    socklen_t        ai_addrlen;   /* length in bytes of socket address */
    struct sockaddr *ai_addr;      /* pointer to socket address structure */
    char            *ai_canonname; /* canonical name of host */
    struct addrinfo *ai_next;      /* pointer to next element in linked list */
    /* ... */
};
```

_Filtering via the hint Argument:_ Callers pass a template `hint` to filter address generation; only `ai_flags`, `ai_family`, `ai_socktype`, and `ai_protocol` may be populated in `hint`, while all other integer fields must be 0 and pointer fields NULL (p. 600). _ai_flags Bitmask Flags (Figure 16.7):_

- **AI_ADDRCONFIG**: Queries only for address types (IPv4 or IPv6) currently configured on the local system (p. 600).
- **AI_ALL**: Returns both IPv4 and IPv6 addresses when used with `AI_V4MAPPED` (p. 600).
- **AI_CANONNAME**: Instructs `getaddrinfo` to populate `ai_canonname` in the first returned structure with the canonical host name (p. 600).
- **AI_NUMERICHOST**: Prevents name resolution, treating `host` strictly as a numeric address string (p. 600).
- **AI_NUMERICSERV**: Prevents service lookup, treating `service` strictly as a decimal port number (p. 600).
- **AI_PASSIVE**: Indicates the socket address will be bound to accept incoming connections (`INADDR_ANY` / `IN6ADDR_ANY_INIT` if `host` is NULL) (p. 600).
- **AI_V4MAPPED**: If no IPv6 addresses match, returns IPv4 addresses mapped in IPv6 format (p. 600). _Error Translation via gai_strerror:_ Errors from `getaddrinfo()` cannot be decoded with `perror()` or `strerror()` because return codes do not correspond to `errno` values (p. 600).

```
#include <netdb.h>

const char *gai_strerror(int error);
```

Returns a pointer to a descriptive error message corresponding to the nonzero error integer returned by `getaddrinfo()` (p. 600). _getnameinfo Function:_ The inverse of `getaddrinfo`, **getnameinfo** translates a binary `sockaddr` into human-readable host and service name strings (p. 600).

```
#include <sys/socket.h>
#include <netdb.h>

int getnameinfo(const struct sockaddr *restrict addr, socklen_t alen,
                char *restrict host, socklen_t hostlen,
                char *restrict service, socklen_t servlen,
                int flags);
```

Returns 0 on success, or a nonzero error code on failure (pp. 600–601). Callers supply destination buffers and lengths; if `host` or `service` is not needed, pass NULL and length 0 (p. 601). _getnameinfo Flags (Figure 16.8):_

- **NI_DGRAM**: Indicates datagram service to disambiguate services having identical port numbers across TCP and UDP (p. 601).
- **NI_NAMEREQD**: Returns an error if the host name cannot be resolved from its address (p. 601).
- **NI_NOFQDN**: Truncates fully qualified domain names, returning only the local host node name (p. 601).
- **NI_NUMERICHOST**: Returns the numeric IP address string instead of resolving the host name (p. 601).
- **NI_NUMERICSCOPE**: Returns numeric scope ID for IPv6 addresses instead of its name (p. 601).
- **NI_NUMERICSERV**: Returns decimal port number string instead of looking up service name (p. 601). _Figure 16.9 Code (Print Host and Service Information):_

```
#include "apue.h"
#if defined(SOLARIS)
#include <netinet/in.h>
#endif
#include <netdb.h>
#include <arpa/inet.h>
#if defined(BSD)
#include <sys/socket.h>
#include <netinet/in.h>
#endif

void
print_family(struct addrinfo *aip)
{
    printf(" family ");
    switch (aip->ai_family) {
    case AF_INET:
        printf("inet");
        break;
    case AF_INET6:
        printf("inet6");
        break;
    case AF_UNIX:
        printf("unix");
        break;
    case AF_UNSPEC:
        printf("unspecified");
        break;
    default:
        printf("unknown");
    }
}

void
print_type(struct addrinfo *aip)
{
    printf(" type ");
    switch (aip->ai_socktype) {
    case SOCK_STREAM:
        printf("stream");
        break;
    case SOCK_DGRAM:
        printf("datagram");
        break;
    case SOCK_SEQPACKET:
        printf("seqpacket");
        break;
    case SOCK_RAW:
        printf("raw");
        break;
    default:
        printf("unknown (%d)", aip->ai_socktype);
    }
}

void
print_protocol(struct addrinfo *aip)
{
    printf(" protocol ");
    switch (aip->ai_protocol) {
    case 0:
        printf("default");
        break;
    case IPPROTO_TCP:
        printf("TCP");
        break;
    case IPPROTO_UDP:
        printf("UDP");
        break;
    case IPPROTO_RAW:
        printf("raw");
        break;
    default:
        printf("unknown (%d)", aip->ai_protocol);
    }
}

void
print_flags(struct addrinfo *aip)
{
    printf("flags");
    if (aip->ai_flags == 0) {
        printf(" 0");
    } else {
        if (aip->ai_flags & AI_PASSIVE)
            printf(" passive");
        if (aip->ai_flags & AI_CANONNAME)
            printf(" canon");
        if (aip->ai_flags & AI_NUMERICHOST)
            printf(" numhost");
        if (aip->ai_flags & AI_NUMERICSERV)
            printf(" numserv");
        if (aip->ai_flags & AI_V4MAPPED)
            printf(" v4mapped");
        if (aip->ai_flags & AI_ALL)
            printf(" all");
    }
}

int
main(int argc, char *argv[])
{
    struct addrinfo      *ailist, *aip;
    struct addrinfo      hint;
    struct sockaddr_in   *sinp;
    const char           *addr;
    int                  err;
    char                 abuf[INET_ADDRSTRLEN];

    if (argc != 3)
        err_quit("usage: %s nodename service", argv);
    hint.ai_flags = AI_CANONNAME;
    hint.ai_family = 0;
    hint.ai_socktype = 0;
    hint.ai_protocol = 0;
    hint.ai_addrlen = 0;
    hint.ai_canonname = NULL;
    hint.ai_addr = NULL;
    hint.ai_next = NULL;
    if ((err = getaddrinfo(argv, argv, &hint, &ailist)) != 0)
        err_quit("getaddrinfo error: %s", gai_strerror(err));
    for (aip = ailist; aip != NULL; aip = aip->ai_next) {
        print_flags(aip);
        print_family(aip);
        print_type(aip);
        print_protocol(aip);
        printf("\n\thost %s", aip->ai_canonname?aip->ai_canonname:"-");
        if (aip->ai_family == AF_INET) {
            sinp = (struct sockaddr_in *)aip->ai_addr;
            addr = inet_ntop(AF_INET, &sinp->sin_addr, abuf,
              INET_ADDRSTRLEN);
            printf(" address %s", addr?addr:"unknown");
            printf(" port %d", ntohs(sinp->sin_port));
        }
        printf("\n");
    }
    exit(0);
}
```

### 16.3.4 Associating Addresses with Sockets

While client sockets rarely require explicit local addresses (the operating system assigns an ephemeral port and outbound interface automatically upon connection), server processes must associate a well-known local address with their socket endpoint so clients can discover and rendezvous with them (p. 604; Lec16). _The bind System Call:_

```
#include <sys/socket.h>

int bind(int sockfd, const struct sockaddr *addr, socklen_t len);
```

Returns: 0 on success, -1 on error (p. 604). Associates local network address `addr` of length `len` with socket descriptor `sockfd` (p. 604). _Four System Restrictions on bind:_

1. Local Validity: The address must belong to a network interface configured on the host machine; arbitrary foreign IP addresses cannot be bound (p. 604).
2. Family Consistency: The address format must match the address family specified when `socket()` was created (p. 604).
3. Privileged Port Boundary: Port numbers strictly below 1,024 are reserved system ports and cannot be bound unless the process executes with superuser privilege (p. 605; Lec15/Lec16).
4. Address Uniqueness: In general, only one active socket endpoint can be bound to a specific IP address and port combination simultaneously (p. 605). _Wildcard Address Binding via INADDR_ANY:_ In the IPv4 Internet domain (`AF_INET`), setting `sin_addr.s_addr = htonl(INADDR_ANY)` instructs the kernel to bind the socket endpoint across all active network interfaces on the host (p. 604; Lec16). This wildcard binding ensures the server accepts packets addressed to any network interface card (NIC) or IP address associated with the host machine (p. 604; Lec16). _Inspecting Bound and Peer Addresses:_

```
#include <sys/socket.h>

int getsockname(int sockfd, struct sockaddr *restrict addr,
                socklen_t *restrict alenp);
int getpeername(int sockfd, struct sockaddr *restrict addr,
                socklen_t *restrict alenp);
```

Both return 0 on success, or -1 on error (p. 605).

- **getsockname**: Retrieves the local address currently bound to `sockfd` into buffer `addr`, setting `*alenp` to the actual byte size of the address returned (truncated if the provided buffer is too small); behavior is undefined if no address is bound (p. 605).
- **getpeername**: Retrieves the foreign address of the remote peer connected to `sockfd` (p. 605). NEW KEY CONCEPTS
- **struct hostent**: Structure holding host name aliases, address family type, address length, and an array of binary host network address pointers (p. 597).
- **gethostent**: Iterator returning sequential entries from the system host database (p. 597).
- **sethostent**: Function opening or rewinding the host database, optionally keeping it open across queries (p. 597).
- **endhostent**: Function closing the system host database file (p. 597).
- **gethostbyname**: Obsolete function looking up host database entries by host name string (p. 597).
- **gethostbyaddr**: Obsolete function looking up host database entries by binary network address (p. 597).
- **struct netent**: Structure storing network name strings, aliases, address types, and binary network numbers (p. 598).
- **getnetbyaddr**: Function retrieving network database entries by network number (p. 598).
- **getnetbyname**: Function retrieving network database entries by network name string (p. 598).
- **getnetent**: Iterator returning sequential records from the networks database (p. 598).
- **setnetent**: Function opening or rewinding the networks database (p. 598).
- **endnetent**: Function closing the networks database file (p. 598).
- **struct protoent**: Structure storing official protocol name strings, aliases, and protocol numbers (p. 598).
- **getprotobyname**: Function querying protocol database records by protocol name (p. 598).
- **getprotobynumber**: Function querying protocol database records by protocol integer number (p. 598).
- **getprotoent**: Iterator returning sequential records from the protocol database (p. 598).
- **setprotoent**: Function opening or rewinding the protocol database (p. 598).
- **endprotoent**: Function closing the protocol database file (p. 598).
- **struct servent**: Structure storing service names, aliases, port numbers, and protocol names (p. 598).
- **getservbyname**: Function querying service database records by service name and protocol string (p. 598).
- **getservbyport**: Function querying service database records by port number and protocol string (p. 598).
- **getservent**: Iterator returning sequential records from the services database (p. 598).
- **setservent**: Function opening or rewinding the services database (p. 598).
- **endservent**: Function closing the services database file (p. 598).
- **getaddrinfo**: Protocol-independent function translating host and service names into a linked list of socket addresses (p. 599).
- **freeaddrinfo**: Function deallocating a linked list of addrinfo structures returned by getaddrinfo (p. 599).
- **struct addrinfo**: Linked-list node structure holding socket configuration criteria, socket address pointers, and canonical names (pp. 599–600).
- **AI_ADDRCONFIG**: Flag restricting getaddrinfo queries to locally configured address families (p. 600).
- **AI_ALL**: Flag directing getaddrinfo to return both IPv4 and IPv6 addresses when used with AI_V4MAPPED (p. 600).
- **AI_CANONNAME**: Flag requesting getaddrinfo to populate the canonical host name in the first addrinfo node (p. 600).
- **AI_NUMERICHOST**: Flag instructing getaddrinfo to parse the host argument as a numeric address without name resolution (p. 600).
- **AI_NUMERICSERV**: Flag instructing getaddrinfo to parse the service argument as a numeric port without service lookup (p. 600).
- **AI_PASSIVE**: Flag indicating generated socket addresses will be bound to listen for incoming connections (p. 600).
- **AI_V4MAPPED**: Flag instructing getaddrinfo to return IPv4 addresses mapped as IPv6 addresses if no native IPv6 addresses exist (p. 600).
- **gai_strerror**: Function returning descriptive error message strings corresponding to getaddrinfo error return codes (p. 600).
- **getnameinfo**: Protocol-independent function converting socket address structures into host and service name strings (p. 600).
- **NI_DGRAM**: Flag instructing getnameinfo that the service is datagram-based (UDP) rather than stream-based (TCP) (p. 601).
- **NI_NAMEREQD**: Flag causing getnameinfo to return an error if a host name cannot be resolved (p. 601).
- **NI_NOFQDN**: Flag directing getnameinfo to omit the domain portion of a fully qualified domain name for local hosts (p. 601).
- **NI_NUMERICHOST**: Flag directing getnameinfo to return the numeric address string rather than looking up the host name (p. 601).
- **NI_NUMERICSCOPE**: Flag directing getnameinfo to return the numeric scope ID for IPv6 addresses (p. 601).
- **NI_NUMERICSERV**: Flag directing getnameinfo to return the decimal port number string rather than looking up the service name (p. 601).
- **bind**: System call associating a local protocol address and port number with a socket descriptor (p. 604; Lec16).
- **INADDR_ANY**: Wildcard IPv4 address constant binding a socket to all available network interfaces on the host (p. 604; Lec16).
- **getsockname**: System call querying the local address currently bound to a socket descriptor (p. 605).
- **getpeername**: System call querying the remote peer address connected to a socket descriptor (p. 605). WORKED EXAMPLE ADDITION A trace of Figure 16.9 executing `./a.out harry nfs` details how `getaddrinfo` parses configuration hints and formats multi-protocol query results:

1. _Setting Hints:_ In `main()`, the program zeros all fields of `hint` and assigns `hint.ai_flags = AI_CANONNAME` while leaving `ai_family = 0`, `ai_socktype = 0`, and `ai_protocol = 0` to request all supported address families and transport protocols that offer the `"nfs"` service (p. 601, 603).
2. _Executing getaddrinfo:_ The call `getaddrinfo("harry", "nfs", &hint, &ailist)` queries the host name database for node `"harry"` and the services database for service `"nfs"`. Because NFS is supported across multiple transport layers, `getaddrinfo` dynamically constructs a linked list containing two `struct addrinfo` records (pp. 603–604).
3. _First Linked Node (TCP Stream):_

- `aip->ai_flags`: Contains `AI_CANONNAME` (printed by `print_flags()` as `flags canon`).
- `aip->ai_family`: Contains `AF_INET` (printed by `print_family()` as `family inet`).
- `aip->ai_socktype`: Contains `SOCK_STREAM` (printed by `print_type()` as `type stream`).
- `aip->ai_protocol`: Contains `IPPROTO_TCP` (printed by `print_protocol()` as `protocol TCP`).
- `aip->ai_canonname`: Points to string `"harry"` (printed as `host harry`).
- `aip->ai_addr`: Points to a `struct sockaddr_in` where `sin_addr` stores IPv4 address `192.168.1.99` (converted via `inet_ntop()` to text) and `sin_port` stores port 2049 in network byte order (converted via `ntohs()` to host integer 2049).
- Printed Line 1: `flags canon family inet type stream protocol TCP`
- Printed Line 2: `\thost harry address 192.168.1.99 port 2049`

4. _Second Linked Node (UDP Datagram):_

- `aip->ai_next`: Points to the second record; `ai_canonname` is NULL (only the first node populates the canonical name).
- `aip->ai_socktype`: Contains `SOCK_DGRAM` (printed as `type datagram`).
- `aip->ai_protocol`: Contains `IPPROTO_UDP` (printed as `protocol UDP`).
- `aip->ai_addr`: Points to a `struct sockaddr_in` with identical IP `192.168.1.99` and port 2049.
- Printed Line 3: `flags canon family inet type datagram protocol UDP`
- Printed Line 4: `\thost harry address 192.168.1.99 port 2049`

5. _Termination:_ The loop terminates when `aip->ai_next == NULL`. (Note: APUE Figure 16.9 omits `freeaddrinfo(ailist)` before `exit(0)`, which is safe on process exit but constitutes a memory leak in long-running applications) (p. 600, 604). CONNECTIONS ADDITION

- _Lecture Emphasis vs. Book Coverage:_ Lec16 (slides 4–8, 12–17, 21–22) emphasized manual `struct sockaddr_in` setup for socket binding and transmission, focusing on setting `sin_family = AF_INET`, converting ports via `htons()`, and binding to `htonl(INADDR_ANY)` in server code (`question_server_udp.c`) versus specifying target IPs via `inet_pton()` in client code (`question_client_udp.c`). The lecture skipped the database iterator functions (`gethostent`, `getnetent`, `getprotoent`, `getservent`), `getaddrinfo` flags (`AI_V4MAPPED`, `AI_ADDRCONFIG`), `getnameinfo`, `getsockname`, and `getpeername`. Note that DNS architecture (hierarchical resolution, root/TLD servers, UDP lookups on port 53) and port management concepts are lecture-only material with no corresponding section in APUE Chapter 16.
- _Concrete Implementation Context:_ Lec16 slides 12–17 and Project 3 / socket labs make `bind()` concrete by contrasting server and client descriptor roles: UDP/TCP servers must explicitly invoke `bind()` with a well-known port so that incoming packets or connection requests find the process, whereas client processes omit `bind()`, allowing the kernel to assign an ephemeral port automatically upon calling `sendto()` or `connect()`. NEW FLASHCARDS Why can error return codes from `getaddrinfo()` not be decoded using `perror()` or `strerror()`?::`getaddrinfo()` does not set global `errno` on failure; it returns custom integer error codes that must be decoded by passing them to `gai_strerror()`. #cards/csci4061 What is the functional purpose of specifying the `AI_PASSIVE` flag in `struct addrinfo`'s `ai_flags`?::It instructs `getaddrinfo()` that the returned socket address is intended for a server to bind and listen; if the host argument is NULL, the IP address is automatically set to the wildcard address (`INADDR_ANY` or `IN6ADDR_ANY_INIT`). #cards/csci4061 Why must a linked list of `addrinfo` structures returned by `getaddrinfo()` be freed using `freeaddrinfo()`?::`getaddrinfo()` dynamically allocates memory for the linked list structures, address buffers, and canonical name strings on the heap; calling `freeaddrinfo()` traverses and frees all associated records. #cards/csci4061 What occurs when a server binds a socket using `INADDR_ANY` as its IPv4 address?::The kernel binds the socket to all active network interfaces on the host machine, enabling the server to receive packets arriving on any configured network interface card or IP address. #cards/csci4061 What restrictions are imposed on the port number when calling `bind()` on a socket?::Port numbers below 1,024 are reserved privileged ports requiring superuser execution permissions, and the port cannot already be bound to another active socket on the same interface unless address reuse options are enabled. #cards/csci4061
# 16.4
````
### 16.4 Connection Establishment
For connection-oriented network services (`SOCK_STREAM` or `SOCK_SEQPACKET`), an end-to-end communication channel must be established between the client requesting service and the server providing service before data exchange can begin (p. 605).
*The connect System Call (`<sys/socket.h>`):*
```c
int connect(int sockfd, const struct sockaddr *addr, socklen_t len);
````

Returns 0 on success, or -1 on error (p. 605). The `addr` argument specifies the foreign server address; if `sockfd` is not explicitly bound to a local address, `connect()` automatically binds an ephemeral port and local interface on behalf of the caller (p. 606). _Transient Connection Failures:_ Connection attempts can fail due to temporary network conditions: the destination host may be rebooting, the target server process may not yet have bound its address, or the server's pending connection queue may be full (p. 606). Robust clients must handle transient error returns using retry logic (p. 606). _Exponential Backoff and the Portability Trap (Figures 16.10 & 16.11):_ An **exponential backoff** algorithm delays retries by progressively doubling sleep intervals after failed attempts (p. 606). Figure 16.10 implements exponential backoff on a single socket descriptor:

```
#include "apue.h"
#include <sys/socket.h>

#define MAXSLEEP 128

int
connect_retry(int sockfd, const struct sockaddr *addr, socklen_t alen)
{
    int numsec;

    /*
     * Try to connect with exponential backoff.
     */
    for (numsec = 1; numsec <= MAXSLEEP; numsec <<= 1) {
        if (connect(sockfd, addr, alen) == 0) {
            /*
             * Connection accepted.
             */
            return(0);
        }

        /*
         * Delay before trying again.
         */
        if (numsec <= MAXSLEEP/2)
            sleep(numsec);
    }
    return(-1);
}
```

_The Portability Bug:_ Figure 16.10 works on Linux and Solaris, but fails on FreeBSD and Mac OS X because BSD-derived TCP protocol engines permanently latch the socket state as failed after an initial unsuccessful connection attempt (p. 607). Under SUSv4, socket state becomes undefined following a failed `connect()`. Consequently, portable code must close the failed descriptor and allocate a brand new socket via `socket()` on each retry iteration (Figure 16.11, pp. 607–608):

```
#include "apue.h"
#include <sys/socket.h>

#define MAXSLEEP 128

int
connect_retry(int domain, int type, int protocol,
              const struct sockaddr *addr, socklen_t alen)
{
    int numsec, fd;

    /*
     * Try to connect with exponential backoff.
     */
    for (numsec = 1; numsec <= MAXSLEEP; numsec <<= 1) {
        if ((fd = socket(domain, type, protocol)) < 0)
            return(-1);
        if (connect(fd, addr, alen) == 0) {
            /*
             * Connection accepted.
             */
            return(fd);
        }
        close(fd);

        /*
         * Delay before trying again.
         */
        if (numsec <= MAXSLEEP/2)
            sleep(numsec);
    }
    return(-1);
}
```

_Nonblocking Connect and Datagram Optimization:_

- In nonblocking mode (`O_NONBLOCK`), `connect()` returns -1 immediately with `errno` set to `EINPROGRESS`; the process uses `select()` or `poll()` to wait for the descriptor to become writable, indicating connection completion (p. 608).
- Connectionless Optimization: Calling `connect()` on a `SOCK_DGRAM` socket does not establish a network handshake; instead, it records the peer address in the kernel so subsequent `send()` and `recv()` calls omit destination addresses and filter out incoming datagrams from all other senders (p. 608). _The listen System Call (`<sys/socket.h>`):_

```
int listen(int sockfd, int backlog);
```

Returns 0 on success, or -1 on error (p. 608). Converts an unconnected socket descriptor into a passive listening endpoint willing to receive incoming connection requests (p. 608).

- The `backlog` parameter provides a hint to the operating system regarding the maximum count of pending, unaccepted connection requests to enqueue in the kernel queue (p. 608).
- System limits: The maximum value is bounded by **SOMAXCONN** in `<sys/socket.h>` (Solaris ignores `SOMAXCONN`, enforcing a protocol-defined default of 128 for TCP) (p. 608).
- Queue saturation: Once the pending queue is full, the operating system rejects additional incoming client connect requests until the application drains the queue (p. 608). _The accept System Call (`<sys/socket.h>`):_

```
int accept(int sockfd, struct sockaddr *restrict addr, socklen_t *restrict len);
```

Returns a new connected socket descriptor on success, or -1 on error (p. 608). ==The accept function dequeues the next completed connection request and returns a brand-new socket descriptor connected directly to the client, while the original listening descriptor remains open and unmodified to receive subsequent connection requests.==

- Address extraction: If `addr` and `len` are non-null, the kernel copies the client's network address into buffer `addr` and updates `*len` with its actual byte size; callers unconcerned with client identity pass both arguments as NULL (p. 608).
- Blocking behavior: If no connection requests are pending in the queue, `accept()` suspends the calling thread until a client connects; if `sockfd` is nonblocking, `accept()` returns -1 with `errno` set to `EAGAIN` or `EWOULDBLOCK` (pp. 608–609).
- Multiplexing integration: In `select()` or `poll()`, a listening socket appears readable whenever an incoming connect request is pending, allowing servers to avoid blocking inside `accept()` (p. 609). _Figure 16.12 Code (Server Initialization Helper):_

```
#include "apue.h"
#include <errno.h>
#include <sys/socket.h>

int
initserver(int type, const struct sockaddr *addr, socklen_t alen, int qlen)
{
    int fd;
    int err = 0;

    if ((fd = socket(addr->sa_family, type, 0)) < 0)
        return(-1);
    if (bind(fd, addr, alen) < 0)
        goto errout;
    if (type == SOCK_STREAM || type == SOCK_SEQPACKET) {
        if (listen(fd, qlen) < 0)
            goto errout;
    }
    return(fd);

errout:
    err = errno;
    close(fd);
    errno = err;
    return(-1);
}
```

NEW KEY CONCEPTS

- **connect**: System call initiating an active transport handshake on a client socket to link with a specified server address (p. 605).
- **exponential backoff**: Retry strategy doubling the delay interval between successive failed connection attempts to avoid congesting recovering servers (p. 606).
- **listen**: System call transitioning a bound socket into passive listening mode to accept incoming client connections (p. 608).
- **backlog**: Parameter to listen() specifying the kernel's queue limit for pending, unaccepted connection requests (p. 608).
- **SOMAXCONN**: System header constant in `<sys/socket.h>` defining the maximum permissible backlog queue size (p. 608).
- **accept**: System call extracting a pending connection request from a listening queue and instantiating a new connected socket descriptor (p. 608).
- **initserver**: Reusable server abstraction helper function encapsulating socket creation, address binding, and listen activation (p. 609). WORKED EXAMPLE ADDITION A trace of Figures 16.10 and 16.12 illustrates client retry progression and passive server socket setup:

1. _Client Exponential Backoff Trace (Figure 16.10):_ A client attempts to connect to a heavily loaded server with `MAXSLEEP = 128`. Loop variable `numsec` tracks delay intervals via bitwise left-shift (`numsec <<= 1`):

- Attempt 1: `numsec = 1`. `connect()` fails. Since `numsec <= 64` (`MAXSLEEP/2`), the process calls `sleep(1)`.
- Attempt 2: `numsec = 2`. `connect()` fails. The process calls `sleep(2)`.
- Attempt 3: `numsec = 4`. `connect()` fails. The process calls `sleep(4)`.
- Attempt 4: `numsec = 8`. `connect()` fails. The process calls `sleep(8)`.
- Attempt 5: `numsec = 16`. `connect()` fails. The process calls `sleep(16)`.
- Attempt 6: `numsec = 32`. `connect()` fails. The process calls `sleep(32)`.
- Attempt 7: `numsec = 64`. `connect()` fails. The process calls `sleep(64)`. Cumulative sleep time reaches $1+2+4+8+16+32+64 = 127$ seconds (~2 minutes).
- Attempt 8: `numsec = 128`. `connect()` fails. Because `numsec > 64`, no further sleep occurs; the loop terminates and returns -1.

2. _Server Endpoint Initialization (Figure 16.12):_ A server invokes `initserver(SOCK_STREAM, addr, alen, 10)` to establish a passive TCP listener:

- `socket()` allocates socket descriptor `fd` using address family `addr->sa_family` (e.g., `AF_INET`).
- `bind()` binds the well-known network address and port in `addr` of size `alen` to `fd`. If binding fails (e.g., port in use), execution branches to `errout`, saving `errno`, closing `fd`, and returning -1.
- `listen()` evaluates `type == SOCK_STREAM`, invoking `listen(fd, 10)` to mark `fd` as passive with a backlog of 10 incoming requests.
- Returns active listener `fd`, ready to be monitored via `select()` or passed to `accept()`. CONNECTIONS ADDITION
- _Lecture Emphasis vs. Book Coverage:_ Lec17 (slides 3–9) and class examples (`question_client_tcp.c`, `question_server_tcp.c`) emphasized the complete TCP socket lifecycle: client calls `socket()` $\rightarrow$ `connect()` $\rightarrow$ `write()`/`read()` $\rightarrow$ `close()`, while server calls `socket()` $\rightarrow$ `bind()` $\rightarrow$ `listen()` $\rightarrow$ enters an `accept()` loop spawning per-client communication $\rightarrow$ `close(client_fd)`. The lecture heavily emphasized the descriptor distinction: the listening socket descriptor exists solely to accept connections, while `accept()` instantiates a distinct active communication descriptor per client. The professor skipped exponential backoff retry algorithms (Figures 16.10–16.11), `SOMAXCONN` implementation differences, and datagram-based `connect()` optimizations. Relevant cross-chapter links include Chapter 14 (Advanced I/O) for multiplexing `select()` on listening descriptors, and Chapter 10 (Signals) for slow system call interruption (`EINTR`) during blocking `accept()`.
- _Concrete Lab & Project 3 Implementation:_ Lec17 and Project 3 make connection establishment concrete by implementing concurrent TCP servers: after `accept()` yields a new client file descriptor, multi-process servers call `fork()` where the child closes the listening socket and services the client, while the parent closes the client socket and immediately resumes waiting in `accept()`, demonstrating why both descriptors must be managed independently to prevent descriptor leaks. NEW FLASHCARDS Why is closing and reopening a new socket descriptor required when retrying a failed `connect()` call portably?::On BSD-based platforms (FreeBSD, Mac OS X), the state of a TCP socket descriptor becomes permanently undefined after a failed connection attempt, causing successive `connect()` calls on the same descriptor to fail unconditionally. #cards/csci4061 What is the function of the `backlog` argument in the `listen()` system call?::It provides a hint to the operating system kernel specifying the maximum number of outstanding, unaccepted client connection requests that can be enqueued before new connection requests are rejected. #cards/csci4061 How do the file descriptors involved in a server's call to `accept()` differ in role and state?::The file descriptor passed into `accept()` is a passive listening socket that remains open to receive future connection requests, whereas the descriptor returned by `accept()` is a new active socket dedicated to communicating with the connected client. #cards/csci4061 What optimization is achieved by calling `connect()` on a connectionless datagram socket (`SOCK_DGRAM`)?::It records the peer address in the kernel, enabling the application to use standard `read()`, `write()`, `send()`, and `recv()` without specifying the destination address on every transfer, while ignoring datagrams from all other senders. #cards/csci4061
# 16.5

# 16.6 to 16.9

## Worked Example
<!-- Source-grounded examples, numbers, or code traces, and why each matters. -->
## Connections
<!-- Links to the real lecture week, Textbook Map entry, and concept notes. -->
## Open Questions
<!-- Unverified or missing material as - [ ] tasks. -->
## Flashcards
<!-- Three to eight cards on #cards/<course-slug> testing mechanism, condition, and contrast. -->
