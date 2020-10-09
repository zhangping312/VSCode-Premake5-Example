#include "Engine/Application.h"

#define APP_NAME "SFML"
#define APP_WIDTH 1280
#define APP_HEIGHT 720

int main(int args, char* argv[])
{
    try
    {
        Application app(APP_NAME, APP_WIDTH, APP_HEIGHT);
        app.Run();
    }
    catch(const std::exception& e)
    {
        std::cerr << e.what() << '\n';
    }

    return 0;
}