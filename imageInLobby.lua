Hooks:PostHook(ContractBoxGui, "create_contract_box","sozdaem", function(self)
	local job_id = managers.job:current_job_id()
	local job_data = managers.job:current_job_data()
	local folder = ""
	local preview = ""
	if job_data == nil or job_id == "chill_combat" or job_id == "chill" then 
		folder = "bro"
		preview = "safehouse_new"
	else
		folder = job_data.contract_visuals.preview_image.folder
		preview = job_data.contract_visuals.preview_image.id
	end
	if job_data ~= nil then
		if preview ~= nil then
			local background_image = self._contract_panel:bitmap({
				blend_mode = "add",
				layer = -999,
				texture = "guis/dlcs/" .. (folder or "bro") .. "/textures/pd2/crimenet/" .. preview,
				h = self._contract_panel:w()*0.5,
				w = self._contract_panel:w(),
				y = self._contract_panel:h()*(-0.3)
			})
		elseif job_data.icon ~= nil then
			local background_image = self._contract_panel:bitmap({
				blend_mode = "add",
				layer = -999,
				texture = job_data.icon,
				h = self._contract_panel:w()*0.5,
				w = self._contract_panel:w(),
				y = self._contract_panel:h()*(-0.3)
			})
		end
	end
end)