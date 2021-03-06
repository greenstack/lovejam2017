return {
  start = {25,20},
  cstart = {24,20},
  shop = {10,20},
  contactGoal = 3,
  enodec = 22,
  enodes = {
    {2,1}, --en
    {16,1}, --en
    {21,1}, --en
    {35,8}, --en
    {35,7}, 
    {26,7},
    {1,10}, --en
    {1,22}, --en
    {6,21},
    {12,21},
    {1,27}, --en
    {35,13}, --en
    {35,22}, --en
    {35,27}, --en
    {35,34}, --en
    {21,35}, --en
    {13,34},
    {15,29},
    {9,34},
    {5,34},
    {1,34}, --en
    {16,35} --en
  },
  nodes = {
    { 
      n = {26,7},
      c = 1,
      ts = {
        {26,8},
      }
    },
    { 
      n = {2,1},
      c = 1,
      ts = {
        {2,10},
        {15,3}
      }
    },
    {
      n = {2,10},
      c = 4,
      ts = {
        {16,10},
        {2,1}, --en
        {1,10}, --en
        {1,21},
      }
    },
    {
      n = {16,3},
      ct = 2,
      ts = {
        {16,2},
        {15,3},
      }
    },
    {
      n = {15,3},
      ct = 1,
      ts = {
        {15,2}
      }
    },
    {
      n = {1,2},
      ct = 1,
      ts = {
        {2,10}
      }
    },
    {
      n = {1,10}, --en
      ct = 1,
      ts = {
        {2,10}
      }
    },
    {
      n = {16,8},
      ct = 3,
      ts = {
        {16,3},
        {21,8},
        {16,10}
      }
    },
    {
      n = {16,1}, --en
      ct = 1,
      ts = {
        {16,3}
      }
    },
    {
      n = {21,1}, --en
      ct = 1,
      ts = {
        {21,8}
      }
    },
    {
      n = {21,8},
      ct = 4,
      ts = {
        {21,1}, -- en
        {16,8},
        {26,8},
        {21,13}
      }
    },
    {
      n = {25,6},
      ct = 1,
      ts = {
        {25,8}
      }
    },
    {
      n = {26,8},
      ct = 3,
      ts = {
        {21,8},
        {34,8},
        {26,7},
      }
    },
    {
      n = {35,7},
      ct = 1,
      ts = {
        {35,8} --en
      }
    },
    {
      n = {35,8}, --en
      ct = 2,
      ts = {
        {34,8},
        {35,7}
      }
    },
    {
      n = {34,8},
      ct = 3,
      ts = {
        {26,8},
        {35,8}, --en
        {34,13}
      }
    },
    {
      n = {16,10},
      ct = 3,
      ts = {
        {16,8},
        {2,10},
        {16,13}
      }
    },
    {
      n = {16,13},
      ct = 3,
      ts = {
        {16,10},
        {21,13},
        {16,22}
      }
    },
    {
      n = {21,13},
      ct = 4,
      ts = {
        {21,8},
        {16,13},
        {21,22},
        {33,13},
      }
    },
    {
      n = {34,13},
      ct = 4,
      ts = {
        {34,8},
        {35,13}, --en
        {21,13},
        {34,22}
      }
    },
    {
      n = {35,13}, --en
      ct = 1,
      ts = {
        {34,13}
      }
    },
    {
      n = {6,21},
      ct = 1,
      ts = {
        {6,22}
      }
    },
    {
      n = {6,22},
      ct = 3,
      ts = {
        {6,21},
        {3,22},
        {10,22},
      }
    },
    {
      n = {2,22},
      ct = 3,
      ts = {
        {1,22}, --en
        {2,10},
        {3,22}
      }
    },
    {
      n = {1,22}, --en
      ct = 1,
      ts = {
        {2,22}
      }
    },
    {
      n = {3,22},
      ct = 3,
      ts = {
        {2,22},
        {6,22},
        {3,27}
      }
    },
    {
      n = {10,22},
      ct = 3,
      ts = {
        {6,22},
        {10,21},
        {12,22}
      }
    },
    {
      n = {10,21},
      ct = 1,
      ts = {
        {10,22}
      }
    },
    {
      n = {12,21},
      ct = 1,
      ts = {
        {12,22}
      }
    },
    {
      n = {12,22},
      ct = 3,
      ts = {
        {10,22},
        {16,22},
        {12,21},
      }
    },
    {
      n = {16,22},
      ct = 4,
      ts = {
        {12,22},
        {16,13},
        {21,22},
        {16,27}
      }
    },
    {
      n = {21,22},
      ct = 4,
      ts = {
        {16,22},
        {21,13},
        {21,27},
        {34,22},
      }
    },{
      n = {34,22},
      ct = 4,
      ts = {
        {21,22},
        {34,13},
        {35,22}, --en
        {34,27}
      }
    },
    {
      n = {35,22}, --en
      ct = 1,
      ts = {
        {24,22}
      }
    },
    {
      n = {1,27}, --en
      ct = 1,
      ts = {
        {3,27}
      }
    },
    {
      n = {3,27},
      ct = 3,
      ts = {
        {3,22},
        {1,27}, --en
        {16,27}
      }
    },
    {
      n = {26,27},
      ct = 4,
      ts = {
        {3,27},
        {16,22},
        {21,27},
        {16,29},
      }
    },
    {
      n = {21,27},
      ct = 4,
      ts = {
        {16,27},
        {21,22},
        {34,27},
        {21,34}
      }
    },
    {
      n = {34,27},
      ct = 3,
      ts = {
        {34,23},
        {35,27}, --en
        {21,27}
      }
    },
    {
      n = {35,27}, --en
      ct = 1,
      ts = {
        {34,27}
      }
    },
    {
      n = {15,29},
      ct = 1,
      ts = {
        {16,29}
      }
    },
    {
      n = {16,29},
      ct = 3,
      ts = {
        {16,27},
        {15,29},
        {16,34},
      }
    },
    {
      n = {16,34},
      ct = 4,
      ts = {
        {13,34},
        {16,35}, --en
        {16,29},
        {21,34}
      }
    },
    {
      n = {1,34}, --en
      ct = 1,
      ts = {
        {5,34}
      }
    },
    {
      n = {5,34},
      ct = 2,
      ts = {
        {1,34}, --en
        {9,34}
      }
    },
    {
      n = {9,34},
      ct = 2,
      ts = {
        {5,34},
        {13,34}
      }
    },
    {
      n = {13,34},
      ct = 2,
      ts = {
        {9,34},
        {16,34}
      }
    },
    {
      n = {16,35}, --en
      ct = 1,
      ts = {
        {16,34}
      }
    },
    {
      n = {21,34},
      ct = 4,
      ts = {
        {21,27},
        {16,34},
        {21,35}, --end node
        {25,34}
      }
    },
    {
      n = {21,35}, --end node
      ct = 1,
      ts = {
        {21,34}
      }
    },
    {
      n = {25,34},
      ct = 2,
      ts = {
        {21,34},
        {35,34} -- end node
      }
    },
    {
      n = {35,34}, --en
      ct = 1,
      ts = {
        {25,34}
      }
    },
  }
}