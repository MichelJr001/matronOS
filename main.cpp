#include <iostream>

using namespace std;

int main() {

    // Cores do sistema

    char vermelho[8] = "\033[31m";
    char verde[8] = "\033[32m";
    char amarelo[8] = "\033[33m";
    char normal[7] = "\033[0m";

    cout << verde <<"======== MatronOS ========" << normal << endl;
    return 0;
}
