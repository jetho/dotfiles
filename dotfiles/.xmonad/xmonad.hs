import XMonad hiding ( (|||) )
import XMonad.Layout.LayoutCombinators
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers ( isFullscreen, isDialog, doFullFloat )
import XMonad.Util.Run(spawnPipe)
import System.IO
import XMonad.Actions.DynamicWorkspaces
import XMonad.Prompt
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Layout.PerWorkspace
import XMonad.Util.EZConfig
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.Grid
import XMonad.Layout.Magnifier
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Actions.CycleWS
import System.Exit
import XMonad.Prompt.RunOrRaise (runOrRaisePrompt)


userDir = "/home/jens/"
bitmapDir = userDir ++ ".xmonad/xbm/"
myTerminal = "urxvtc"
conkyDir = userDir ++ ".conky/"


myStatusBar = "dzen2 -ta l -x 0 -y 0 -w 720 -h 16 -fn inconsolata-12 -fg #ffffff -bg #000000"
musicBar = "cat " ++ conkyDir ++ "musicBar | dzen2 -p -x 720 -y 0 -w 80 -h 16 -fn inconsolata-12 -fg yellow -bg #000000"
rightBar = "conky -c " ++ conkyDir ++ "conkyrc | dzen2 -x 800 -h 16 -fn inconsolata-12 -y 0 -w 850 -ta r -fg #ffffff -bg #000000"


myWorkspaces = ["1:term", "2:www", "3:dev", "4:news", "5:irc", "6:music", "7:sys", "8:misc"]

iconMap = M.map (bitmapDir ++) icons
    where 
        icons = M.fromList [("Full", "layout_full.xbm"),
                            ("Tiles", "layout_tall.xbm"),
                            ("MagnifiedTiles", "layout_mtall.xbm"),
                            ("MirrorTiles", "layout_mirror_tall.xbm"),
                            ("Tabs", "layout_tabbed.xbm"),
                            ("Grid", "layout_grid.xbm"),
                            ("corner", "corner.xbm")]


myManageHook = composeAll . concat $
    [ [isDialog --> doFloat]
    , [isFullscreen --> doFullFloat]
    , [className =? c --> doFloat | c <- myCFloats]
    , [title =? t --> doFloat | t <- myTFloats]
    , [resource =? r --> doFloat | r <- myRFloats]
    , [matchApp x --> doIgnore | x <- myIgnores]
    , [matchApp x --> doSink | x <- mySinks]
    , [matchApp x --> doFullFloat | x <- myFullscreens]
    , [matchApp x --> doShift "1:term" | x <- my1Shifts]
    , [matchApp x --> doShift "2:www" | x <- my2Shifts]
    , [matchApp x --> doShift "3:dev" | x <- my3Shifts]
    , [matchApp x --> doShift "4:news" | x <- my4Shifts]
    , [matchApp x --> doShift "5:irc" | x <- my5Shifts]
    , [matchApp x --> doShift "6:music" | x <- my6Shifts]
    , [matchApp x --> doShift "7:sys" | x <- my7Shifts]
    , [matchApp x --> doShift "8:misc" | x <- my8Shifts]
    , [matchApp x --> doShift "9" | x <- my9Shifts]
    ]
    where
        matchApp x = className =? x <||> title =? x <||> resource =? x
        -- Hook used to push floating windows back into the layout
        -- This is used for gimp windwos to force them into a layout.
        doSink = ask >>= \w -> liftX (reveal w) >> doF (W.sink w)
        -- Float dialogs, Download windows and Save dialogs
        myCFloats = ["Sysinfo", "XMessage"]
        myTFloats = ["Downloads", "Save As..."]
        myRFloats = ["Dialog"]
        mySinks = ["gimp"]
        myFullscreens = ["vlc", "Wine", "rdesktop", "mplayer"]
        myIgnores = ["trayer"]
        -- Define default workspaces for some programs
        my1Shifts = []
        my2Shifts = ["Iceweasel", "dwb"]
        my3Shifts = ["Eclipse", "eclipse"]
        my4Shifts = ["newsbeuter", "mutt"]
        my5Shifts = ["weechat"]
        my6Shifts = ["ncmpcpp"]
        my7Shifts = ["htop", "slurm", "nethogs", "iotop"]
        my8Shifts = []
        my9Shifts = []


