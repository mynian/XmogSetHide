--Create a psuedo frame to register events and such
local Addon, events = CreateFrame("Frame", "xmogsethide"), {};

--Hide the Appearance tab function
local function hideapptab(self)
	CollectionsJournalTab5:SetScript("OnEvent", nil)
	CollectionsJournalTab5:Hide()
end

--Hide the sets tab function
local function hidesets(self)
	WardrobeCollectionFrameTab2:SetScript("OnEvent", nil)
	WardrobeCollectionFrameTab2:Hide()
end

--Show the sets tab function
local function showsets(self)
	WardrobeCollectionFrameTab2:SetScript("OnEvent", WardrobeCollectionFrameTab2_OnEvent)
	WardrobeCollectionFrameTab2:Show()
end

--Hide the sets when you open the xmog frame
function events:TRANSMOGRIFY_OPEN(...)
	hidesets(self)
end

--Show the sets when you close the xmog frame
function events:TRANSMOGRIFY_CLOSE(...)
	showsets(self)
end

--Hide the Appearance tab when the collections frame is opened
function events:ADDON_LOADED(...)
	if IsAddOnLoaded("Blizzard_Collections") then
		hideapptab(self)
	end
end

--Hook the scripts
Addon:SetScript("OnEvent", function(self, event, ...)
 events[event](self, ...); 
end);

for k, v in pairs(events) do
 Addon:RegisterEvent(k);
end
