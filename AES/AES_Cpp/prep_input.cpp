
/**
 * Input data preparing for AES algorithm with configurable number of cells and blocks
 */

#include <iostream>
#include <string>
#include <fstream>
#include <streambuf>

#define C_NUM_LINES  16
#define C_NUM_CELLS  16
#define C_NUM_COLS   512   // change according to the simulation
using namespace std;

int main()
{

    ifstream file("text.txt");
    string message((std::istreambuf_iterator<char>(file)),
                    std::istreambuf_iterator<char>());

    int char_pos = 0;
    int data_matrix[C_NUM_LINES][C_NUM_COLS];

    cout << endl << message.length() << endl;
    for (int column = 0; column < C_NUM_COLS; column++) {
        for (int line = 0; line < C_NUM_LINES; line++) {
            data_matrix[line][column] = int(message[char_pos]);
            char_pos++;
        }
    }


    ofstream myfile;
    myfile.open("data/input.txt");

    for ( int bl = 0; bl < C_NUM_COLS/C_NUM_CELLS; bl ++) {
        for (int line = 0; line < C_NUM_LINES; line++) {
            for (int column = 0; column < C_NUM_CELLS; column++) {
                myfile << data_matrix[line][column + C_NUM_CELLS * bl] << "\t";
            }
            myfile << "\n";
        }
//        myfile << "\n";
    }

    myfile.close();

    return 0;
}