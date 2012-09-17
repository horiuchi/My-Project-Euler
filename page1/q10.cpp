#include <inttypes.h>
#include <cmath>

#include <vector>
#include <iostream>

void sieve(std::vector<bool>& vec, uint64_t i) {
	if (vec[i - 1]) return;
	for (int j = 2; i * j <= vec.size(); ++j) {
		vec[i * j - 1] = true;
	}
}

int main() {
	uint64_t number = 2000000ULL;

	std::vector<bool> vec(number, false);
	vec[0] = true;
	sieve(vec, 2);
	for (uint64_t i = 3; i < vec.size(); i += 2) {
		sieve(vec, i);
	}

	uint64_t answer = 0;
	for (size_t index = 0; index < vec.size(); ++index) {
		if (!vec[index]) {
			answer += index + 1;
		}
	}
	std::cout << answer << std::endl;
}

