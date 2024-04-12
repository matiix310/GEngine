#include "Application.h"

#include "GEngine/Events/ApplicationEvent.h"
#include "GEngine/Log.h"

namespace GEngine {
	Application::Application() {

	}
	Application::~Application()
	{
	}
	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			GG_TRACE(e);
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			GG_TRACE(e);
		}

		while (true);
	}
}