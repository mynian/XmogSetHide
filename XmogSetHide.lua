local Addon, events = CreateFrame("Frame", "xmogsethide"), {};

local function hidesets(self)
	WardrobeCollectionFrameTab2:SetScript("OnEvent", nil)
	WardrobeCollectionFrameTab2:Hide()
end

local function showsets(self)
	WardrobeCollectionFrameTab2:SetScript("OnEvent", WardrobeCollectionFrameTab2_OnEvent)
	WardrobeCollectionFrameTab2:Show()
end

function events:TRANSMOGRIFY_OPEN(...)
	hidesets(self)
end

function events:TRANSMOGRIFY_CLOSE(...)
	showsets(self)
end

Addon:SetScript("OnEvent", function(self, event, ...)
 events[event](self, ...); 
end);

for k, v in pairs(events) do
 Addon:RegisterEvent(k);
end
