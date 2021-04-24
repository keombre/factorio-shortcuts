local handler = {}

function handler.spliter_input(event)
    local player = game.players[event.player_index]
    local hand = player.cursor_stack
    if hand == nil or hand.count == 0 then
        if player.selected ~= nil and player.selected.type == "splitter" then
            local splitter = player.selected
            if splitter.splitter_input_priority == "none" then
                splitter.splitter_input_priority = "left"
            elseif splitter.splitter_input_priority == "left" then
                splitter.splitter_input_priority = "right"
            elseif splitter.splitter_input_priority == "right" then
                splitter.splitter_input_priority = "none"
            end
        end
    end
end

function handler.spliter_output(event)
    local player = game.players[event.player_index]
    local hand = player.cursor_stack
    if hand == nil or hand.count == 0 then
        if player.selected ~= nil and player.selected.type == "splitter" then
            local splitter = player.selected
            if splitter.splitter_output_priority == "none" then
                splitter.splitter_output_priority = "left"
            elseif splitter.splitter_output_priority == "left" then
                splitter.splitter_output_priority = "right"
            elseif splitter.splitter_output_priority == "right" then
                splitter.splitter_output_priority = "none"
            end
        end
    end
end

function handler.train_manual(event)
    local player = game.players[event.player_index]
    local vehicle = player.vehicle
    if vehicle ~= nil then
        local train = vehicle.train
        if train ~= nil then
            if train.manual_mode then
                train.manual_mode = false
            else
                train.manual_mode = true
            end
        end
    end
end

function handler.register_callbacks()
    script.on_event("k-shortcuts-spliter-input", handler.spliter_input)
    script.on_event("k-shortcuts-spliter-output", handler.spliter_output)
    script.on_event("k-shortcuts-train-manual", handler.train_manual)
end

return handler
