
--pinger variables used to iterate the prerender function every 0.5s
nextCheck = os.clock()

windower.raw_register_event('prerender',function()
    if os.clock()-nextCheck > 0.2 then
        gearswap.refresh_globals(false)

        if player.equipment.sub ~= 'Priwen' and player.status ~= 'Event' then
            send_command('input /equip sub "Priwen";')
        end

        nextCheck = os.clock()
    end
end)