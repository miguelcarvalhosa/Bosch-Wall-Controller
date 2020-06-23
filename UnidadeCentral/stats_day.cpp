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

	ofstream file ("stats_day.txt");
	int year = 2020, month = 5, day = 18;
	int temp;
	for (int hour = 0; hour < 24; hour++) {
		for (int min = 0; min < 60; min++) {
			// gera numeros entre 15 e 30
			temp = rand()%15+15;
			file << temp << '\t' << hour << '\t' << min << '\t' << 0 << '\t' << day << '\t' << month << '\t' << year << '\n';
			temp = rand()%15+15;
			file << temp << '\t' << hour << '\t' << min << '\t' << 30 << '\t' << day << '\t' << month << '\t' << year << '\n';
		}

	}
	file.close();

	printf("Ficheiro txt gerado com sucesso, tenha um resto de um bom dia! :)\n");
}
