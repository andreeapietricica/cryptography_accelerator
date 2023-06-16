FLAGS = -Wall -Wextra -O2

build_all: clean pres aes

clean:
	 rm -rf bin/*

input:
	g++ prep_input.cpp -o bin/input.exe
pres:   #process result
	g++ $(FLAGS) output_transpose.cpp -o bin/transpose

sha:    #encrypt
	g++ $(FLAGS) SHA256.cpp main.cpp -o bin/sha

