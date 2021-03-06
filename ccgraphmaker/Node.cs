﻿using System.Collections.Generic;

namespace ccGraphMaker
{
    class Node
    {
        private int x;
        private int y;
        private List<Node> connectedNodes = new List<Node>();

        public Node() { }

        public Node(int x, int y)
        {
            this.x = x;
            this.y = y;
        }

        public void setX(int x)
        {
            this.x = x;
        }

        public int getX()
        {
            return x;
        }

        public void setY(int y)
        {
            this.y = y;
        }

        public int getY()
        {
            return y;
        }

        public void connectNode(Node n)
        {
            connectedNodes.Add(n);
        }

        public void connectNodes(List<Node> nodes)
        {
            connectedNodes.AddRange(nodes);
        }

        public override string ToString()
        {
            return "{" + x + "," + y + "}";
        }

        public List<Node> getCNodes()
        {
            return connectedNodes;
        }
    }
}
