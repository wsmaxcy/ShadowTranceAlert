local SHADOW_TRANCE_TEXTURE = "Interface\\Icons\\Spell_Shadow_Twilight" -- Texture for Shadow Trance

-- Create the addon frame
local f = CreateFrame("Frame", "ShadowTranceAlertFrame", UIParent)

-- Function to create a texture
local function CreateSideTexture(xOffset, mirrored)
    local texture = f:CreateTexture(nil, "OVERLAY")
    texture:SetTexture("Interface\\AddOns\\ShadowTranceAlert\\ShadowTranceAlert.tga") -- Custom TGA file
    texture:SetWidth(128) -- Width of the icon
    texture:SetHeight(256) -- Height of the icon
    texture:SetPoint("CENTER", UIParent, "CENTER", xOffset, 0) -- Offset on X-axis
    texture:SetAlpha(0) -- Start invisible

    -- Flip texture horizontally if mirrored
    if mirrored then
        texture:SetTexCoord(1, 0, 0, 1) -- Reverses the image horizontally
    end

    texture:Hide() -- Hidden initially
    return texture
end

-- Create textures for both sides of the character
local leftTexture = CreateSideTexture(-150, false) -- Left side, normal orientation
local rightTexture = CreateSideTexture(150, true)  -- Right side, flipped horizontally

-- Pulse Animation Variables
local pulseAlpha = 0
local pulseDirection = 0.01 -- Fade in speed

-- Function to check for Shadow Trance
local function CheckShadowTrance()
    local hasShadowTrance = false
    for i = 0, 31 do
        local buffTexture = GetPlayerBuffTexture(i)
        if buffTexture and buffTexture == SHADOW_TRANCE_TEXTURE then
            hasShadowTrance = true
            break
        end
    end

    -- Show or hide textures based on buff
    if hasShadowTrance then
        leftTexture:Show()
        rightTexture:Show()
    else
        leftTexture:Hide()
        rightTexture:Hide()
    end
end

-- OnUpdate script to create pulsing effect
f:SetScript("OnUpdate", function(self, elapsed)
    -- Update alpha for pulse
    pulseAlpha = pulseAlpha + pulseDirection

    -- Reverse direction at boundaries
    if pulseAlpha <= 0.3 then
        pulseDirection = 0.01 -- Fade in
    elseif pulseAlpha >= 0.8 then
        pulseDirection = -0.01 -- Fade out
    end

    -- Apply alpha to both textures
    if leftTexture:IsShown() and rightTexture:IsShown() then
        leftTexture:SetAlpha(pulseAlpha)
        rightTexture:SetAlpha(pulseAlpha)
    end
end)

-- Frame to monitor for PLAYER_AURAS_CHANGED
local auraFrame = CreateFrame("Frame")
auraFrame:RegisterEvent("PLAYER_AURAS_CHANGED")
auraFrame:SetScript("OnEvent", CheckShadowTrance)

-- Print confirmation in chat
DEFAULT_CHAT_FRAME:AddMessage("Shadow Trance Alert: Addon loaded and monitoring for Shadow Trance!", 1, 1, 0)
