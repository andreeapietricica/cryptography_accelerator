/**
 * AES ECB and CTR encryption
 */

#include <chrono>
#include <iostream>
#include <fstream>
#include <string>
#include "AES.h"

//#define C_NUM_LINES  16
////#define C_NUM_COLS  296   // change according to the simulation
//#define C_NUM_CELLS  16  // do not change
//#define C_DATA_SIZE_IN_BYTES   C_NUM_LINES* C_NUM_COLS

#define TIME_MEAS_COUNTER  10000

using namespace std;


uint64_t millis() {
    auto duration =  std::chrono::system_clock::now().time_since_epoch();
    return std::chrono::duration_cast<std::chrono::milliseconds>(duration).count();
}

int main()
{
    unsigned int plainLength = C_DATA_SIZE_IN_BYTES;
    unsigned char key[] = { 27, 124, 20, 9, 34, 174, 1, 166, 203, 244, 27, 136, 3, 186, 79, 74};   //AES128
//   unsigned char key[] = { 90, 104, 31, 62, 34, 144, 155, 109, 126, 38, 249, 19, 87, 124, 60, 32, 40, 71, 52, 82, 222, 161, 184, 138};  // AES192
//    unsigned char key[] = { 72, 179, 74, 18, 137, 142, 211, 194, 171, 49, 134, 138, 85, 44, 147, 87, 186, 76, 18, 212, 106, 140, 233, 212, 213, 194, 175, 243, 127, 226, 225, 12};  //AES256



    ifstream file("text.txt");
    string message((std::istreambuf_iterator<char>(file)),
                   std::istreambuf_iterator<char>());
    const int length = message.length();
    char* plain = new char[length + 1];
    strcpy(plain, message.c_str());

    AES aes(AESKeyLength::AES_128);
//    unsigned char *out = aes.EncryptECB((unsigned char*) plain, plainLength, key);
//    unsigned char *out = aes.EncryptCustomCTR((unsigned char*) plain, plainLength, key);
//    unsigned char *out = aes.EncryptECB((unsigned char*)&message, plainLength, key);


//*******************************************************************************
// Time measurements
//AES 128 ECB
//*    
    unsigned char *roundKeys = aes.CustomGetRoundKeys(key);
    auto start = millis();
    unsigned char *out;
    for (int i = 0; i < TIME_MEAS_COUNTER; i++)
    {
        out = aes.CustomOnlyEncryptECB((unsigned char*) plain, plainLength, roundKeys);
//        out = aes.CustomOnlyEncryptCTR((unsigned char*) plain, plainLength, roundKeys);
    }
    auto stop = millis();
    std::cout << "Length = " << plainLength * TIME_MEAS_COUNTER<< " Bytes " << std::endl;
    std::cout << "Time difference = " << (stop - start) << " ms " << std::endl;

//*/	

    ofstream myfile;
    myfile.open("data/golden_out.txt");
    for ( int i = 0; i < C_DATA_SIZE_IN_BYTES; i++)
    {
        if (i%C_NUM_CELLS == 0 && i !=0)
        {
            myfile << "\n";
        }
        myfile << int(out[i]) <<"\t";

    }
    myfile << "\n";

    myfile.close();

    delete[] out;

    return 0;
}