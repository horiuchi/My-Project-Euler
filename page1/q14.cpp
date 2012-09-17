#include <inttypes.h>

#include <map>
#include <iostream>

uint64_t next_collatz(const uint64_t& n) {
	return (n % 2 == 0) ? n / 2 : 3 * n + 1;
}

typedef std::map<uint64_t, uint64_t> MapType;
uint64_t get_collatz_length(MapType& map, const uint64_t& n) {
	MapType::const_iterator it = map.find(n);
	if (it != map.end()) {
		return it->second;
	}

	uint64_t result = 1;
	if (n == 1) {
		map.insert(std::make_pair(n, result));
		return result;
	} else {
		result += get_collatz_length(map, next_collatz(n));
		map.insert(std::make_pair(n, result));
		return result;
	}
}

int main(int, char**) {
	MapType map;
	uint64_t max = 0, max_len = 0;
	for (uint64_t i = 1; i <= 1000000; ++i) {
		uint64_t length = get_collatz_length(map, i);
		if (max_len < length) {
			max = i;
			max_len = length;
		}
		//std::cout << i << "," << length << std::endl;
	}
	std::cout << max << ":" << max_len << std::endl;
}

