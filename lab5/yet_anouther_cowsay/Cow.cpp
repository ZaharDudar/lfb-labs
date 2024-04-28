#include "Cow.hpp"

#include <iostream>
using std::cout;
using std::endl;

// Cow::Cow(string fname) : ASCIIPicture("./cows/" + fname + ".cow")
Cow::Cow(string fname) : ASCIIPicture("/usr/share/another_cowsay/cows/" + fname + ".cow")
{

}

Cow::~Cow() {}

void Cow::print(unsigned int left, char fill, unsigned int width)
{
    unsigned int cowWidth = getWidth();
    for (int i = 0; i < picture.size(); i++)
    {
        for (int j = 0; j < width - cowWidth - left; j++)
            cout << fill;
        for (int j = 0; j < picture[i].size(); j++)
            cout << picture[i][j];
        for (int j = width - cowWidth - left + picture[i].size(); j < width; j++)
            cout << fill;
        cout << endl;
    }
    for (int i = 0; i < width; i++)
        cout << fill;
    cout << endl;
}
