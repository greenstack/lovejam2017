return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.18.1",
  orientation = "orthogonal",
  renderorder = "left-down",
  width = 45,
  height = 45,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "tiles",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "resources/images/tiles.png",
      imagewidth = 320,
      imageheight = 320,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 100,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "ground",
      x = 0,
      y = 0,
      width = 45,
      height = 45,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 16, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        6, 6, 6, 6, 6, 16, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 1, 1, 1, 0, 0, 1, 1, 1, 1,
        10, 10, 10, 20, 10, 10, 10, 10, 10, 20, 10, 10, 10, 20, 10, 10, 10, 10, 10, 10, 19, 26, 26, 26, 26, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 21, 1, 1, 0, 62, 0, 0, 1, 1, 1,
        1, 1, 1, 2, 2, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1, 1, 1, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 0, 0, 0, 1, 1,
        1, 1, 1, 2, 2, 1, 22, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 5, 6, 6, 6, 6, 7, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 1, 1, 1, 0, 0, 0, 1, 1,
        1, 1, 1, 1, 2, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 21, 5, 6, 6, 6, 6, 7, 3, 3, 3, 1, 1, 1, 3, 3, 3, 2, 2, 1, 1, 1, 0, 0, 0, 1, 1,
        1, 1, 1, 1, 2, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 3, 3, 1, 1, 1, 1, 3, 3, 3, 2, 2, 2, 1, 1, 0, 0, 0, 1, 1,
        1, 1, 1, 1, 2, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 3, 3, 3, 1, 1, 1, 3, 3, 3, 2, 2, 2, 1, 1, 0, 0, 0, 1, 1,
        1, 1, 1, 1, 2, 1, 22, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 8, 3, 3, 1, 1, 1, 1, 3, 3, 3, 2, 2, 2, 2, 1, 0, 0, 0, 1, 1,
        1, 1, 1, 1, 2, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 5, 6, 6, 6, 6, 7, 3, 3, 3, 3, 22, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1,
        1, 1, 1, 1, 2, 1, 22, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 26, 26, 26, 26, 18, 15, 15, 15, 15, 15, 15, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 22, 1,
        1, 1, 1, 1, 1, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 5, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 7, 1,
        21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 5, 6, 16, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 7, 1,
        1, 1, 1, 1, 1, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 16, 6, 6, 6, 27, 6, 6, 6, 6, 8, 1,
        1, 1, 1, 1, 1, 1, 22, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 7, 1,
        1, 1, 1, 1, 1, 1, 22, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 5, 26, 26, 26, 26, 9, 20, 10, 10, 10, 10, 20, 10, 10, 10, 10, 20, 10, 19, 26, 26, 26, 26, 7, 1,
        1, 1, 1, 1, 1, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 5, 6, 6, 6, 6, 7, 1, 1, 1, 1, 3, 0, 0, 3, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1,
        1, 1, 1, 1, 1, 1, 22, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 4, 6, 6, 6, 6, 7, 1, 2, 1, 1, 3, 0, 0, 3, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1,
        1, 1, 1, 1, 1, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1, 1, 0, 0, 3, 0, 0, 3, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1,
        1, 1, 1, 1, 1, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1, 1, 0, 0, 3, 0, 0, 3, 1, 1, 1, 1, 5, 6, 6, 16, 6, 8, 1,
        1, 1, 1, 1, 1, 1, 22, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 8, 1, 1, 0, 0, 3, 3, 3, 3, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1,
        1, 1, 1, 1, 1, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 4, 6, 6, 6, 6, 7, 1,
        1, 1, 1, 1, 1, 1, 22, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 6, 6, 6, 6, 7, 2, 1, 1, 12, 1, 1, 1, 1, 2, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1,
        1, 1, 1, 1, 1, 1, 22, 1, 1, 1, 22, 1, 2, 1, 22, 1, 22, 1, 1, 2, 5, 6, 6, 6, 6, 7, 1, 1, 1, 12, 1, 1, 2, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1,
        15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 14, 15, 15, 15, 15, 15, 14, 15, 15, 17, 26, 26, 26, 26, 18, 15, 15, 15, 14, 15, 15, 15, 15, 15, 15, 15, 15, 17, 26, 26, 26, 26, 18, 14,
        6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 27, 6,
        6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 16, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 16, 6, 6, 6, 27, 6, 6, 6, 6, 27, 6,
        6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 16, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 27, 6,
        6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 27, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 27, 6, 6, 6, 6, 27, 6,
        26, 26, 26, 26, 9, 10, 10, 20, 10, 10, 10, 10, 10, 20, 10, 10, 10, 10, 10, 10, 19, 26, 26, 26, 26, 9, 20, 10, 10, 10, 10, 10, 10, 10, 20, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        6, 6, 6, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 6, 6, 6, 6, 7, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 22, 1, 2,
        6, 6, 6, 6, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 21, 5, 6, 6, 6, 6, 8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 22, 1, 1,
        6, 6, 6, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 22, 1, 1,
        6, 6, 6, 6, 7, 1, 1, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 1, 5, 6, 6, 6, 6, 7, 1, 1, 62, 72, 73, 63, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 22, 1, 1,
        6, 6, 6, 6, 7, 1, 1, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 1, 5, 6, 6, 6, 6, 7, 1, 1, 72, 1, 1, 73, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 22, 1, 1,
        6, 6, 6, 6, 7, 1, 1, 91, 91, 92, 91, 91, 91, 92, 91, 91, 91, 92, 91, 1, 5, 6, 6, 6, 6, 7, 1, 1, 91, 92, 91, 91, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 22, 1, 1,
        6, 16, 6, 6, 7, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 5, 26, 26, 26, 26, 7, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
        6, 6, 6, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 16, 6, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        6, 6, 6, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1, 62, 63, 1, 1, 1, 1, 1, 61, 61, 62, 63, 1, 1, 1, 1, 1, 1, 1,
        6, 6, 6, 6, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1, 72, 73, 71, 71, 1, 1, 1, 71, 71, 72, 73, 1, 1, 1, 2, 1, 2, 1,
        6, 6, 6, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 6, 6, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        26, 26, 26, 26, 18, 15, 14, 15, 15, 15, 15, 15, 14, 15, 15, 15, 15, 15, 15, 15, 17, 26, 26, 26, 26, 18, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 14, 15, 15, 15, 15, 15, 15,
        6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6
      }
    },
    {
      type = "tilelayer",
      name = "blocking",
      x = 0,
      y = 0,
      width = 45,
      height = 45,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 42, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 47, 47, 47, 47, 47, 0, 47, 47,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49, 0, 0, 52, 53, 0, 0, 0, 36,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49, 0, 52, 0, 63, 53, 0, 0, 36,
        0, 0, 0, 0, 0, 0, 0, 42, 31, 31, 24, 31, 25, 0, 61, 61, 61, 61, 61, 0, 0, 0, 0, 0, 0, 0, 0, 47, 47, 52, 65, 47, 47, 47, 47, 0, 49, 52, 62, 62, 63, 63, 53, 0, 36,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 0, 32, 0, 71, 71, 71, 71, 71, 0, 0, 0, 0, 0, 0, 0, 0, 49, 54, 62, 63, 55, 0, 0, 36, 0, 49, 62, 62, 62, 63, 63, 63, 41, 36,
        23, 31, 31, 31, 31, 25, 0, 0, 0, 0, 32, 0, 32, 0, 81, 81, 81, 81, 81, 0, 0, 0, 0, 0, 0, 0, 0, 49, 62, 72, 73, 63, 0, 0, 36, 0, 49, 62, 62, 72, 73, 63, 63, 0, 36,
        32, 0, 0, 0, 0, 32, 0, 0, 0, 0, 32, 0, 0, 0, 91, 91, 91, 91, 91, 0, 0, 0, 0, 0, 0, 0, 0, 49, 72, 82, 82, 73, 0, 0, 36, 42, 49, 62, 72, 82, 82, 73, 63, 0, 36,
        32, 0, 0, 0, 0, 32, 0, 0, 0, 0, 32, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49, 82, 82, 82, 82, 0, 0, 36, 0, 49, 72, 82, 82, 82, 82, 73, 0, 36,
        32, 0, 0, 0, 0, 32, 0, 0, 0, 0, 33, 31, 31, 31, 31, 31, 31, 31, 31, 31, 0, 0, 0, 0, 0, 0, 0, 46, 91, 91, 92, 91, 47, 47, 48, 0, 46, 91, 91, 92, 91, 91, 91, 47, 48,
        32, 0, 0, 0, 0, 32, 0, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0,
        33, 25, 0, 0, 23, 35, 0, 23, 25, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        43, 45, 0, 0, 43, 45, 0, 43, 44, 31, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0,
        41, 0, 23, 31, 24, 25, 0, 23, 24, 31, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0,
        0, 0, 32, 0, 43, 45, 0, 43, 45, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 32, 0, 0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0,
        25, 0, 32, 0, 0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54, 55, 0, 23, 31, 31, 25, 0, 0, 0, 0, 0, 0, 0,
        44, 31, 34, 31, 25, 0, 0, 23, 31, 31, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 62, 63, 47, 32, 76, 76, 32, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 32, 0, 32, 0, 0, 32, 0, 52, 53, 0, 0, 0, 47, 47, 47, 47, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 52, 53, 49, 72, 73, 36, 32, 76, 76, 32, 0, 0, 0, 0, 0, 0, 0,
        0, 31, 45, 0, 32, 0, 0, 32, 52, 62, 63, 53, 0, 0, 49, 0, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 63, 49, 91, 91, 36, 32, 76, 76, 32, 0, 0, 0, 42, 0, 0, 0,
        0, 0, 0, 0, 32, 0, 0, 32, 62, 72, 73, 63, 0, 0, 61, 61, 61, 61, 61, 0, 0, 0, 41, 0, 0, 0, 0, 0, 74, 75, 46, 47, 47, 48, 32, 76, 76, 32, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 23, 35, 0, 0, 43, 72, 82, 82, 73, 0, 0, 81, 81, 81, 81, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 93, 94, 0, 0, 0, 0, 32, 76, 76, 32, 0, 0, 0, 0, 0, 0, 0,
        31, 31, 0, 43, 45, 0, 0, 0, 91, 91, 92, 91, 0, 0, 91, 91, 92, 91, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 76, 76, 32, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43, 31, 31, 45, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41,
        0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 42, 42, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 32, 0, 0, 0, 0, 71, 71, 71, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 52, 53, 0, 0, 0, 23, 31, 31, 31, 31, 25, 0, 42, 42, 42, 0,
        0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 32, 0, 0, 0, 0, 91, 91, 91, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 62, 63, 65, 0, 0, 32, 0, 0, 0, 0, 32, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 42, 0, 23, 31, 31, 31, 44, 31, 31, 31, 31, 31, 31, 31, 31, 25, 0, 0, 0, 0, 0, 0, 47, 47, 62, 62, 63, 63, 47, 47, 43, 31, 31, 31, 31, 45, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 49, 0, 62, 72, 73, 63, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 49, 0, 72, 82, 82, 73, 0, 36, 0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 43, 91, 91, 92, 91, 91, 91, 92, 91, 91, 91, 92, 91, 45, 0, 0, 0, 0, 0, 0, 46, 47, 91, 92, 91, 91, 47, 48, 0, 0, 0, 0, 0, 0, 32, 41, 41, 42, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 41, 42, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 0, 0, 0, 0, 0, 0, 0, 0, 52, 53, 0, 0, 0, 0, 0, 0, 0, 52, 53, 0, 0, 32, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 42, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 63, 61, 61, 0, 0, 0, 61, 61, 62, 63, 0, 0, 32, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 41, 0, 0, 0, 41, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 72, 73, 71, 71, 0, 0, 0, 71, 71, 72, 73, 0, 0, 32, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 0, 0, 0, 0, 0, 0, 0, 0, 91, 92, 91, 91, 0, 0, 0, 91, 91, 92, 91, 0, 0, 43, 31, 31, 31, 31,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "decorations",
      x = 0,
      y = 0,
      width = 45,
      height = 45,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 87, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 76, 0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 96, 0, 76, 0, 0, 0, 0, 0, 96, 76, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 77,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 76, 0, 86, 0, 76, 0, 86, 0, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 0, 76, 0, 86, 0, 76, 0, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 87, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 0, 66, 67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 96, 0, 0, 56, 57, 0, 96, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 87, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 87, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 97, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 76, 0, 0, 0, 0, 0, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 96, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 86, 0, 96, 0, 76, 0, 96, 0, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 76, 86, 76, 0, 0, 0, 0, 77, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27, 0, 0, 0, 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