myUrgencyHook = withUrgencyHook dzenUrgencyHook { args = ["-y 1000"] }


myLayoutHook = 
     onWorkspace "2:www" browseLayout $ 
     onWorkspace "3:dev" devLayout $
     onWorkspace "7:sys" monitoringLayout $ 
     defaultLayout
     where
         tall = ResizableTall 1 (3/100) (3/5) []
         spaced = spacing 5
         tiles = renamed [Replace "Tiles"] $ spaced tall
         mirrorTiles = renamed [Replace "MirrorTiles"] $ Mirror tiles
         magnifiedTiles = renamed [Replace "MagnifiedTiles"] $ magnifiercz' 1.2 tiles
         grid = renamed [Replace "Grid"] $ spaced Grid
         tabs = renamed [Replace "Tabs"] simpleTabbed
         devLayout = smartBorders $ magnifiedTiles ||| tabs ||| Full ||| tiles ||| mirrorTiles ||| grid
         browseLayout = smartBorders $ tabs ||| Full ||| magnifiedTiles ||| tiles ||| mirrorTiles ||| grid
         monitoringLayout = smartBorders $ grid ||| tiles ||| tabs ||| Full ||| magnifiedTiles ||| mirrorTiles   
         defaultLayout = smartBorders $ tiles ||| tabs ||| Full ||| magnifiedTiles ||| mirrorTiles ||| grid   


myDzenPP h = defaultPP
    { ppCurrent = wrap ("^fg(#ffffff)^bg(#333333)^i(" ++ cornerIcon ++ ")^fg(orange)") "^bg()^fg()" 
    , ppVisible = wrap ("^fg(#ffffff)^i(" ++ cornerIcon ++ ")^fg(#ffffff)") "^fg()"
    , ppHidden = wrap ("^i(" ++ cornerIcon ++ ")^fg(#AAAAAA)") "^fg()"
    , ppHiddenNoWindows = \wsId -> if wsId `notElem` myWorkspaces then "" 
                                   else wrap ("^fg(#666666)^i(" ++ cornerIcon ++ ")") "^fg()" wsId 
    , ppUrgent = wrap "^fg(#ffffff)" "^fg()" 
    , ppSep = " | "
    , ppWsSep = " "
    , ppTitle = wrap (bwWrapper "-[ ") (bwWrapper " ]-") . dzenColor ("#c8e7a8") "" . shorten 30
    , ppLayout = dzenColor ("magenta") "" . wrap "^i(" ")" . lookupIcon
    , ppOutput = hPutStrLn h
    }
    where 
        bwWrapper = dzenColor ("#ffffff") ("#000000") 
        lookupIcon x = M.findWithDefault x x iconMap
        cornerIcon = lookupIcon "corner"


largeXPConfig = 
    defaultXPConfig { font                  = "xft: inconsolata-14"
                    , bgColor               = "#1B1D1E"
                    , fgColor               = "#A6E22E"
                    , bgHLight              = "#A6E22E"
                    , fgHLight              = "#1B1D1E"
                    , promptBorderWidth     = 0
                    , height                = 22
                    , historyFilter         = deleteConsecutive
                    }

