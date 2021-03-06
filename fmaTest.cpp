#include <iostream>
#include <sys/time.h>
using namespace std;

#define ARRAY_LEN 1000000

float arr[ARRAY_LEN];

int main()
{
    for (int i = 0; i < ARRAY_LEN; i++)
        arr[i] = (float)i;

    timeval t1, t2;
    double elapsedTime;
    gettimeofday(&t1, NULL);

    for (int j = 0; j < 10000; j++)
    {
    float sum = 0.0f;
    for (int i = 0; i < ARRAY_LEN; i++)
        sum =  arr[i] *0.2f + sum;
    }

    gettimeofday(&t2, NULL);
    elapsedTime = (t2.tv_sec -t1.tv_sec) * 1000.0;
    elapsedTime += (t2.tv_usec - t1.tv_usec) / 1000.0;
    cout << "Result: " << sum << " Time per (mean): " << elapsedTime/10000 << endl;

    return 0;
}
