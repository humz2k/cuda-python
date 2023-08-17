#include <time.h>
#include <sys/time.h>

#define USECPSEC 1000000ULL

#define STRINGIFY(x) #x
#define TOSTRING(x) STRINGIFY(x)

typedef unsigned long long CPUTimer_t;

inline unsigned long long CPUTimer(unsigned long long start=0){
  timeval tv;
  gettimeofday(&tv, 0);
  return ((tv.tv_sec*USECPSEC)+tv.tv_usec)-start;
}