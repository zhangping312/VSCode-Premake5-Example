#include <iostream>
#include <exception>

class Application
{
public:
    Application(const std::string& title, unsigned int width, unsigned int height);
    Application(const Application& other) = delete;
    Application& operator=(const Application& other) = delete;
    virtual ~Application();

    void Run();
};