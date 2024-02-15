#ifndef COW_H
#define COW_H

#include "ASCIIPicture.hpp"

class Cow : public ASCIIPicture {

public:

    Cow(string fname);
    ~Cow();

    void print(unsigned int left, char fill, unsigned int width);

};

#endif
