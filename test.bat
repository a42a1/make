

Key.h
#ifndef KEY_H
#define KEY_H

#include <windows.h> 
#include <cstdlib>
#include <string>
#include <iostream>
using namespace std;

#define A VK_A
#define a VK_A
#define B VK_B
#define b VK_B
#define C VK_C
#define c VK_C
#define D VK_D
#define d VK_D
#define E 69
#define e 69
#define F VK_F
#define f VK_F
#define G VK_G
#define g VK_G
#define H 72
#define h 72
#define I VK_I
#define i VK_I
#define J VK_J
#define j VK_J
#define K VK_K
#define k VK_K
#define L VK_L
#define l VK_L
#define M VK_M
#define m VK_M
#define N VK_N
#define n VK_N
#define O VK_O
#define o VK_O
#define P VK_P
#define p VK_P
#define Q VK_Q
#define q VK_Q
#define R VK_R
#define r VK_R
#define S VK_S
#define s VK_S
#define T VK_T
#define t VK_T
#define U VK_U
#define u VK_U
#define V VK_V
#define v VK_V
#define W VK_W
#define w VK_W
#define X VK_X
#define x VK_X
#define Y VK_Y
#define y VK_Y
#define Z VK_Z
#define z VK_Z
#define _0 VK_NUMPAD0
#define _1 VK_NUMPAD1
#define _2 VK_NUMPAD2
#define _3 VK_NUMPAD3
#define _4 VK_NUMPAD4
#define _5 VK_NUMPAD5
#define _6 VK_NUMPAD6
#define _7 VK_NUMPAD7
#define _8 VK_NUMPAD8
#define _9 VK_NUMPAD9
#define _ VK_SPACE //空格 


//#define ; 186
//#define Caps_Lock 20
class Key
{
	public:
		Key();
		~Key();
		Key& down(int vk_code);
		Key& up(int vk_code);
		Key& press(int vk_code);
		Key& combination(int vk_code);
		Key& combination(int vk_code_1,int vk_code_2);
		Key& combination(int vk_code_1,int vk_code_2,int vk_code_3);
		Key& combination(int vk_code_1,int vk_code_2,int vk_code_3,int vk_code_4);
		Key& sleep(int _time);
		Key& caps(); 
		Key& Caps();
		Key& setSleepTime(int _time);
		Key& bearStr(string str);
		Key& period();
		Key& comma();
		int  getTime();
		 
	private:
		
		int time;
		
};

#endif

 Key.cpp
#include "Key.h"
#include <string>
Key::Key()
{
	this->time=0; //默认没有延迟 
	cout<<this->time;
}

Key::~Key()
{
	
}
void state()
{
	/*
	// 判断键盘CapsLock键是否开启状态,开启状态则为大写,否则为小写
     if (GetKeyState(VK_CAPITAL))
     {
         // 如果当前键盘状态为大写,要求改小写,则模拟按键CapsLock切换状态
         if (!big)
         {
             keybd_event(VK_CAPITAL, NULL, KEYEVENTF_EXTENDEDKEY | 0, NULL);
             keybd_event(VK_CAPITAL, NULL, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, NULL);
        }
     }
     else
     {
         // 如果当前键盘状态为小写,要求改大写,则模拟按键CapsLock切换状态He 
         if (big)
         {
             keybd_event(VK_CAPITAL, NULL, KEYEVENTF_EXTENDEDKEY | 0, NULL);
             keybd_event(VK_CAPITAL, NULL, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, NULL);
         }
     }*/
     //if(!GetKeyStaye(VK_CAPITAL))
    // {
     	//press(VK_CAPITAL); 
     	
	// }
	 //如果是小写改成大写 
}

Key& Key::down(int vk_code)
{
	keybd_event(vk_code,0,0,0);
	return *this;

}
Key& Key::up(int vk_code)
{
	keybd_event(vk_code,0,KEYEVENTF_KEYUP,0);
	return *this;

}
Key& Key::press(int vk_code)
{
	if(this->time)
	{
		this->sleep(this->time);
	}
	
	if(islower(vk_code))//小写字母 
	{
		vk_code-=32; 
	}
	down(vk_code);
	up(vk_code);
	return *this; 
}
Key& Key::combination(int vk_code)
{
	press(vk_code);
	return *this;
}
Key& Key::combination(int vk_code_1,int vk_code_2)
{
	down(vk_code_1);
	press(vk_code_2);
	up(vk_code_1);
	return *this;
}
Key& Key::combination(int vk_code_1,int vk_code_2,int vk_code_3)
{
	down(vk_code_1);
	down(vk_code_2);
	press(vk_code_3);
	up(vk_code_2);
	up(vk_code_1);
	return *this;
}
Key& Key::combination(int vk_code_1,int vk_code_2,int vk_code_3,int vk_code_4)
{
	down(vk_code_1);
	down(vk_code_2);
	down(vk_code_3);
	press(vk_code_4);
	up(vk_code_3);
	up(vk_code_2);
	up(vk_code_1);
	return *this;
}
Key& Key::sleep(int _time)
{
	Sleep(_time);
	return *this;
}
Key& Key::caps()
{
	if (GetKeyState(VK_CAPITAL))
    {
         // 如果当前键盘状态为大写,要求改小写,则模拟按键CapsLock切换状态

             keybd_event(VK_CAPITAL, 0, 0, 0);
             keybd_event(VK_CAPITAL, 0, KEYEVENTF_KEYUP, 0);
    }
    return *this;
}
Key& Key::Caps()
{
	if (!GetKeyState(VK_CAPITAL))
    {
         // 如果当前键盘状态为小写,要求改大写,则模拟按键CapsLock切换状态

             keybd_event(VK_CAPITAL, 0, 0, 0);
             keybd_event(VK_CAPITAL, 0, KEYEVENTF_KEYUP, 0);
    }
    return *this;
}
Key& Key::setSleepTime(int _time)
{
	this->time=_time;
	return *this;
}
Key& Key::period()
{
	keybd_event(VK_DECIMAL, 0, 0, 0);
    keybd_event(VK_DECIMAL, 0, KEYEVENTF_KEYUP, 0);
	return *this;
}
Key& Key::comma()
{
	keybd_event(188, 0, 0, 0);
    keybd_event(188, 0, KEYEVENTF_KEYUP, 0);
	return *this;
}
int Key::getTime()
{
	return this->time;
}
Key& Key::bearStr(string str)
{
    for(int cout=0;cout<str.length();cout++)
    {
    	if(isupper(str[cout]))//如果是大写字母
		{
			this->Caps();
			press(str[cout]);
			this->caps(); 
		}
		else if(str[cout]=='.')
		{
			period();
		}
		else if(str[cout]==',')
		{
			comma();
		}
		else
		{
			press(str[cout]);
		}
	}
	return *this;
}


main.cpp
#include "Key.h"
#include <string>
#include <iostream>
#include <fstream>
#include <Windows.h>
using namespace std;
 

void fileTest()
{
	string str;
	ifstream txt("test.txt");
	getline(txt,str); 
	//cout<<str;
	Key *nkey= new Key;
	nkey->sleep(3000);
	//nkey->setSleepTime(100);
	nkey->bearStr(str); 
}


int main(int argc,char *argv[])
{

	fileTest();
	
	return 0;
}

 