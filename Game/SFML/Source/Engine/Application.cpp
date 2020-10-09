#include "Application.h"

Application::Application(const std::string& title, unsigned int width, unsigned int height)
{
    m_WindowHandle = new sf::RenderWindow(sf::VideoMode(width, height), title.c_str());
    if (!m_WindowHandle) throw std::runtime_error("Failed to create SFML window!");
}

Application::~Application()
{
    if (m_WindowHandle) delete m_WindowHandle;
    m_WindowHandle = nullptr;
}

void Application::Run()
{
    sf::CircleShape shape(100.f);
    shape.setFillColor(sf::Color::Green);

    while (m_WindowHandle->isOpen())
    {
        sf::Event event;
        while (m_WindowHandle->pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                m_WindowHandle->close();
        }

        m_WindowHandle->clear();
        m_WindowHandle->draw(shape);
        m_WindowHandle->display();
    }
}