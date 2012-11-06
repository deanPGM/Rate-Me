--Project: Rate Me App Template                        																															
--Description: A basic app that counts how many times the app has run
--then displays a 'rate me' popup after the app has run 3 times. 
--Twitter: @CraftyDeano
--GitHub: @CraftyDeano
--App.Net @CraftyDeano
--Web: http://echoecho.es

--<ShamelessAdvertising>
--My 2nd iPhone app, Joke Shake, is available free on the app store for all devices!
--Grab it at www.jokeshake.com
--</ShamelessAdvertising>

settings = require("settings")
settings.load()

_W = display.contentWidth / 2
_H = display.contentHeight / 2

function appRun()
    if (settings.get('timesRun')) == nil then
        timesRun = 1
        print ("Saving Times Run "..timesRun.." to settings.json")
        settings.set('timesRun', timesRun)
        print (" Times Run is:"..(settings.get('timesRun')).." from settings.json")
    else
        timesRun = settings.get('timesRun')
        timesRun = timesRun + 1
        print ("Saving Times Run "..timesRun.." to settings.json")
        settings.set('timesRun', timesRun)
        print (" Times Run is:"..(settings.get('timesRun')).." from settings.json")
        if timesRun == 3 then
            print "Showing 'Rate Me' popup"
            local function onComplete( event )
                if "clicked" == event.action then
                    local i = event.index
                    if 1 == i then
                            print "OK Clicked"
                            system.openURL( "itms-apps://itunes.apple.com/app/pages/id555435191?mt=8&uo=4" )
                    elseif 2 == i then
                            print "Cancel Clicked"
                    end
                end
            end
            local alert = native.showAlert( "Check out my other apps!", "Please rate this app to help support future development!", { "OK", "No Thanks" }, onComplete )
        end
    end
end

appRun()

local text = display.newText(timesRun, _W, _H, native.systemFontBold, 150)
