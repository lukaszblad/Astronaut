Astronaut = Class{}

function Astronaut:init()
    -- initial position centered
    self.x = VIRTUAL_WIDTH / 2 - 8
    self.y = VIRTUAL_HEIGHT / 2 - 10

    --sprite dimensions
    self.width = 16
    self.height = 20

    -- starting velocity at zero
    self.dx = 0
    self.dy = 0

    self.vertical_speed = 0
    self.horizontal_speed = 0

end

function Astronaut:update(dt)

    -- detect movement and update velocity
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        self.vertical_speed = self.vertical_speed - 1
    elseif love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        self.vertical_speed = self.vertical_speed + 1
    elseif love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        self.horizontal_speed = self.horizontal_speed - 1
    elseif love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        self.horizontal_speed = self.horizontal_speed + 1
    end

    self.dy = self.vertical_speed
    self.dx = self.horizontal_speed

    -- create hover in space effect

    -- update coordinates with bopundaries
    if self.dx < 0 then
        self.x = math.max(0, self.x + self.dx * dt)
    else
        self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dx * dt)
    end

    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
    else
        self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)
    end

end

function Astronaut:render()
    love.graphics.draw(gSprites['astronaut'], self.x, self.y)
end