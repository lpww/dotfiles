import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO
import Graphics.X11.ExtraTypes.XF86

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/thomas/.xmobarrc"
    xmonad $ desktopConfig
        { manageHook = manageDocks <+>  manageHook desktopConfig
        , layoutHook = avoidStruts $ layoutHook desktopConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , terminal = "st" -- use st terminal
        , modMask = mod4Mask -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "slock") -- lock screen
        , ((controlMask, xK_Print), spawn "sleep 0.2; gnome-screenshot -a") -- ctrl+printscreen: screenshot selected area
        , ((0, xK_Print), spawn "gnome-screenshot -w") -- printscreen: screenshot focused window
        , ((0, xF86XK_AudioMute), spawn "amixer -q set Master toggle") -- mute volume
        , ((0, xF86XK_AudioLowerVolume), spawn "amixer -q set Master 5%-") -- decrease volume
        , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q set Master 5%+") -- increase volume
        , ((0, xF86XK_MonBrightnessDown), spawn "brightness down") -- decrease brightness (not working)
        , ((0, xF86XK_MonBrightnessUp), spawn "brightness up") -- increase brightness (not working)
        ]
