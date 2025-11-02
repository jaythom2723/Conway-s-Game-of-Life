local cells = {}
local cols = math.floor(800 / 8) -- grid width
local rows = math.floor(600 / 8) -- grid height
local cell_dim = 8               -- width and height for a cell
local check_timer = 0

local function reset()
    -- randomize the starting 'alive' and 'dead' cells
    local area = cols * rows
    -- reset all of the cells
    for i = 1, area do
        cells[i].alive = false
        local random = math.random()
        if random > 0.95 then cells[i].alive = true end
    end
end

function love.load()
    love.window.setMode(800, 600, { borderless = true, centered = true })

    -- create each cell for the game
    for row = 0, rows do
        local y = row + ((cell_dim - 1) * row)

        for col = 0, cols do
            local x = col + ((cell_dim - 1) * col)
            table.insert(cells, {
                x = x,
                y = y,
                alive = false,
                paint_dbg = false,
                dbg_color = { 1, 0, 0, 1 }
            })
        end
    end

    reset()
end

local function get_neighbors(i)
    local neighbors = {}

    local tl_index = i - (cols + 2) -- top left
    local tm_index = i - (cols + 1) -- top middle
    local tr_index = i - cols       -- top right
    local ml_index = i - 1          -- middle left
    local mr_index = i + 1          -- middle right
    local bl_index = i + cols       -- bottom left
    local bm_index = i + (cols + 1) -- bottom middle
    local br_index = i + (cols + 2) -- bottom right

    -- TODO: add edge case for nonexistant neighbors
    neighbors[1] = cells[tl_index] or nil
    neighbors[2] = cells[tm_index] or nil
    neighbors[3] = cells[tr_index] or nil
    neighbors[4] = cells[ml_index] or nil
    neighbors[5] = cells[mr_index] or nil
    neighbors[6] = cells[bl_index] or nil
    neighbors[7] = cells[bm_index] or nil
    neighbors[8] = cells[br_index] or nil

    return neighbors
end

local function num_alive_neighbors(neighbors)
    local alive = 0

    for i = 1, #neighbors do
        if neighbors[i] and neighbors[i].alive then alive = alive + 1 end
    end

    return alive
end

function love.keypressed(key)
    if key == 'r' then
        reset()
    end
end

function love.update(dt)
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end

    check_timer = check_timer + dt
    if check_timer > 0.05 then
        for i = 1, (cols * rows) do
            local neighbors = get_neighbors(i)
            local num_alive = num_alive_neighbors(neighbors)

            if num_alive < 2 then
                cells[i].alive = false
            elseif num_alive > 3 then
                cells[i].alive = false
            elseif num_alive == 3 then
                cells[i].alive = true
            end
        end
        check_timer = 0
    end
end

function love.draw()
    -- draw the cells
    for _, v in ipairs(cells) do
        if v.alive then
            if v.paint_dbg then
                love.graphics.setColor(v.dbg_color)
            end

            love.graphics.rectangle('fill', v.x, v.y, cell_dim, cell_dim)
            love.graphics.setColor(1, 1, 1, 1)
        end
    end
end
