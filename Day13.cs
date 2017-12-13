using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;
using System;
using System.Linq;

namespace Quantum.Bell
{
    class Driver
    {
        static void Main(string[] args)
        {
            //production input
            var input = "0: 4;1: 2;2: 3;4: 4;6: 6;8: 5;10: 6;12: 6;14: 6;16: 12;18: 8;20: 9;22: 8;24: 8;26: 8;28: 8;30: 12;32: 10;34: 8;36: 12;38: 10;40: 12;42: 12;44: 12;46: 12;48: 12;50: 14;52: 14;54: 12;56: 12;58: 14;60: 14;62: 14;66: 14;68: 14;70: 14;72: 14;74: 14;78: 18;80: 14;82: 14;88: 18;92: 17";
            //sample input
            //var input = "0: 3;1: 2;4: 4;6: 4"; 
            var i = 0;
            var inputs = input.Split(';');
            //var layers = inputs.Aggregate((steps: i, sum: 0), func: SumUp); //expected: 1580
            var layers = inputs.Aggregate((steps: i, sum: 0), func: waitms); //expected: 3943252
            while (layers.sum > 0)
            {
                i++;
                layers = inputs.Aggregate((steps: i, sum: 0), func: waitms);
            }
            System.Console.WriteLine(layers.steps);
            //layers.
            //using (var sim = new QuantumSimulator())
            //{
            //    // Try initial values
            //    Result[] initials = new Result[] { Result.Zero, Result.One };
            //    foreach (Result initial in initials)
            //    {
            //        var res = BellTest.Run(sim, 1000, initial).Result;
            //        var (numZeros, numOnes, agree) = res;
            //        System.Console.WriteLine(
            //            $"Init:{initial,-4} 0s={numZeros,-4} 1s={numOnes,-4} agree={agree,-4}");
            //    }
            //}
            System.Console.WriteLine("Press any key to continue...");
            System.Console.ReadKey();
        }

        private static (int, int) waitms((int steps, int sum) last, String item)
        {
            if (last.sum > 0) return last;
            var items = item.Split(new string[] { ": " }, StringSplitOptions.None);
            var layer = Convert.ToInt32(items[0]);
            var size = Convert.ToInt32(items[1]);
            var fireWallPos = getPosition(size, layer + last.steps);

            if (fireWallPos == 0)
            {
                last.sum = last.sum + 1;
                System.Console.WriteLine("after " + last.steps+ "ms in Layer: " + layer);
            }
            return last;
        }

        private static (int, int) SumUp((int steps, int sum) last, String item) {
            var items = item.Split(new string[] { ": " }, StringSplitOptions.None);
            var layer = Convert.ToInt32(items[0]);
            var size = Convert.ToInt32(items[1]);
            var fireWallPos = getPosition(size, layer);
            var myPos = layer;
            
            if (fireWallPos == 0)
            {
                last.sum = last.sum + layer * size;
            }
            return last;
        }

        private static int getPosition(int length, int steps)
        {
            var up = true;
            var quot = Convert.ToInt32(Math.Floor((decimal)steps / (length - 1)));

            if (quot % 2 == 0) { //even
                steps = steps - quot * (length - 1);
            } else {
                steps = (length - 1) - (steps - quot * (length - 1));
            }
            return steps;
        }


    }
}