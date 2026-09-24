local mainMod = "SUPER"

-- Optional per-user keybind overrides (managed by DMS). Loaded after default binds.
hl.bind("SUPER + return", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + Backspace", hl.dsp.window.close())

-- ============================================================
-- Focus Navigation
-- ============================================================

-- Columns
hl.bind(mainMod .. " + h", hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + l", hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + j", hl.dsp.layout("focus d"))
hl.bind(mainMod .. " + k", hl.dsp.layout("focus u"))

-- Workspaces
hl.bind(mainMod .. " + CTRL + j", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.focus({ workspace = "r-1" }))

-- === Numbered Workspaces ===
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = "9" }))

-- ============================================================
-- Move Columns
-- ============================================================

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.layout("swapcol r"))

-- ============================================================
-- Move to Workspace
-- ============================================================

hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ workspace = "e-1" }))

-- === Move to Numbered Workspaces ===
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = "1" }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = "2" }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = "3" }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = "4" }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = "5" }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = "6" }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = "7" }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = "8" }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = "9" }))
-- ============================================================
-- Column Management
-- ============================================================

hl.bind(mainMod .. " + bracketleft", hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. " + bracketright", hl.dsp.layout("consume_or_expel next"))
hl.bind(mainMod .. " + period", hl.dsp.layout("expel"))

-- ============================================================
-- Sizing
-- ============================================================

hl.bind(mainMod .. " + r", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + SHIFT + r", hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + minus", hl.dsp.layout("colresize -0.1"))
hl.bind(mainMod .. " + equal", hl.dsp.layout("colresize +0.1"))
hl.bind(mainMod .. " + c", hl.dsp.layout("center"))
