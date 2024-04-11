#pragma once

#ifdef GG_PLATFORM_WINDOWS

extern GEngine::Application* GEngine::CreateApplication();

int main(int argc, char** argv) {

	GEngine::Log::Init();

	auto app = GEngine::CreateApplication();
	app->Run();
	delete app;
}

#endif