using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Memory;

namespace MOGDumper_Injector
{
    internal class Program
    {
        public static void Inject()
        {
            Console.Title = "MOGDumper-Injector by RiritoXXL";
            if (File.Exists("MasterOfGardenDumper.dll"))
            {
                Console.WriteLine("Founded File!!!");
            }
            else
            {
                Console.WriteLine("Not Founded File!!! Pls try Download or Compile This DLL File for Dumping Game The Eminence in Shadow: Master Of Garden!!!");
                Environment.Exit(318);
            }
            Mem m = new Mem();
            if(m.OpenProcess("MasterofGarden.exe"))
            {
                if (m.InjectDll("MasterOfGardenDumper.dll"))
                {
                    Console.WriteLine("Injected!!!");
                    Console.WriteLine("Thank you for Choosing This Injector... Created by RiritoXXL!!!");
                    Environment.Exit(1442);
                }
                else
                {
                    Console.WriteLine("Failed to Inject!!! Try Run As Admin this Injector!!!");
                    Environment.Exit(122);
                }
                
            }
            else
            {
                Console.WriteLine("Failed to Find This Game!!!");
                Environment.Exit(311);
            }
        }
        static void Main(string[] args)
        {
            Inject();
        }
    }
}
