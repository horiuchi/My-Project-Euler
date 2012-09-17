#include <inttypes.h>
#include <iostream>

int main() {
	uint64_t sum = 2;
	long x = 1, y = 2;
	while (true) {
		long term = x + y;
		if (term > 4000000) break;
		if (term % 2 == 0) {
			sum += term;
			//std::cout << term << std::endl;
		}
		x = y;
		y = term;
	}
	std::cout << sum << std::endl;
}

