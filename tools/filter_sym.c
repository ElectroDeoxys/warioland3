#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main(int argc, char* argv[])
{
    if (argc != 2)
    {
        fprintf(stderr, "Invalid number of arguments, expected an int argument");
        return 1;
    }

    FILE* fileSource;
    FILE* fileDest;
    char* line = NULL;
    size_t len = 0;
    int read;

    fileSource = fopen("wl3.sym", "r");
    fileDest = fopen("wl3_filtered.sym", "w+");

    if (fileSource == NULL)
        return 1;

    while ((read = getline(&line, &len, fileSource)) != -1)
    {
        if (len >= 7)
        {
            if (line[3] == 'd'
             && (line[0] != '0' || line[1] != argv[1][0]))
                continue;
        }

        fprintf(fileDest, line);
    }

    fclose(fileSource);
    fclose(fileDest);

    return 0;
}
