#include <iostream>
#include <string>

#include <boost/lexical_cast.hpp>

bool is_palindromic(int i) {
	std::string s = boost::lexical_cast<std::string>(i);
	for (int index = 0; index < (s.size() + 1) / 2; ++index) {
		if (s[index] != s[s.size() - 1 - index]) return false;
	}
	return true;
}

int main(int, char**) {
	int max_i = 0, max_j = 0;
	for (int i = 999; i > 900; --i) {
		for (int j = 999; j > 900; --j) {
			if (is_palindromic(i * j) && i * j > max_i * max_j) {
				max_i = i; max_j = j;
			}
		}
	}
	std::cout << "Answer: " << max_i << "*" << max_j << "=" << max_i * max_j << std::endl;
}

