#include <iostream>
#include <thread>
#include <utility>
#include <chrono>
#include <algorithm>
#include <vector>

std::vector<std::vector<int>> array;
void partlySort(uint st, uint end){
    for(int i = st; i < end; i++){
        sort(array[i].begin(), array[i].end());      
    }
}

int main(int argc, char* argv[]){
    uint N = 12;
    // std::cout<<"Resize array\n";
    array.resize(N);
    for(auto &s : array)
        s.resize(N);

    // std::cout<<"Fill array\n";
    for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            array[i][j] = rand();
        }
    }

    // std::cout<<"Start threads\n";
    int N_threads = std::stoi(argv[1]);
    
    uint size_per_thread = N/N_threads;
    uint last_n = N - size_per_thread * N_threads;
    std::vector<std::thread> threads(N_threads);
    // std::cout<<"Init threads\n";
    for(int i = 0; i<N_threads-1; i++){
        threads[i] = std::thread(partlySort, size_per_thread*i, size_per_thread*(i+1));
    }
    threads[N_threads - 1] = std::thread(partlySort, size_per_thread*(N_threads-1), size_per_thread*(N_threads) + last_n);
    // std::cout<<"Start sorting\n";
    auto start = std::chrono::high_resolution_clock::now();
    for(int i = 0; i < N_threads; i++){
        threads[i].join();
    }
    std::cout<<std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::high_resolution_clock::now()-start).count()<<" \n";
    for(auto i : array){
        for(auto j : i){
            std::cout<<j<<" ";
        }
        std::cout<<"\n";
    }
    return 0;
}