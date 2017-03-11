screens = {}

function screens.drawWinScreen()
  love.graphics.setColor(10,10,180)
  love.graphics.rectangle("fill", 10,10,780,580)

  love.graphics.reset()
  love.graphics.draw(winImage,125,100)
  love.graphics.print("Press Space to Restart.", 325,300)
end

function screens.drawStartScreen()
  love.graphics.reset()
  love.graphics.setColor(96,96,96)
  love.graphics.rectangle("fill", 10,10,780,580)
  
  love.graphics.setColor(250,250,250)
  love.graphics.rectangle("fill", 80,80,650,460)
  
  love.graphics.reset()
  love.graphics.draw(logoImage,150,100)
  
  love.graphics.setColor(255,255,255)
  love.graphics.print("\" ... STAY TOGETHER. Never be alone. [...] Staying together means staying within sight and hearing of each other.\" ",30,30)
  love.graphics.print("~ The Missionary Handbook, page 30",50,50)
  
  love.graphics.setColor(16,20,20)
  love.graphics.print("Talk to people by pressing spacebar. Try to fulfill your goal for daily contacts",100,300)
  love.graphics.print("You appear to have done something to upset your companion. He is trying to get away from you",100,330)
  love.graphics.print("Your companion might like you better if you give him his favorite treat, ice cream",100,360)
  love.graphics.print("You might be able to buy some from the mysterious person at the shop",100,390)
end