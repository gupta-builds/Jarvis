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

# 16.4

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