-- Key mapping 
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((modMask,                    xK_p        ), runOrRaisePrompt largeXPConfig)
    , ((modMask .|. shiftMask,      xK_Return   ), spawn $ XMonad.terminal conf)
    , ((modMask .|. shiftMask,      xK_c        ), kill)
    -- Programs
    , ((0,                          xK_Print    ), spawn "scrot -e 'mv $f ~/Pictures/'")
    , ((modMask .|. shiftMask,      xK_i        ), spawn "firefox")
    , ((modMask,                    xK_i        ), spawn "dwb")
    , ((modMask .|. shiftMask,      xK_t        ), spawn "thunar")
    , ((modMask .|. shiftMask,      xK_f        ), spawn "urxvtc -e ranger")
    , ((modMask .|. shiftMask,      xK_v        ), spawn "gvim")
    , ((modMask,                    xK_v        ), spawn "urxvtc -e vim")
    -- Media Keys
    , ((0,                          0x1008ff12  ), spawn "amixer -q sset Master toggle")        -- XF86AudioMute
    , ((0,                          0x1008ff11  ), spawn "amixer -q sset Master 5%-")   -- XF86AudioLowerVolume
    , ((0,                          0x1008ff13  ), spawn "amixer -q sset Master 5%+")   -- XF86AudioRaiseVolume
    , ((0,                          0x1008ff14  ), spawn "ncmpcpp toggle")
    , ((0,                          0x1008ff17  ), spawn "ncmpcpp next")
    , ((0,                          0x1008ff16  ), spawn "ncmpcpp prev")
    , ((0,                          0x1008ff15  ), spawn "ncmpcpp stop")
    , ((modMask,                    xK_Page_Up  ), spawn "ncmpcpp volume +5")
    , ((modMask,                    xK_Page_Down), spawn "ncmpcpp volume -5")

    -- layouts
    , ((modMask,                    xK_space    ), sendMessage NextLayout)
    , ((modMask .|. shiftMask,      xK_space    ), setLayout $ XMonad.layoutHook conf)          -- reset layout on current desktop to default
    , ((modMask,                    xK_b        ), sendMessage ToggleStruts)
    , ((modMask,                    xK_n        ), refresh)
    , ((modMask,                    xK_Tab      ), windows W.focusDown)                         -- move focus to next window
    , ((modMask,                    xK_j        ), windows W.focusDown)
    , ((modMask,                    xK_k        ), windows W.focusUp  )
    , ((modMask .|. shiftMask,      xK_j        ), windows W.swapDown)                          -- swap the focused window with the next window
    , ((modMask .|. shiftMask,      xK_k        ), windows W.swapUp)                            -- swap the focused window with the previous window
    , ((modMask,                    xK_Return   ), windows W.swapMaster)
    , ((modMask,                    xK_t        ), withFocused $ windows . W.sink)              -- Push window back into tiling
    , ((modMask,                    xK_h        ), sendMessage Shrink)                          -- %! Shrink a master area
    , ((modMask,                    xK_l        ), sendMessage Expand)                          -- %! Expand a master area
    , ((modMask,                    xK_comma    ), sendMessage (IncMasterN 1))
    , ((modMask,                    xK_period   ), sendMessage (IncMasterN (-1)))
 
 
    -- workspaces
    , ((modMask .|. controlMask,   xK_Right     ), nextWS)
    , ((modMask .|. shiftMask,     xK_Right     ), shiftToNext)
    , ((modMask .|. controlMask,   xK_Left      ), prevWS)
    , ((modMask .|. shiftMask,     xK_Left      ), shiftToPrev)
 
    -- quit, or restart
    , ((modMask .|. shiftMask,      xK_s        ), spawn "sudo shutdown -h now")
    , ((modMask .|. shiftMask,      xK_q        ), io (exitWith ExitSuccess))
    , ((modMask,                    xK_q        ), spawn $ "killall conky dzen2 && " ++ userDir ++ ".cabal/bin/xmonad --recompile && " ++ userDir ++ ".cabal/bin/xmonad --restart")
    ]
    ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
 
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


main = do
    dzen <- spawnPipe myStatusBar
    conkyexample <- spawnPipe rightBar
    musicConky <- spawnPipe musicBar
    spawn "urxvtd &"
    spawn $ "sh " ++ userDir ++ ".xmonad/bin/autostart.sh"
    xmonad $ myUrgencyHook $ defaultConfig
        { manageHook = myManageHook
        , layoutHook = avoidStruts $ myLayoutHook 
        , workspaces =  myWorkspaces ++ (map show [9..10])
        , logHook = dynamicLogWithPP $ myDzenPP dzen 
        , focusFollowsMouse = True
        , keys = myKeys
        , modMask = mod4Mask
        , terminal = myTerminal
        , normalBorderColor = "#444444"
        , focusedBorderColor = "#ffffff"
        , borderWidth = 1
        }`additionalKeysP`
                [ ("M-b", sendMessage ToggleStruts), 
                  ("<XF86ScreenSaver>", spawn "slock") ]

