using System.Collections.Generic;
using System.IO;

namespace ccGraphMaker
{
    class Program
    {

        private static int mapWidth = -1;
        private static int mapHeight;
        const string spawnTileId = "50";
        const string startTileId = "27";
        const string cStartTileId = "28";
        const string shopTileId = "29";
        const string choiceTileId = "10";
        const string stopTileId = "39";

        static void Main(string[] args)
        {
            List<string> lines = new List<string>();
            StreamReader fs = new StreamReader("level1_nodes.csv");
            string line;
            while ((line = fs.ReadLine()) != null)
            {
                if (mapWidth == -1)
                {
                    mapWidth = line.Split(',').Length;
                }
                lines.Add(line);
            }
            fs.Close();
            fs.Dispose();
            mapHeight = lines.Count;
            string[,] map = new string[mapWidth, mapHeight];
            for (int y = 9; y < mapHeight; y++)
            {
                string[] ids = lines[y].Split(',');
                for (int x = 0; x < mapWidth; x++)
                {
                    map[x, y] = ids[x];
                }
            }

            // now that everything's been caught, time to do some graphing
            int contactGoal = int.Parse("5");
            
            // if we find a choicetile or spawntile, we need to create a new node.
            Graph graph = new Graph();
            for (int y = 0; y < mapHeight; y++)
            {
                for (int x = 0; x < mapWidth; x++)
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
                            tempNode.connectNodes(attachNodes(map, tempNode));
                            graph.addChoiceNode(tempNode);
                            continue;
                        case choiceTileId:
                            tempNode.connectNodes(attachNodes(map, tempNode));
                            graph.addChoiceNode(tempNode);
                            continue;
                        default:
                            continue;
                    }
                }
            }
            using (StreamWriter file = new StreamWriter("level_1.lua"))
            {
                file.WriteLine(graph.ToString());
            }
            return;
        }

        private static List<Node> attachNodes(string[,] map, Node node)
        {

            List<Node> attached = new List<Node>();
            //search upwards
            for (int i = node.getY() - 1; i >= 0; i--)
            {
                string temp = map[node.getX() - 1, i];
                if (temp == choiceTileId || temp == spawnTileId)
                {
                    //add the node to the choices and break.
                    attached.Add(new Node(node.getX(), i - 1));
                    break;
                }
                else if (temp == stopTileId || temp == shopTileId)
                    break; //Stop searching this path.
            }
            //search to the left
            for (int i = node.getX() - 1; i > 0; i--)
            {
                string temp = map[i - 1, node.getY() - 1];
                if (temp == choiceTileId || temp == spawnTileId)
                {
                    attached.Add(new Node(i + 1, node.getY()));
                    break;
                }
                else if (temp == stopTileId || temp == shopTileId)
                    break; //Stop searching this path.
            }
            //search to the right
            for (int i = 0; i < mapWidth; i++)
            {
                string temp = map[i, node.getY() - 1];
                if (temp == choiceTileId || temp == spawnTileId)
                {
                    attached.Add(new Node(i, node.getY()));
                    break;
                }
                else if (temp == stopTileId || temp == shopTileId)
                    break; //Stop searching this path.
            }
            //search downwards
            for (int i = 0; i < mapHeight; i++)
            {
                string temp = map[node.getX() - 1, i];
                if (temp == choiceTileId || temp == spawnTileId)
                {
                    attached.Add(new Node(node.getX(), i));
                    break;
                }
                else if (temp == stopTileId || temp == shopTileId)
                    break; //Stop searching this path.
            }
            return attached;
        }
    }
}
