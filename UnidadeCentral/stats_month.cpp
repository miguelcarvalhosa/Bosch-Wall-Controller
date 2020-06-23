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

	ofstream file ("stats_month.txt");
	int temp;
	for (int day = 1; day <= 30; day++) {
		// gera numeros entre 15 e 30
		temp = rand()%15+15;
		file << temp << '\t' << day << '\n';
	}
	file.close();

	printf("\nFicheiro txt gerado com sucesso, tenha um resto de um bom dia! :)\n");
}
