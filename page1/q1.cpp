#include <iostream>

bool isMultiples(const int& i) {
	return (i % 3 == 0) || (i % 5 == 0);
}

int main() {
	int answer = 0;
	for (int i = 3; i < 1000; ++i) {
		if (isMultiples(i)) {
			answer += i;
		}
	}
	std::cout << answer << std::endl;
}

