-- 1. 최상위 GUI 생성 및 CoreGui 부착 (게임 재시작 전까지 유지)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "공지안"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 익스플로잇 환경이라면 CoreGui에, 아니라면 PlayerGui에 부착
local success, coreGui = pcall(function() return game:GetService("CoreGui") end)
ScreenGui.Parent = success and coreGui or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- 2. 메인 프레임 (배경 및 드래그 대상)
local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.4, -75) -- 화면 중앙 배치
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- 어두운 테마
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true -- PC 마우스 드래그 활성화 (레거시 기능이지만 익스플로잇 환경에서 직관적)
Frame.Parent = ScreenGui

-- 테두리 둥글게 처리
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

-- 3. 텍스트 라벨 (마스터가 원하는 문장 출력)
local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 0.6, 0)
TextLabel.Position = UDim2.new(0, 0, 0.2, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "암호화 이슈로 잠시 닫겠습니다 , 복구되면 바로 열겠습니다"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 18
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Parent = Frame

-- 4. X 닫기 버튼
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Parent = Frame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = CloseButton

-- 5. X 버튼 클릭 시 GUI 제거 이벤트
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
