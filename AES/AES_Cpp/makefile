FLAGS = -Wall -Wextra -O2

build_all: clean pres aes

clean:
	 rm -rf bin/*

input:
	g++ prep_input.cpp -o bin/input.exe

pres:   #process result
	g++ $(FLAGS) output_transpose.cpp -o bin/transpose

aes:    #encrypt
	g++ $(FLAGS) AES.cpp main.cpp -o bin/aes

