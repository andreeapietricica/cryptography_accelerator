

/**
 * SHA256 encryption
 */

#include <bitset>
#include <chrono>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <cstring>
#include "SHA256.h"

//#define C_NUM_LINES  8  // 512 bits - 16 elements of 32 bits
#define C_NUM_COLS  1 //16   // Change this
#define C_NUM_CELLS  16
//#define C_NUM_BLOCKS C_NUM_COLS/C_NUM_CELLS

#define TIME_MEAS_COUNTER  10000

using namespace std;


uint64_t millis() {
    auto duration =  std::chrono::system_clock::now().time_since_epoch();
    return std::chrono::duration_cast<std::chrono::milliseconds>(duration).count();
}

int main()
{
    string message[C_NUM_COLS];
    fstream new_file;
    new_file.open("text_1024cols.txt", ios::in);
//    new_file.open("text_128bl_16cols.txt", ios::in);
    if (new_file.is_open()) {
        // Read data from the file object and put it into a string.
        int k = 0;
        while (getline(new_file, message[k])) {
            k++;
        }
    }
    new_file.close();

    string output[C_NUM_COLS];

    for ( int k = 0; k < C_NUM_COLS; k ++) {
        output[k] = sha256(message[k]);
    }

    unsigned long hash[C_NUM_COLS][8];

    char hash_temp[C_NUM_COLS][9];

    for ( int k = 0; k < C_NUM_COLS; k ++) {
        hash_temp[k][8] = '\0';
        for (int i = 0; i < 64; i += 8) {
            strncpy(hash_temp[k], &output[k][i], 8);
            hash[k][i / 8] = strtoul(hash_temp[k], NULL, 16);
        }
    }

    for (int i = 0; i < 8; i ++)
    {
        for (int j = 0; j < 8; j ++)
        cout << hash[i][j] << endl;
    }

    int column_width = 15;
    ofstream myfile;
    myfile.open("golden.txt");

//    for ( int bl = 0; bl < C_NUM_BLOCKS; bl ++) {
        for (int line = 0; line < 8; line++) {
            for (int column = 0; column < C_NUM_COLS; column++) {
//                if (column%C_NUM_CELLS == 0)
//                    myfile << "\n";
                myfile << hash[column][line] << "\t";
            }
            myfile << "\n";
        }
        myfile << "\n";

//        myfile << "\n";
//    }
    myfile.close();
    return 0;
}