load(makeRequest("https://raw.githubusercontent.com/UnDecrypted/Berzerk-Hub/refs/heads/main/whitelist.lua", "GET").content)()

User = ""
Pass = ""

Logged = false
LUser = nil

CurTab = ""
Func = nil

AddHook("OnRender", "Berzerk", function(DeltaTime)
    if not Logged then
        local screenWidth = getScreenSize().x
        local screenHeight = getScreenSize().y
    
        local windowWidth = screenWidth * 1
        local windowHeight = screenHeight * 1
        local windowPosX = (screenWidth - windowWidth) / 2
        local windowPosY = (screenHeight - windowHeight) / 2
    
        ImGui.PushStyleVar(ImGui.StyleVar.FrameRounding, 10.0)
        ImGui.PushStyleVar(ImGui.StyleVar.WindowRounding, 12.0)
        ImGui.PushStyleVar(ImGui.StyleVar.ScrollbarSize, 20)
    
        ImGui.SetNextWindowPos(ImVec2(windowPosX + 100, windowPosY + 70), ImGui.Cond.Once)
        ImGui.SetNextWindowSize(ImVec2(windowWidth * 0.255, windowHeight * 0.355), ImGui.Cond.Always)
    
        ImGui.PushStyleColor(ImGui.Col.Text, 0xFFFFFF33)
    
        ImGui.Begin("Berzerk | Login", nil, ImGui.WindowFlags.NoResize)
        ImGui.PopStyleColor()
        ImGui.SetWindowFontScale(0.8)
    
        local uchanged, UserInput = ImGui.InputTextWithHint("User", "Username", User, 255)
    
        if uchanged then
            User = UserInput
        end
    
        ImGui.PopID()
        
        local pchanged, PassInput = ImGui.InputTextWithHint("Pass", "Password", Pass, 255)
    
        if pchanged then
            Pass = PassInput
        end
    
        ImGui.PopID()
    
        if ImGui.Button("Login") then
            for i, v in pairs(whitelist) do
                if v.user == User and v.pass == Pass then
                    Logged = true
                    LUser = v
                end
            end
        end
       
        ImGui.End()
    else
        local screenWidth = getScreenSize().x
        local screenHeight = getScreenSize().y
    
        local windowWidth = screenWidth * 1
        local windowHeight = screenHeight * 1
        local windowPosX = (screenWidth - windowWidth) / 2
        local windowPosY = (screenHeight - windowHeight) / 2
    
        ImGui.PushStyleVar(ImGui.StyleVar.FrameRounding, 10.0)
        ImGui.PushStyleVar(ImGui.StyleVar.WindowRounding, 12.0)
        ImGui.PushStyleVar(ImGui.StyleVar.ScrollbarSize, 20)
    
        ImGui.SetNextWindowPos(ImVec2(windowPosX + 100, windowPosY + 70), ImGui.Cond.Once)
        ImGui.SetNextWindowSize(ImVec2(windowWidth * 0.555, windowHeight * 0.555), ImGui.Cond.Always)
    
        ImGui.PushStyleColor(ImGui.Col.Text, 0xFFFFFF33)
    
        ImGui.Begin("Berzerk | Main | "..LUser.role, nil, ImGui.WindowFlags.NoResize)
        ImGui.PopStyleColor()
        ImGui.SetWindowFontScale(0.8)
        
        if ImGui.BeginTabBar("scripts") then
          for i, v in pairs(scripts) do
              if ImGui.BeginTabItem(v.name) then
                if CurTab ~= v.name then
                    doLog(v.link)
                    Func = load(load(makeRequest(v.link, "GET").content)())()
                    CurTab = v.name
                end
                if Func then
                    Func()
                end
                ImGui.EndTabItem()
              end
          end
        end
    end
end)
