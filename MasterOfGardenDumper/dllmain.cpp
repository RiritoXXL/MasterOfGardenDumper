// dllmain.cpp : Defines the entry point for the DLL application.
#include <Windows.h>
#include "UnityResolve.hpp"
#include <filesystem>
using namespace std;
namespace fs = std::filesystem;
DWORD WINAPI Main() {
    UnityResolve::Init(GetModuleHandleW(L"GameAssembly.dll"), UnityResolve::Mode::Il2Cpp);
    std::string currentpath_masterofgarden = fs::current_path().string();
    string masterofgard = currentpath_masterofgarden + "\\MASTEROFGARDEN_DUMPED";
    while (!FindWindowA("UnityWndClass", nullptr)) {
        Sleep(310);
    }
    UnityResolve::DumpToFile(masterofgard);
    MessageBoxA(0, "Dumped!!!", "MasterOfGardenDumper", MB_OK | MB_ICONWARNING);
    exit(1443);
    return TRUE;
}
BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
                     )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
        CreateThread(0, 0, (LPTHREAD_START_ROUTINE)Main, 0, 0, 0);
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}

