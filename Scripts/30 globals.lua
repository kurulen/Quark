Debug = false
if ReadGamePrefFromFile("Quark_DebugEnabled") == "true" then Debug = true end

-- how many ticks have occurred (cleared at MaxTicks)
TickSum = 1

-- the average time it takes for a frame to draw (in seconds)
FrameTime = 0.01

-- how often the game ticks
TickRate = 100

-- interval for amount of ticks
MaxTicks = 500

-- standard animation durations
-- used to keep the theme consistent
AnimDurations = {
        Short = FrameTime * 20,
        Medium = FrameTime * 50,
        Long = FrameTime * 80
}

-- off-screen distances for X and Y axes
MaxDistance = {Horz = 954, Vert = 580}

-- templating variables for theme information
ThemeInfo = {
        -- uncomment these on release!
        -- Release = "1",
        -- Codename = "Milestone 1, Charm",
        --
        -- use these for dev builds
        -- Release = "[dev]",
        -- Codename = "Strange",
        Release = "[dev]",
        Codename = "Strange",
        Author = "Hia Labs"
}

-- font sizes, for consistency
FontSizes = {
        Large = QuarkUnit(0.9).Vert,
        Medium = QuarkUnit(0.7).Vert,
        Small = QuarkUnit(0.5).Vert,
        XSmall = QuarkUnit(0.3).Vert
}
