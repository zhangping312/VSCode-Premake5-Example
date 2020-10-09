#include "Application.h"

Application::Application(const std::string& title, unsigned int width, unsigned int height)
{
    std::cout << "Application constructor!" << std::endl;
}

Application::~Application()
{
    std::cout << "Application destructor!" << std::endl;
}

void Application::Run()
{
    std::cout << "Application run!" << std::endl;
}