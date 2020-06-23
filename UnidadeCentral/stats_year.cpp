#include <iostream>
#include <fstream>
#include <ctime>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
using namespace std;
int main(void) {
	srand (time(NULL));

	ofstream file ("stats_year.txt");
	int temp;
	for (int month = 1; month <= 12; month++) {
		// gera numeros entre 15 e 30
		temp = rand()%15+15;
		file << temp << '\t' << month << '\n';
	}
	file.close();

	printf("Ficheiro txt gerado com sucesso, tenha um resto de um bom dia! :)\n");
}
