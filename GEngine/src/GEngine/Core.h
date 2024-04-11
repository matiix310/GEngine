#pragma once

#ifdef GG_PLATFORM_WINDOWS

	#ifdef GG_BUILD_DLL
		#define GENGINE_API __declspec(dllexport)
	
	#else
		#define GENGINE_API __declspec(dllimport)
	
	#endif

#else
	#error GEngine only supports Windows!

#endif