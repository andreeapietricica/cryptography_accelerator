
/**
 * Output data preparing for comparing the result on the accelerator to the golden result
 */

#include <iostream>
#include <fstream>

#define C_NUM_LINES  16
#define C_NUM_CELLS  128
#define C_NUM_COLS   1024 // change according to the simulation

using namespace std;

int main()
{
    std::fstream myfile("output256.txt", std::ios_base::in);
    ofstream myfile2;
    myfile2.open("data/output.txt");

    int data_matrix[C_NUM_LINES][C_NUM_CELLS];


    for ( int bl = 0; bl < C_NUM_COLS/C_NUM_CELLS; bl ++) {

        for (int i = 0; i < C_NUM_LINES; i++) {

            for (int j = 0; j < C_NUM_CELLS; j++) {
                myfile >> data_matrix[i][j];
            }
        }

        for (int column = 0; column < C_NUM_CELLS; column++) {

            for (int line = 0; line < C_NUM_LINES; line++) {
                myfile2 << data_matrix[line][column] << "\t";
            }
            myfile2 << "\n";
        }
    }

    myfile2.close();

    return 0;
}