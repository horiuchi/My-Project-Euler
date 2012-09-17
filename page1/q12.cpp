#include <inttypes.h>

#include <iostream>

int count_divisors(const uint64_t& n) {
	int result = 0;
	for (uint64_t i = 1; i <= n; ++i) {
		if (n % i == 0) ++result;
	}
	return result;
}

int main(int, char**) {
	uint64_t tri_num = 0;
	for (uint64_t add = 1; true; ++add) {
		tri_num += add;
		int count = count_divisors(tri_num);
		if (count > 500) {
			std::cout << tri_num << std::endl;
			return 0;
		}
	}
}

