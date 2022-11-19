local library = {}
function library:CreateWindow(name)
	name = name or "Double Dose"
	local ScreenGui = Instance.new("ScreenGui")
	local MainGui = Instance.new("Frame")
	local GuiName = Instance.new("TextLabel")
	local allPages = Instance.new("Frame")
	local mainCorner = Instance.new("UICorner")
	local pagesFolder = Instance.new("Folder")
	local allTabs = Instance.new("Frame")
	local SideBar = Instance.new("Frame")
	local tabListing = Instance.new("UIListLayout")
	local sideCorner = Instance.new("UICorner")
	local coverCorner = Instance.new("Frame")

	local mainCorner_2 = Instance.new("UICorner")
	ScreenGui.Name = "BoondieSppon"
	ScreenGui.Parent = game.CoreGui
	if game.CoreGui:FindFirstChild("ScreenGui") then
		game.CoreGui:FindFirstChild("ScreenGui"):Destroy()
	end

	MainGui.Name = "MainGui"
	MainGui.Parent = ScreenGui
	MainGui.BackgroundColor3 = Color3.fromRGB(45, 48, 53)
	MainGui.Position = UDim2.new(0.35022223, 0, 0.282051295, 0)
	MainGui.Size = UDim2.new(0, 387, 0, 308)

	GuiName.Name = "GuiName"
	GuiName.Parent = MainGui
	GuiName.BackgroundColor3 = Color3.fromRGB(35, 38, 42)
	GuiName.BorderSizePixel = 0
	GuiName.Position = UDim2.new(0.0116279069, 0, 0, 0)
	GuiName.Size = UDim2.new(0, 382, 0, 36)
	GuiName.Font = Enum.Font.Gotham
	GuiName.Text = name
	GuiName.TextColor3 = Color3.fromRGB(255, 255, 255)
	GuiName.TextSize = 17.000
	GuiName.TextXAlignment = Enum.TextXAlignment.Left

	allPages.Name = "allPages"
	allPages.Parent = MainGui
	allPages.BackgroundColor3 = Color3.fromRGB(39, 42, 47)
	allPages.Position = UDim2.new(0.306201547, 0, 0.162987053, 0)
	allPages.Size = UDim2.new(0, 249, 0, 237)
	allPages.Visible = true

	mainCorner.CornerRadius = UDim.new(0, 3)
	mainCorner.Name = "mainCorner"
	mainCorner.Parent = allPages

	pagesFolder.Name = "pagesFolder"
	pagesFolder.Parent = allPages


	SideBar.Name = "SideBar"
	SideBar.Parent = MainGui
	SideBar.BackgroundColor3 = Color3.fromRGB(35, 38, 42)
	SideBar.BorderSizePixel = 0
	SideBar.Position = UDim2.new(-0.0025839794, 0, 0.116883114, 0)
	SideBar.Size = UDim2.new(0, 110, 0, 270)

	allTabs.Name = "allTabs"
	allTabs.Parent = SideBar
	allTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	allTabs.BackgroundTransparency = 1.000
	allTabs.Position = UDim2.new(0.0500000007, 0, 0.0299999993, 0)
	allTabs.Size = UDim2.new(0, 98, 0, 246)

	tabListing.Name = "tabListing"
	tabListing.Parent = allTabs
	tabListing.SortOrder = Enum.SortOrder.LayoutOrder
	tabListing.Padding = UDim.new(0, 2)

	coverCorner.Name = "coverCorner"
	coverCorner.Parent = SideBar
	coverCorner.BackgroundColor3 = Color3.fromRGB(35, 38, 42)
	coverCorner.BorderSizePixel = 0
	coverCorner.Position = UDim2.new(0.943925261, 0, 0, 0)
	coverCorner.Size = UDim2.new(0, 6, 0, 260)

	sideCorner.CornerRadius = UDim.new(0, 3)
	sideCorner.Name = "sideCorner"
	sideCorner.Parent = SideBar

	mainCorner_2.CornerRadius = UDim.new(0, 3)
	mainCorner_2.Name = "mainCorner"
	mainCorner_2.Parent = MainGui
	local TabHandler = {}
	function TabHandler:CreateTab(tabname)
		tabname = tabname or "New Tab"
		local newPage = Instance.new("ScrollingFrame")
		local elementsPadding = Instance.new("UIPadding")
		local elementsListing = Instance.new("UIListLayout")


		local tabButton = Instance.new("TextButton")
		local tabCorner = Instance.new("UICorner")

		newPage.Name = "newPage"
		newPage.Parent = pagesFolder
		newPage.Active = true
		newPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		newPage.BackgroundTransparency = 1.000
		newPage.Size = UDim2.new(1, 0, 1, 0)
		newPage.ScrollBarThickness = 5
		newPage.Visible = false

		elementsListing.Name = "elementsListing"
		elementsListing.Parent = newPage
		elementsListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
		elementsListing.SortOrder = Enum.SortOrder.LayoutOrder
		elementsListing.Padding = UDim.new(0, 5)

		tabButton.Name = "tabButton"
		tabButton.Parent = allTabs
		tabButton.BackgroundColor3 = Color3.fromRGB(141, 2, 255)
		tabButton.Size = UDim2.new(0, 99, 0, 25)
		tabButton.Font = Enum.Font.Gotham
		tabButton.Text = tabname
		tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		tabButton.TextSize = 14.000
		tabButton.MouseButton1Down:connect(function()
			for i,v in next, pagesFolder:GetChildren() do
				v.Visible = false 
			end 
			newPage.Visible = true
			for i,v in next, allTabs:GetChildren() do
				if v:IsA("TextButton") then
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(141,2,255) 
					}):Play()
				end
			end
			game.TweenService:Create(tabButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundColor3 = Color3.fromRGB(255, 109, 83)
			}):Play()
		end)

		tabCorner.CornerRadius = UDim.new(0, 3)
		tabCorner.Name = "tabCorner"
		tabCorner.Parent = tabButton
		local ElementHandler = {}
		function ElementHandler:CreateButton(bname,callback)
			bname = bname or "Button"
			callback = callback or function() end

			local TextButton = Instance.new("TextButton")
			local buttonCorner = Instance.new("UICorner")

			TextButton.Parent = newPage
			TextButton.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
			TextButton.Size = UDim2.new(0, 267, 0, 32)
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.Gotham
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			TextButton.Text = bname or "New Button"
			TextButton.MouseButton1Down:connect(function()
				pcall(callback)
			end)

			buttonCorner.CornerRadius = UDim.new(0, 3)
			buttonCorner.Name = "buttonCorner"
			buttonCorner.Parent = TextButton

			function ElementHandler:CreateToggle(Tname, value,callback)
				Tname = Tname or "New Toggle"
				value = value or false
				callback = callback or function() end
				local toggleButton = Instance.new("TextButton")
				local toggleButtonCover = Instance.new("UICorner")
				local toggle = Instance.new("Frame")
				local toggleCorner = Instance.new("UICorner")
				local toggleInfo = Instance.new("TextLabel")


				elementsPadding.Name = "elementsPadding"
				elementsPadding.Parent = newPage
				elementsPadding.PaddingRight = UDim.new(0, 5)
				elementsPadding.PaddingTop = UDim.new(0, 5)

				toggleButton.Name = "toggleButton"
				toggleButton.Parent = newPage
				toggleButton.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
				toggleButton.Position = UDim2.new(0.120901637, 0, 0.159482762, 0)
				toggleButton.Size = UDim2.new(0, 238, 0, 32)
				toggleButton.AutoButtonColor = false
				toggleButton.Font = Enum.Font.Gotham
				toggleButton.Text = ""
				toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				toggleButton.TextSize = 14.000
				toggleButton.MouseButton1Down:connect(function()
					pcall(callback)
					value = not value 
					callback(value)
					if value then 
						game.TweenService:Create(toggle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(255, 109, 83)
						}):Play()
						---Toggle On Up
					else
						game.TweenService:Create(toggle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(61, 67, 74)
						}):Play()
						--- Toggle Off
					end
				end)

				toggleButtonCover.CornerRadius = UDim.new(0, 3)
				toggleButtonCover.Name = "toggleButtonCover"
				toggleButtonCover.Parent = toggleButton

				toggle.Name = "toggle"
				toggle.Parent = toggleButton
				toggle.BackgroundColor3 = Color3.fromRGB(61, 67, 74)
				toggle.Position = UDim2.new(0.0240549836, 0, 0.15625, 0)
				toggle.Size = UDim2.new(0, 22, 0, 22)

				toggleCorner.CornerRadius = UDim.new(0, 888)
				toggleCorner.Name = "toggleCorner"
				toggleCorner.Parent = toggle

				toggleInfo.Name = "toggleInfo"
				toggleInfo.Parent = toggleButton
				toggleInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				toggleInfo.BackgroundTransparency = 1.000
				toggleInfo.Position = UDim2.new(0.130584195, 0, 0, 0)
				toggleInfo.Size = UDim2.new(0, 230, 0, 32)
				toggleInfo.Font = Enum.Font.Gotham
				toggleInfo.Text = Tname
				toggleInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
				toggleInfo.TextSize = 14.000
				toggleInfo.TextXAlignment = Enum.TextXAlignment.Left
			end
		end
		return ElementHandler
	end
	return TabHandler
end
--[[
local l = library:CreateWindow("Hack App")
local Tab1 = l:CreateTab("Hack Player 1")
local Tab2 = l:CreateTab("Puta")
Tab1:CreateButton("Button", function()
	print("hi")
end)
Tab1:CreateButton("Button", function()
	print("123")
end)
Tab2:CreateButton("Button 2")]]
