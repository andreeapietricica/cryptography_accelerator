/**
 * Input data preparing for SHA256 algorithm with messages of multiple blocks of 512 bits
 */

#include <bitset>
#include <iostream>
#include <iomanip>
#include <string>
#include <fstream>
#include <streambuf>

#define C_NUM_LINES  256  // 512 bits - 16 elements of 32 bits
#define C_NUM_COLS  16
#define C_NUM_CELLS  16
//#define C_NUM_BLOCKS C_NUM_COLS/C_NUM_CELLS
#define C_NUM_BLOCKS C_NUM_LINES/C_NUM_CELLS
#define C_BLOCK_MESG_LENGTH C_NUM_BLOCKS * 64

using namespace std;


bool isBigEndian(){
    uint16_t word = 1; // 0x0001
    uint8_t *first_byte = (uint8_t*) &word; // points to the first byte of word
    return !(*first_byte); // true if the first byte is zero
}

int main()
{
    string message[C_NUM_COLS];
    fstream new_file;
    new_file.open("text/text_16bl_16cols.txt", ios::in);
    if (new_file.is_open()) {
        // Read data from the file object and put it into a string.
        int k = 0;
        while (getline(new_file, message[k])) {
            k++;
        }
    }

    new_file.close();

    int char_pos = 0;
    static unsigned int data_matrix[C_NUM_LINES][C_NUM_COLS];

    int message_length[C_NUM_COLS];
    int final_length[C_NUM_COLS];

    int start_message[C_NUM_BLOCKS][C_NUM_COLS];
    int stop_message[C_NUM_BLOCKS][C_NUM_COLS];

    for (int i = 0; i < C_NUM_COLS; i++) {
        message_length[i] = message[i].length();
        if ((message_length[i]%64) > 56) // multiple of 512 less 64 bits
        {
            final_length[i] = message_length[i] - (message_length[i]%64) + 64 + 64;  // Make multiple of 512 bits  and create a new chunk
        }
        else {
            final_length[i] = message_length[i] - (message_length[i] % 64) + 64;  // Make multiple of 512 bits (64 bytes)
        }
    }

    for ( int bl = 0; bl < C_NUM_BLOCKS; bl ++) {
        for (int i = 0; i < C_NUM_COLS; i++) {
            if (bl == 0) {
                start_message[bl][i] = 1;   // First block is always a message beginning
                stop_message[bl][i] = 0;
            } else if (bl == C_NUM_BLOCKS - 1) {
                start_message[bl][i] = 0;
                stop_message[bl][i] = 1;
            } else {
                start_message[bl][i] = 0;
                stop_message[bl][i] = 0;
            }
        }
    }
    unsigned char processed_message[C_NUM_COLS][C_BLOCK_MESG_LENGTH];
    for (int i = 0; i < C_NUM_COLS; i++){
        for (int j = 0; j < message_length[i]; j++)
        {
            processed_message[i][j] = message[i][j];
        }
    }

    for (int i = 0; i < C_NUM_COLS; i++){
        processed_message[i][message_length[i]] = (unsigned char)(128U); //8'b10000000  // Append 1
    }


    for (int i = 0; i < C_NUM_COLS; i++) {
        for (int j = message_length[i] + 1; j < final_length[i] - 8; j++)  // Append 0's until 512b-64b
        {
            processed_message[i][j] = (unsigned char) (0);
        }
    }


    for (int i = 0; i < C_NUM_COLS; i++) {
        long long int message_length_in_bits = message_length[i] * 8;
        processed_message[i][final_length[i] - 8] = (message_length_in_bits >> 56) & 0xFF;
        processed_message[i][final_length[i] - 7] = (message_length_in_bits >> 48) & 0xFF;
        processed_message[i][final_length[i] - 6] = (message_length_in_bits >> 40) & 0xFF;
        processed_message[i][final_length[i]- 5] = (message_length_in_bits >> 32) & 0xFF;
        processed_message[i][final_length[i] - 4] = (message_length_in_bits >> 24) & 0xFF;
        processed_message[i][final_length[i] - 3] = (message_length_in_bits >> 16) & 0xFF;
        processed_message[i][final_length[i] - 2] = (message_length_in_bits >> 8) & 0xFF;
        processed_message[i][final_length[i] - 1] = message_length_in_bits & 0xFF;
    }

    for (int column = 0; column < C_NUM_COLS; column++) {
        for (int line = 0; line < C_NUM_LINES; line++) {
            if (isBigEndian) {
                data_matrix[line][column] = ((unsigned int)processed_message[column][char_pos] << 24) |
                                            ((unsigned int)processed_message[column][char_pos + 1] << 16) |
                                            ((unsigned int)processed_message[column][char_pos + 2] << 8) |
                                            ((unsigned int)processed_message[column][char_pos + 3]);
            }
            else {
                data_matrix[line][column] = ((unsigned int)processed_message[column][char_pos + 3] << 24) |
                                            ((unsigned int)processed_message[column][char_pos + 2] << 16) |
                                            ((unsigned int)processed_message[column][char_pos + 1] << 8) |
                                            ((unsigned int)processed_message[column][char_pos]);
            }

            char_pos = char_pos + 4;

        }
        char_pos = 0;

    }

    for (int line = 0; line < C_NUM_LINES; line++)
    {
        cout << data_matrix[line][0] << " ";
    }

    int column_width = 15;
    ofstream myfile;
    myfile.open("data/axi_stream_input_16_2_2_sha_256_16bl_fixed_16msg_16_cells.txt");


    for ( int bl = 0; bl < C_NUM_BLOCKS; bl ++) {
        for (int i = 0; i < C_NUM_CELLS; i++)
        {
            myfile  <<  setw(column_width) << start_message[bl][i] << "\t";
        }
        myfile << "\n";
        for (int line = bl*16; line < (bl+1)*16; line++) {
            for (int column = 0; column < C_NUM_CELLS; column++) {
                myfile <<  setw(column_width) << data_matrix[line][column] << "\t";
            }
            myfile << "\n";
        }

        for (int i = 0; i < C_NUM_CELLS; i++)
        {
            myfile  <<  setw(column_width) << stop_message[bl][i] << "\t";
        }
        myfile << "\n";

//        myfile << "\n";
    }
    myfile.close();

    return 0;
}