workspace "GEngine"
	architecture "x64"

	configurations {
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "GEngine"
	location "GEngine"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "ggpch.h"
	pchsource "GEngine/src/ggpch.cpp"

	files {
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs {
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "c++17"
		staticruntime "On"
		systemversion "latest"

		defines {
			"GG_PLATFORM_WINDOWS",
			"GG_BUILD_DLL"
		}

		postbuildcommands {
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/sandbox")
		}

	filter "configurations:Debug"
		defines "GG_DEBUG"
		symbols "On"

	filter "configurations:Realeas"
		defines "GG_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "GG_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs {
		"GEngine/vendor/spdlog/include",
		"GEngine/src"
	}

	links {
		"GEngine"
	}

	filter "system:windows"
		cppdialect "c++17"
		staticruntime "On"
		systemversion "latest"

		defines {
			"GG_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "GG_DEBUG"
		symbols "On"

	filter "configurations:Realeas"
		defines "GG_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "GG_DIST"
		optimize "On"
