#include <stdio.h>

char* nacti_radek(FILE* s, char* buffer){

	char znak = '0';
	int delka = 0;
	char* radek;

	while ((znak != '\n') && (znak != EOF) ) {
	    znak = fgetc(s);
	    buffer[delka] = znak; // stuff in buffer.
	    delka++;
	}

	if(znak == EOF){
		return NULL;
	}

	radek = (char*) malloc(sizeof(char)*(delka));

	int i;

	for(i = 0;i<delka;i++){
		radek[i] = buffer[i];
	}
	radek[delka] = '\0';
	return radek;

}

int main(){
	char *buffer = (char*) malloc(sizeof(char)* 512);

	FILE *soubor;
	char spravna;
	char *radek;
	char odpoved;

	soubor = fopen("/home/jiriurban/workspace/Mayth/Debug/textak.txt", "r");

	if(soubor == NULL){
		return 4;
	}

	while(1){
		spravna = NULL;
		odpoved = NULL;


		if(soubor == NULL){
				printf("Nepodarilo se nacist soubor!");
		}

		spravna = fgetc(soubor); // nacteni spravne odpovedi

		printf("%c", fgetc(soubor)); // preskocit odradkovani
		int i;

		for(i=0;i<3;i++){
			radek = nacti_radek(soubor, buffer);
			if(radek == NULL){
				return 2;
			}
			printf("%s", radek);
			free(radek);
		}


		printf("Jaka je vase odpoved?\n");

		odpoved = getchar();
		getchar(); // preskoceni enteru

		odpoved = (char) toupper(((int)odpoved));

		if(odpoved == spravna){
			printf("Spravna odpoved!\n\n");
		}else{
			printf("Spatna odpoved!\n\n");
		}
	}


	free(buffer);
	free(radek);
	fclose(soubor);


	return 1;

}