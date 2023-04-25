--module script

local draw = {}
function draw.line(line, partOne, partTwo)
	local startX, startY
	local endX, endY
	local size = workspace.CurrentCamera.ViewportSize

	if partOne:IsA('GuiObject') then
		startX, startY = partOne.AbsolutePosition.X, partOne.AbsolutePosition.Y
	elseif partOne:IsA('BasePart') then
		startX, startY = workspace.CurrentCamera:WorldToViewportPoint(partOne.Position).X, workspace.CurrentCamera:WorldToViewportPoint(partOne.Position).Y
	end

	if partTwo:IsA('GuiObject') then
		endX, endY = partTwo.AbsolutePosition.X, partTwo.AbsolutePosition.Y
	elseif partTwo:IsA('BasePart') then
		endX, endY = workspace.CurrentCamera:WorldToViewportPoint(partTwo.Position).X, workspace.CurrentCamera:WorldToViewportPoint(partTwo.Position).Y
	end

	local startVector = Vector2.new(startX, startY)
	local endVector = Vector2.new(endX, endY)
	local dist = (startVector - endVector).Magnitude
	line.AnchorPoint = Vector2.new(0.5, 0.5)
	line.Size = UDim2.new(0, dist, 0, 5)
	line.Position = UDim2.new(0, (startX + endX) / 2, 0, (startY + endY) / 2)
	line.Rotation = math.atan2(endY - startY, endX - startX) * (180 / math.pi)
end
return draw
