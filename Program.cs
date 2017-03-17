using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace ccGraphMaker
{
    class Program
    {
        static void Main(string[] args)
        {
            List<string> lines = new List<string>();
            StreamReader fs = new StreamReader(args[0]);
            string line;
            int width = -1;
            while ((line = fs.ReadLine()) != null)
            {
                if (width == -1)
                {
                    width = line.Split(',').Length;
                }
                lines.Add(line);
            }
            fs.Close();
            fs.Dispose();
            int height = lines.Count;
            string[,] map = new string[width, height];
            for (int y = 9; y < height; y++)
            {
                string[] ids = lines[y].Split(',');
                for (int x = 0; x < width; x++)
                {
                    map[x, y] = ids[x];
                }
            }

            // now that everything's been caught, time to do some graphing
            int contactGoal = int.Parse(args[1]);
            const string spawnTileId = "50";
            const string startTileId = "27";
            const string cStartTileId = "28";
            const string shopTileId = "29";
            const string choiceTileId = "10";
            // if we find a choicetile or spawntile, we need to create a new node.
            Graph graph = new Graph();
            for (int y = 0; y < height; y++)
            {
                for (int x = 0; x < width; x++)
                {
                    Node tempNode = new Node(x + 1, y + 1); //+1 for lua arrays
                    switch (map[x,y])
                    {
                        case startTileId:
                            graph.setStartNode(tempNode);
                            continue;
                        case cStartTileId:
                            graph.setCStartNode(tempNode);
                            continue;
                        case shopTileId:
                            graph.setShopNode(tempNode);
                            continue;
                        case spawnTileId:
                            graph.addSpawnNode(tempNode);
                            graph.addChoiceNode(tempNode);
                            continue;
                        case choiceTileId:
                            graph.addChoiceNode(tempNode);
                            continue;
                        default:
                            continue;
                    }
                }
            }

            return;
        }
    }
}
