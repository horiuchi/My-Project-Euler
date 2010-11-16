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
	//uint64_t number = 13195;
	uint64_t number = 600851475143ULL;

	std::vector<bool> vec(std::sqrt(number), false);
	vec[0] = true;
	sieve(vec, 2);
	for (uint64_t i = 3; i < vec.size(); i += 2) {
		sieve(vec, i);
	}

	uint64_t answer = 1;
	for (size_t index = 0; index < vec.size(); ++index) {
		if (!vec[index] && number % (index + 1) == 0) {
			answer = index + 1;
		}
	}
	std::cout << answer << std::endl;
}

