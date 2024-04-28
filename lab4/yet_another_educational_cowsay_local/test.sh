for ((c =0;n<10;n++)); do
    { time make -j7 another_cowsay; } 2>> test7;
    make clean
done