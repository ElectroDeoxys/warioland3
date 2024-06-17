#define PROGRAM_NAME "scan_includes"
#define USAGE_OPTS "[-h|--help] [-s|--strict] filename.asm"

#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <getopt.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdnoreturn.h>
#include <string.h>

const char* include_prefix = "src/";

#define error_exit(...) exit((fprintf(stderr, PROGRAM_NAME ": " __VA_ARGS__), 1))

noreturn void usage_exit(int status) {
	fprintf(stderr, "Usage: " PROGRAM_NAME " " USAGE_OPTS "\n");
	exit(status);
}

int getopt_long_index;
#define getopt_long(argc, argv, optstring, longopts) getopt_long(argc, argv, optstring, longopts, &getopt_long_index)

void *xmalloc(size_t size) {
	errno = 0;
	void *m = malloc(size);
	if (!m) {
		error_exit("Could not allocate %zu bytes: %s\n", size, strerror(errno));
	}
	return m;
}

void xfread(uint8_t *data, size_t size, const char *filename, FILE *f) {
	errno = 0;
	if (fread(data, 1, size, f) != size) {
		fclose(f);
		error_exit("Could not read from file \"%s\": %s\n", filename, strerror(errno));
	}
}

long xfsize(const char *filename, FILE *f) {
	long size = -1;
	errno = 0;
	if (!fseek(f, 0, SEEK_END)) {
		size = ftell(f);
		if (size != -1) {
			rewind(f);
		}
	}
	if (size == -1) {
		error_exit("Could not measure file \"%s\": %s\n", filename, strerror(errno));
	}
	return size;
}

void parse_args(int argc, char *argv[], bool *strict) {
	struct option long_options[] = {
		{"strict", no_argument, 0, 's'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "sh", long_options)) != -1;) {
		switch (opt) {
		case 's':
			*strict = true;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

void scan_file(const char *filename, bool strict) {
	errno = 0;
	FILE *f = fopen(filename, "rb");
	if (!f) {
		if (strict) {
			error_exit("Could not open file \"%s\": %s\n", filename, strerror(errno));
		} else {
			return;
		}
	}

	long size = xfsize(filename, f);
	char *contents = xmalloc(size + 1);
	xfread((uint8_t *)contents, size, filename, f);
	fclose(f);
	contents[size] = '\0';

	for (char *ptr = contents; ptr && ptr < contents + size; ptr++) {
		ptr = strpbrk(ptr, ";\"Ii");
		if (!ptr) {
			break;
		}
		switch (*ptr) {
		case ';':
			// Skip comments until the end of the line
			ptr += strcspn(ptr + 1, "\r\n");
			if (*ptr) {
				ptr++;
			}
			break;

		case '"':
			// Skip string literal until the closing quote
			ptr += strcspn(ptr + 1, "\"");
			if (*ptr) {
				ptr++;
			}
			break;

		case 'I':
		case 'i':
			/* empty statement between the label and the variable declaration */;
			// Check that an INCLUDE/INCBIN starts as its own token
			char before = ptr > contents ? *(ptr - 1) : '\n';
			if (!isspace((unsigned)before) && before != ':') {
				break;
			}
			bool is_incbin = !strncmp(ptr, "INCBIN", 6) || !strncmp(ptr, "incbin", 6);
			bool is_include = !strncmp(ptr, "INCLUDE", 7) || !strncmp(ptr, "include", 7);
			if (is_incbin || is_include) {
				// Check that an INCLUDE/INCBIN ends as its own token
				ptr += is_include ? 7 : 6;
				if (!isspace((unsigned)*ptr) && *ptr != '"') {
					break;
				}
				ptr += strspn(ptr, " \t");
				if (*ptr == '"') {
					// Print the file path and recursively scan INCLUDEs
					ptr++;
					char *include_path = ptr;
					size_t length = strcspn(ptr, "\"");
					ptr += length + 1;
					include_path[length] = '\0';
					char *complete_include_path = xmalloc(strlen(include_prefix) + length + 1);
					strcpy(complete_include_path, include_prefix);
					strcat(complete_include_path, include_path);
					printf("%s ", complete_include_path);
					if (is_include) {
						scan_file(complete_include_path, strict);
					}
				} else {
					fprintf(stderr, "%s: no file path after INC%s\n", filename, is_include ? "LUDE" : "BIN");
					// Continue to process a comment
					if (*ptr == ';') {
						ptr--;
					}
				}
			}
			break;
		}
	}

	free(contents);
}

int main(int argc, char *argv[]) {
	bool strict = false;
	parse_args(argc, argv, &strict);

	argc -= optind;
	argv += optind;
	if (argc < 1) {
		usage_exit(1);
	}

	scan_file(argv[0], strict);
	return 0;
}
