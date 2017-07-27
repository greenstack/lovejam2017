using System.Collections.Generic;
using System.Text;

namespace ccGraphMaker
{
    class Graph
    {
        private HashSet<Node> choiceNodes = new HashSet<Node>();
        private HashSet<Node> spawnNodes = new HashSet<Node>();
        private Node startNode = new Node();
        private Node cStartNode = new Node();
        private Node shopNode = new Node();

        public void setStartNode(Node n)
        {
            startNode = n;
        }

        public void setCStartNode(Node n)
        {
            cStartNode = n;
        }

        public void setShopNode (Node n)
        {
            shopNode = n;
        }

        public void addSpawnNode(Node n)
        {
            spawnNodes.Add(n);
        }

        public void addChoiceNode(Node n)
        {
            choiceNodes.Add(n);
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("return {\n");
            sb.Append("  start = " + startNode.ToString() + ",\n");
            sb.Append("  cstart = " + cStartNode.ToString() + ",\n");
            sb.Append("  shop = " + shopNode.ToString() + ",\n");
            sb.Append("  enodec = " + spawnNodes.Count + ",\n");
            sb.Append("  enodes = {\n");
            foreach (var node in spawnNodes)
            {
                sb.Append("    " + node.ToString() + ",\n");
            }
            sb.Append("  },\n");
            sb.Append("  nodes = {");
            //Insert all the nodes
            foreach (Node n in choiceNodes)
            {
                sb.Append("{\n      n=" + n.ToString() + ",\n");
                sb.Append("      ct = " + n.getCNodes().Count + ",\n      ts={");
                foreach (Node c in choiceNodes)
                {
                    sb.Append("        " + c.ToString() + ",\n");
                }
                sb.Append("      }\n    },");
            }
            sb.Append("  }\n}\n");

            return sb.ToString();
        }
    }
}
