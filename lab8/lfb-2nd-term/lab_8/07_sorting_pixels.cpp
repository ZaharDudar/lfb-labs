#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>
#include <unistd.h>
#include <fcntl.h> 
#include <sys/types.h>
#include <sys/stat.h>

// Картинку, которую мы обрабатываем, будем хранить в глобальных переменных.

// Размеры. 
uint32_t width;
uint32_t height;

// Вспомогательная структура.
struct pixel {
    uint32_t r, g, b;
};

// Сама картинка.
std::vector<std::vector<pixel>> pict;


// Функция сортировки вектора пикселей - простая обертка над стандартной.
void sort(std::vector<pixel>& str)
{
    std::sort(str.begin(), str.end(), [](const pixel& a, const pixel& b) { return (a.r + a.g + a.b) > (b.r + b.g + b.b); });
}

int main()
{
    // Считываем файл, который сгенерировали при помощи 07_basic_ppm.cpp
    std::ifstream in("pic.ppm");
    std::string stmp;
    in >> stmp;
    in >> width >> height;
    in >> stmp;

    pict.resize(height);
    for (auto &s : pict)
        s.resize(width);

    for(uint32_t i = 0; i < height; i++)
        for(uint32_t j = 0; j < width; j++)
        {
            in >> pict[i][j].r >> pict[i][j].g >> pict[i][j].b;
        }


    // Обработка.
    uint N = 2;
    std::vector<pid_t> pids(N);
    // std::vector<std::string> pipesName(N);
    std::vector<std::string> pipes(N);
    for(int i=0;i<N;i++){
        pids[i] = fork();
        if(pids[i]){
            pipes[i] = std::to_string(i) + "pipe.txt";
            std::cout<<pipes[i]<<"\n";
            mkfifo(pipes[i].c_str(),0666);
        }
    }

    int ret;
    int fd;
    bool all_proc_ready;
    if(pids[0]){
        ret = mkfifo("readyList.txt", 0666);
        ret = mkfifo("parentPid.txt", 0666);
        all_proc_ready = true;

        if(pids[0]){
            fd = open("parentPid.txt", O_WRONLY);
            write(fd,&pids[0], sizeof(pids[0]));
            close(fd);
        }
        fd = open("readyList.txt", O_WRONLY);
        int zero=0;
        write(fd,&zero, sizeof(int));
        close(fd);
    }

    int size_to_one_process = height/N;
    for(auto pid : pids){
        all_proc_ready = true;
        if(pid){
            fd = open("readyList.txt", O_RDONLY);
            int readyState;
            ret = read(fd, &readyState, sizeof(int));
            if(readyState != N) all_proc_ready = false;
            close(fd);
            if(all_proc_ready){
                for(auto pipe : pipes){
                    fd = open(pipe.c_str(), O_RDONLY);
                    for(int data_y=0;data_y<size_to_one_process;data_y++){
                        for(int data_x=0;data_x<width;data_x++){
                            ret = read(fd, &pict[data_y][data_x], sizeof(pixel));
                        }
                    }
                    close(fd);
                    std::cout<<"start prtinting\n";
                    std::ofstream out("pic_sorted.ppm");
                    out << "P3" << std::endl;
                    out << width << " " << height << std::endl;
                    out << "255" << std::endl;

                    for(uint32_t i = 0; i < height; i++)
                        for(uint32_t j = 0; j < width; j++)
                        {
                            out << pict[i][j].r << " " << pict[i][j].g << " " << pict[i][j].b << " ";
                        } 

                    return 0;
                }

            }
        }
        else{
            int offset;
            fd = open("parentPid.txt",O_RDONLY);
            ret = read(fd, &offset, sizeof(int));
            close(fd);
            offset=getpid() - offset; 
            for(uint32_t i = size_to_one_process*offset; i < size_to_one_process*(offset + 1); i++)
                sort(pict[i]);
            for(int data_y = size_to_one_process*offset; data_y < size_to_one_process*(offset + 1); data_y++){
                for(int data_x=0;data_x<width;data_x++){
                    ret = read(fd, &pict[data_y][data_x], sizeof(pixel));
                }
            }
            fd = open("readyList.txt", O_RDWR);
            int countReady;
            ret = read(fd, &countReady, sizeof(countReady));
            countReady++;
            ret = write(fd, &countReady, sizeof(countReady));
            close(fd);
        }
    }
    // for(uint32_t i = 0; i < height; i++)
    //     sort(pict[i]);


    // Вывод результата в другую картинку. Она должна отразиться справа налево.
    // std::ofstream out("pic_sorted.ppm");
    // out << "P3" << std::endl;
    // out << width << " " << height << std::endl;
    // out << "255" << std::endl;

    // for(uint32_t i = 0; i < height; i++)
    //     for(uint32_t j = 0; j < width; j++)
    //     {
    //         out << pict[i][j].r << " " << pict[i][j].g << " " << pict[i][j].b << " ";
    //     } 

    return 0;
}

