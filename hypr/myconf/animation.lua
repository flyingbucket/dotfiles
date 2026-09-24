-- 前半段 Alpha/位置几乎维持不变，到最后瞬间切出
hl.curve("holdOff", {
	type = "bezier",
	points = { { 0.0, 0.9 }, { 0.1, 1.0 } },
})

-- 极速切入，瞬间到位
hl.curve("fastIn", {
	type = "bezier",
	points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

-- 滚动布局平滑平移
hl.curve("smoothMove", {
	type = "bezier",
	points = { { 0.16, 1.0 }, { 0.3, 1.0 } },
})

-- 2. 动画节点配置
-- 进场窗口 (B)：使用 fastIn 曲线，加速进场填满视野
hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 2.5,
	bezier = "fastIn",
	style = "slide",
})

-- 离场窗口 (A)：使用 holdOff 曲线并拉长 speed，使其在移出 Viewport 的绝大部分时间内保持不透明
hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 4.5,
	bezier = "holdOff",
	style = "slide",
})

-- 滚动布局的核心：Column/Window 的物理平移
hl.animation({
	leaf = "windowsMove",
	enabled = true,
	speed = 4,
	bezier = "smoothMove",
})

-- 彻底关闭淡出透明度动画（或延迟淡出），避免出屏时直接变透明露出桌面
hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 20,
	bezier = "holdOff",
})

-- 焦点切换 (active <-> inactive opacity 渐变)
hl.animation({
	leaf = "fadeSwitch",
	enabled = true,
	speed = 2.0,
	bezier = "default",
})

hl.animation({
	leaf = "fadeDim",
	enabled = true,
	speed = 10,
	bezier = "linear",
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 3,
	bezier = "default",
	style = "slidevert",
})

hl.animation({
	leaf = "border",
	enabled = true,
	speed = 3,
	bezier = "default",
})
