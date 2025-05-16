gg.setVisible(false)
--[[
Chưa gọi start_Game()
]]

if not gg.TamPxShell or not gg.TamPxLoad then
	check_GameGuardian = gg.alert('Please Use Game Guardian Tam Px To Execute This Script !\nGame Guardian Link: Youtube Tam Px', 'Copy Link', 'Exit')
	if check_GameGuardian == 1 then
		gg.copyText('https://youtube.com/@tampxz')
		os.exit()
	else
	os.exit()
	end
end
function check_Connection(a)
	gg.toast('Check Internet Connection !')
	local ulr_Check = gg.TamPxLoad(a[1])
	if ulr_Check.encode then
		local b = {Jan = "01", Feb = "02", Mar = "03", Apr = "04", May = "05", Jun = "06", Jul = "07", Aug = "08", Sep = "09", Oct = "10", Nov = "11", Dec = "12"}
		local d, c, f = string.match(ulr_Check.headers.Date[1], "%a+, (%d+) (%a+) (%d+)")
		local e = b[c] or "00"
		return {
			state = true,
			time = {
				day = d,
				moth = e,
				year = f,
				date = d..'/'..e..'/'..f
			}
		}
	else
		return {
			state = false,
			time = {
			}
		}
	end
end
function count_DayExpire(currentDate, expireDate)
	local d1, m1, y1 = currentDate:match("(%d%d)/(%d%d)/(%d%d%d%d)")
	local d2, m2, y2 = expireDate:match("(%d%d)/(%d%d)/(%d%d%d%d)")
	return string.format("%d", math.floor((os.time{year = tonumber(y2), month = tonumber(m2), day = tonumber(d2)} - os.time{year = tonumber(y1), month = tonumber(m1), day = tonumber(d1)}) / (24 * 60 * 60)))
end
function page_Login(a)
	local get_InfoScripter = gg.TamPxLoad('https://raw.githubusercontent.com/Tampx/Update_Key/refs/heads/main/key_Script.lua').encode
	if get_InfoScripter then
		load(get_InfoScripter)()
	else
		gg.alert('Error !\n No Internet Connection !')
		gg.exit()
	end
	local title_Alert1 = translate('LOGIN PAGE', gg.getLocale())
	local content_Alert11 = translate('Please Login To Use Hack, If You Dont Have Login Code Click On Register Button', gg.getLocale())
	local content_Alert12 = translate('Since This Is A One Month Code, It Will Take A Little Time To Get The Code', gg.getLocale())
	local button_Alert11 = translate('Login', gg.getLocale())
	local button_Alert12 = translate('Guide', gg.getLocale())
	local button_Alert13 = translate('Register', gg.getLocale())
	local title_Alert2 = translate('User Guide', gg.getLocale())
	local content_Alert21 = translate('Once You Get To The Landing Page You Will See I Left A Line Of Code, What You Need To Do Now Is Copy It And Relaunch This Script And Click The Login Button, Then You Just Paste The Code That I Put On The Landing Page And Click The OK Button ', gg.getLocale())
	local button_Alert21 = translate('Return', gg.getLocale())
	::start_CheckLogin::
	local rememberlogin = io.open(gg.getData..'/lllwpoZvwLP6L9hyLxLh', "r")
	if rememberlogin then
		loadfile(gg.getData..'/lllwpoZvwLP6L9hyLxLh')()
		if ZvwLP5L9hyLxLh == ZvwLP6L9hyLxLh then
			if tonumber(count_DayExpire(a, ZvwLP4L6hyLxLh)) < 0 then
				gg.alert('Key Expired')
				os.remove(gg.getData..'/lllwpoZvwLP6L9hyLxLh')
				goto start_CheckLogin
			else
				return true
			end
		else
			os.remove(gg.getData..'/lllwpoZvwLP6L9hyLxLh')
			goto start_CheckLogin
		end
	else
		::beginLogin_Check::
		login_Check = gg.colorAlert(
		"<b><font color='#00FF00'>"..title_Alert1.."</font></b>",
		"<b><i><font color='#FFFF00'>"..content_Alert11.."</font></b></i><br>"..
		"<u><i><font color='#00BFFF'>"..content_Alert12.."</font></i></u>",
		button_Alert11,
		button_Alert12,
		button_Alert13
		)
		if login_Check == 0 then
			while true do
				if gg.isVisible(true) then
					gg.setVisible(false)
					goto start_CheckLogin
				end
			end
		elseif login_Check == 1 then
			while not login do
				login_Page = gg.prompt({'Paste Key:', 'Remember Login', 'Exit'}, {'_', true, false}, {'text', 'checkbox', 'checkbox'})
				if login_Page then
					if login_Page[3] then
						os.exit()
					else
						if login_Page[1] ~= 'enter key' then
							if loginInvoke({login_Page[1]}) then
								if login_Page[2] then
									local tt = io.open(gg.getData..'/lllwpoZvwLP6L9hyLxLh', "w")
									if tt then
										tt:write('ZviLP5L9hyixLp = "'..ZvwLP0L1hrLxLo..'"\n')
										tt:write('ZvwLP5L9hyLxLh = "'..ZvwLP6L9hyLxLh..'"\n')
										tt:write('ZvwLP4L6hyLxLh = "'..ZvwLP6L9hyLxLz..'"')
										tt:close()
									end
								end
								gg.toast('Login Simple Done !')
								login = true
								goto start_CheckLogin
							else
								gg.alert('Incorrect Key !')
								return false
							end
						end
					end
				else
					goto start_CheckLogin
				end
			end
		elseif login_Check == 2 then
			gg.colorAlert("<b><font color='#00FF00'>"..title_Alert2.."</font></b>", "<b><i><font color='#FF00A0'>"..content_Alert21.."</font></b></i>", button_Alert21)
			goto beginLogin_Check
		elseif login_Check == 3 then
			gg.gotoBrowser(ZvwLP6L9hyLxLi)
			os.exit()
		end
	end
end
function translate(text, target_lang)
	if type(text) ~= "string" or text == "" then
		return text
	end
	local function urlEncode(str)
		return str:gsub("([^%w])", function(c)
			return string.format("%%%02X", string.byte(c))
		end)
	end
	local headers = {['User-Agent'] = 'GoogleTranslate/6.3.0.RC06.277163268 Linux; U; Android 14; A201SO Build/64.2.E.2.140'}
	local url = string.format("https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=%s&dt=t&q=%s", target_lang, urlEncode(text))
	local response = gg.TamPxLoad(url, headers)
	if type(response) ~= "table" or not response.encode then
		return text
	end
	local translated = response.encode:match('"(.-)"')
	return translated or text
end
function Create_Table(size, value)
	local t = {}
	for i = 1, size do
		t[i] = value
	end
	return t
end

------------------------------------------
local start_CheckConnect = check_Connection({'https://github.com'})
if not start_CheckConnect.state then gg.alert('No Internet Connection !') os.exit() gg.exit() end
current_Time = start_CheckConnect.time.date
if page_Login(current_Time) then else os.exit(print('Please Login')) end
------------------------------------------
local Data_directory1 = "/data/user/0/com.dts.freefireth"
local folder_Next1 = "shared_prefs"
local folder_Next2 = "files"
local Files_Directory = Data_directory1 .. "/files/"
local Data_directory2 = "/storage/emulated/0/Android/data/com.dts.freefireth/files"
local next_Folder1 = 'contentcache'
local currentTimeRemaining = tonumber(count_DayExpire(current_Time, ZvwLP4L6hyLxLh))
if gg.isPackageInstalled('com.google.android.gms') then else gg.alert('Please Install Google Play Services and Try Again.\nHãy Kích Hoạt Dịch Vụ Google Play Rồi Thử Lại.') os.exit() end
local Get_Device_Name = gg.TamPxShell("getprop ro.product.marketname")
if tostring(Get_Device_Name) == '\n' then
	Get_Device_Name = gg.TamPxShell("getprop ro.product.device")
end
local Get_Brand = gg.TamPxShell("getprop ro.product.brand")
local Get_Model = gg.TamPxShell("getprop ro.product.model")
Device_Info = Get_Brand:gsub("%s+$", "") .. " " .. Get_Model:gsub("%s+$", "") .. " (" .. Get_Device_Name:gsub("%s+$", "") .. ")"
local Tab_Number_MenuLobby = Create_Table(12, 1)
local Tab_Number_MenuIngame = Create_Table(20, 1)
local int_Menu = 'login'
local check_FunctionLobby = Create_Table(8, 1)
local check_FunctionInGame = Create_Table(24, true)
local current_VersionScript = 1
local value_Sensitivity = 0
local value_CameraFov = 0
local value_CameraLetf = 0
local value_SpeedGame = 0
local value_ColorBody = 0
local fast_Medikit_mode = {
	{'Fast Medikit + Maxim -2s-', 'Fast Medikit Normal -3s-', 'Disable'},
	{'Fast Medikit + Maxim -2s-', 'Fast Medikit Normal -3s-'}
}
local scope_Aim_mode = {
	{'Aim Scope X 45°', 'Aim Scope Y 45°', 'Aim Scope All 45°', 'Aim Scope All 180°', 'Disable', },
	{ 'Aim Scope X 45°', 'Aim Scope Y 45°', 'Aim Scope All 45°', 'Aim Scope All 180°'}
}
local super_ColorBody = {
	{'White 🗨️', 'Red 🔴', 'Green 🍏', 'Blue 🔵', 'Yellow 🌕', 'Purple 🔮', 'Cyan 🚥', 'ColorMix 1🎭', 'ColorMix 2🎭', 'ColorMix 3🎭', ' ColorMix 4🎭', 'Disable'},
	{'White 🗨️', 'Red 🔴', 'Green 🍏', 'Blue 🔵', 'Yellow 🌕', 'Purple 🔮', 'Cyan 🚥', 'ColorMix 1🎭', 'ColorMix 2🎭', 'ColorMix 3🎭', ' ColorMix 4🎭'}
}
local tab_AddressAntenna1 = {}
local tab_AddressAntenna2 = {}
---------------------Color Body------------------------
function LoadColorValues()
	ColorAddress = getAddresses(Refinenumber(Searchvalue(1048576, 1, "h 00 00 00 00 1F 85 6B 3E 00 00 00 00", true), {"h 1F", 1, true}))
	gg.alert(#ColorAddress)
	allAddresses = {}
	AddressGreen = {}
	AddressBlue = {}
	AddressRed = {}
	AddressBackRed = {}
	for i, address in ipairs(ColorAddress) do
		AddressBlue[i] = address - 136
		AddressGreen[i] = address - 144
		AddressRed[i] = address - 152
		AddressBackRed[i] = address - 180
	end
	for i, address in ipairs(ColorAddress) do
		table.insert(allAddresses, address)
	end
	for i, address in ipairs(AddressBlue) do
		table.insert(allAddresses, address)
	end
	for i, address in ipairs(AddressGreen) do
		table.insert(allAddresses, address)
	end
	for i, address in ipairs(AddressRed) do
		table.insert(allAddresses, address)
	end
	for i, address in ipairs(AddressBackRed) do
		table.insert(allAddresses, address)
	end
	handleColorValues(allAddresses, 16, 1)
end
function handleColorValues(addresses, flags, mode)
	if mode == 1 then
		local values = {}
		for i, address in ipairs(addresses) do
			values[i] = {address = address, flags = flags}
		end
		originalValues = gg.getValues(values)
	elseif mode == 2 then
		if #originalValues > 0 then
			gg.setValues(originalValues)
		else
			gg.alert("Lỗi khi khôi phục giá trị !")
		end
	end
end
---------------------Custom Function------------------
function title_Menu(a)
	return 
	'┍━━━━━━►'..a..' ☃\n'..
	'┝╾▻📱: '..Device_Info..'\n'..
	'┝╾▻🎭: Premium Version🆙\n'..
	'┝╾▻⏳: '..current_Time..'➫'..ZvwLP4L6hyLxLh..'('..currentTimeRemaining + 1 ..'days)\n'..
	'┕━━━━━━━━━━━━━━━━━━━━━━━━━►'
end
function information_Script()
	t_infoget = gg.colorAlert(
	"<b><font color='#FFA000'>SCRIPT INFORMATION</font></b>",
	"<b><i><font color='#00FF00'>SCRIPT ✎</font></i></b><br>"..
	"<i><font color='#FF00FF'>Game Guardian: Tam Px Assistant</font></i><br>"..
	"<i><font color='#FF00FF'>Version: Premium Version</font></i><br>"..
	"<i><font color='#FF00FF'>Game: Free Fire</font></i><br>"..
	"<i><font color='#FF00FF'>Obb: 2019118071</font></i><br>"..
	"<b><i><font color='#1077FF'>USER ⛇</font></i></b><br>"..
	"<i><font color='#FF00FF'>Key: "..ZviLP5L9hyixLp.."</font></i><br>"..
	"<i><font color='#FF00FF'>Devices: "..Device_Info.."</font></i><br>"..
	"<i><font color='#FF00FF'>Login ID: "..ZvwLP5L9hyLxLh.."</font></i><br>"..
	"<i><font color='#FF00FF'>Expired: "..ZvwLP4L6hyLxLh.."</font> <font color='#00FF00'>("..currentTimeRemaining.."Days)</font> </i><br>"..
	"<b><i><font color='#FFFF00'>ADMIN ✆</font></i></b><br>"..
	"<i><font color='#FF00FF'>YouTube: Tam Px</font></i><br>"..
	"<i><font color='#FF00FF'>Telegram: @TamPxVip</font></i><br>"..
	"<b><i><font color='#00FFFF'>DONATE ⚝</font></i></b><br>"..
	"<u><i><font color='#00BFFF'>Momo: 0826909968 | Name: Tam Px</font></i></u><br>"..
	"<u><i><font color='#00BFFF'>Paypal: @TamPxVip</font></i></u><br>"..
	"<u><i><font color='#00BFFF'>Zalo Pay: 0826909968 | Name: Tam Px</font></i></u>",
	"Done")
	int_Menu = 'main'
	menu_Activity()
end

function TamPxScriptRun(addresses, a2, a3)
	local tt = {}
	if type(addresses) == 'table' then
		for i, address in ipairs(addresses) do
			tt[i] = {}
			tt[i].address = address
			tt[i].flags = a2
			tt[i].value = a3
		end
	elseif type(addresses) == 'number' then
		tt[1] = {}
		tt[1].address = addresses
		tt[1].flags = a2
		tt[1].value = a3
	else
		gg.alert('Oh giá trị của địa chỉ cần chỉnh sửa đang được khai báo với dạng "'..type(addresses)..'" không thể chỉnh sửa giá trị của địa chỉ này !!!')
		return
	end
	gg.setValues(tt)
end
function Create_Table(size, value)
	local t = {}
	for i = 1, size do
		t[i] = value
	end
	return t
end
function process_State(a)
	if a then
		gg.processResume()
	else
		gg.processPause()
	end
end
function ARMx32(...)
	local addr_list = gg.getRangesList('libc.so')
	local addr
	for _, v in ipairs(addr_list) do
		if v.type:sub(2, 2) == 'w' then
			addr = {address = v.start, flags = 4}
			break
		end
	end
	if not addr then gg.alert("Failed", "") return end
	local old = gg.getValues({addr})
	local result = ""
	for _, arm in ipairs({...}) do
		addr.value = '~A ' .. arm
		pcall(gg.setValues, {addr})
		local temp_result = gg.getValues({addr})[1].value & 0xFFFFFFFF
		temp_result = string.unpack('>I4', string.pack('<I4', temp_result))
		temp_result = string.format('%08X', temp_result)
		result = result .. temp_result
	end
	gg.setValues(old)
	return "h" .. result
end
function checkGameMemory()
	gg.sleep(500)
	gg.setProcess(gg.getTargetInfo().packageName)
	return tonumber(string.match(gg.getProcess()[0].process, "%[([%d%.]+)%sMB%]"))
end
function Remove_Data()
	gg.TamPxShell("su -c 'find " .. Data_directory1 .. " -maxdepth 1 -mindepth 1 -type d ! -name \"" .. folder_Next1 .. "\" ! -name \"".. folder_Next2 .."\" -exec rm -rf {} +'")
	gg.TamPxShell("su -c 'find " .. Files_Directory .. " -maxdepth 1 -mindepth 1 ! -name \"contentcache\" -exec rm -rf {} +'")
	gg.TamPxShell("su -c 'find " .. Data_directory2 .. " -maxdepth 1 -mindepth 1 ! -name ".. next_Folder1 .." -exec rm -rf {} +'")
	gg.toast('Done !')
end
function Check_Visible()
	if gg.isVisible(true) then
		gg.setVisible(false)
		gg.toast("!–!")
	end
end 
function RestoreValue(revert)
	if revert ~= nil then
		gg.setValues(revert)
	else
		gg.alert("Lỗi khi khôi phục giá trị !")
	end
end
function Searchvalue(a1, a2, a3, a5)
	gg.clearResults()
	Check_Visible()
	gg.sleep(50)
	gg.setRanges(a1)
	gg.clearResults()
	gg.searchNumber(a3, a2)
	a4 = gg.getResults(gg.getResultsCount())
	if not a5 then else
		gg.clearResults()
	end
	return a4
end

function ReadWrite(a)
	Check_Visible()
	gg.loadResults(a[1])
	local results = gg.getResults(gg.getResultsCount())
	gg.editAll(a[2], a[3])
	gg.clearResults()
	return results
end
function Refinenumber(Items, ReValue)
	Check_Visible()
	gg.loadResults(Items)
	gg.refineNumber(ReValue[1], ReValue[2])
	Tablet = gg.getResults(gg.getResultsCount())
	if ReValue[3] then
		gg.clearResults()
	end
	return Tablet
end
function getAddresses(a)
	local addresses = {}
	for i, v in ipairs(a) do
		table.insert(addresses, v.address)
	end
	return addresses
end
function fieldsSearch(class_Name, Bit, fields_Offset, value_rf, Type)
	gg.setRanges(-2080892)
	local Metadata = gg.getRangesList("global-metadata.dat")
	if Metadata == nil then
		Region_Start = Metadata[1]["start"] and gg.TYPE_DWORD
		Region_End = Metadata[1]["end"]
	else
		Region_Start = 0
		Region_End = -1
	end
	gg.searchNumber(":" .. string.char(0) .. class_Name .. string.char(0), gg.TYPE_BYTE)
	local Letters = gg.getResults(2)
	local ClassFirstLetter = {Letters[2]}
	gg.clearResults(true)
	gg.loadResults(ClassFirstLetter)
	gg.searchPointer(0)
	local RegionsToSearch = {4, -2080896, 32}
	local ClassName = {}
	for _, region in ipairs(RegionsToSearch) do
		gg.setRanges(region)
		gg.loadResults(ClassFirstLetter)
		gg.searchPointer(0)
		ClassName = gg.getResults(gg.getResultsCount())
		gg.clearResults()
		if #ClassName > 0 then
			break
		end
	end
	if #ClassName == 0 then
	return {
		states = false,
		return_Data = 'Class Name Not Found: '.. class_Name
	}
	end
	gg.setRanges(32)
	local Resultss = {}
	for i, v in ipairs(ClassName) do
		local ClassPointer = {}
		local subtractOffset = (Bit == "64") and 0x10 or 0x8
		table.insert(ClassPointer, {address = v.address - subtractOffset, flags = gg.TYPE_DWORD})
		ClassPointer = gg.getValues(ClassPointer)
		gg.clearResults()
		gg.loadResults(ClassPointer)
		gg.searchPointer(0)
		Resultss = gg.getResults(gg.getResultsCount())
		if #Resultss > 0 then
			break
		end
	end
	if #Resultss == 0 then 
		return {
		states = false,
		return_Data = 'Fields Offset Not Found: '.. fields_Offset
		}
	end
	gg.addListItems(Resultss)
	gg.clearResults()
	local getFinalResult = {}
	for j, instance in ipairs(Resultss) do
		table.insert(getFinalResult, {address = instance.address + fields_Offset, flags = Type})
	end
	getFinalResult = gg.getValues(getFinalResult)
	if value_rf	~= nil then
		gg.loadResults(getFinalResult)
		refine_Value = gg.refineNumber(value_rf, Type)
		get_Value = gg.getResults(gg.getResultsCount())
		gg.clearResults()
		gg.clearList()
		return {
			states = true,
			return_Data = get_Value
		}
	else
		gg.clearResults()
		gg.clearList()
		return {
			states = true,
			return_Data = getFinalResult
		}
	end
end
---------------------------------------------------
function check_Update()
	gg.toast('Receiving version information please wait...')
	local get_UpdateInfo = gg.TamPxLoad('https://raw.githubusercontent.com/Tampx/Script_Free5/refs/heads/main/Update_Config.json')
	if not get_UpdateInfo.encode then gg.alert('No Internet Connection !') return end 
	local current_VersionInfo = load(get_UpdateInfo.encode)
	local results_Received = current_VersionInfo().current_version
	local results_Received1 = current_VersionInfo().content_Config
	local found_Version= results_Received.new_Version
	local old_Version = current_VersionScript
	local update_Get_Link = results_Received.update_Link
	local update_Message = {results_Received1.title_Config, results_Received1.content_ConfigVi, results_Received1.change_LogVi, results_Received1.change_LogContentVi, results_Received1.content_ConfigEn, results_Received1.change_LogEn, results_Received1.change_LogContentEn}
	local update_Script_Content = current_VersionInfo().new_Script
	local folder_NewScipt = gg.getFile():match("(.+)/")
	local file_NewScipt = folder_NewScipt..'/'..current_VersionInfo().content_Config.name_Update_Scipt
	if found_Version ~= old_Version then
		update_State = gg.colorAlert(
		"<b><font color='#FF0000'>"..update_Message[1].."</font></b>",
		"<b><i><font color='#00FF00'>"..update_Message[2].."</font></i></b><br>"..
		"--<b><i><font color='#00BFFF'>"..update_Message[3].."</font></i></b><br>"..
		"<u><i><font color='#00BFFF'>"..update_Message[4].."</font></i><br></u><br>"..
		"<b><i><font color='#FFFF00'>"..update_Message[5].."</font></i></b><br>"..
		"--<b><i><font color='#00BFFF'>"..update_Message[6].."</font></i></b><br>"..
		"<u><i><font color='#00BFFF'>"..update_Message[7].."</font></i></u><br>",
		"Update Now", 
		"YouTube",
		"Return")
		if update_State == 1 then
			local update_Script_Content = current_VersionInfo().new_Script
			local tt = io.open(file_NewScipt, "w")
			if tt then
				tt:write(update_Script_Content)
				tt:close()
				gg.toast('Update Done !')
				while not check_Click_Update do
					if gg.colorAlert(
					"<b><font color='#00FF00'>UPDATE DONE !</font></b>",
					'<b><font color="#FF80FF">Script Lưu Tại:</font></b><br>'..folder_NewScipt..'/Script v'..results_Received.new_Version..' '..results_Received.script_ForGame..' ('..results_Received.script_GameVer..').lua<br><br>'..
					'<b><font color="#FF80FF">Script Saved In:</font></b><br>'..folder_NewScipt..'/Script v'..results_Received.new_Version..' '..results_Received.script_ForGame..' ('..results_Received.script_GameVer..').lua',
					 'OKK') ~= 0 then check_Click_Update = true end
				end
				os.rename(file_NewScipt, folder_NewScipt..'/Script v'..results_Received.new_Version..' '..results_Received.script_ForGame..' ('..results_Received.script_GameVer..').lua')
			else
				gg.alert("Failed to update the script.")
			end
		elseif update_State == 2 then
			if results_Received.upload_Status then
				browser_State = gg.intent(update_Get_Link)
				gg.copyText(update_Get_Link)
			else
				gg.alert('Admin Not Completed Yet Please Wait...')
			end
		elseif update_State == 3 then
			return
		end
	else
		gg.toast('Không Có Bản Cập Nhật Mới Nào !\nNo New Updates Available !')
	end
end
function scope_ModeLoad()
	select_Mode_Scp = int_ScpMode and 1 or 2
	repeat
		t_modeScope = gg.choice(scope_Aim_mode[select_Mode_Scp], t_modeScope_State or 0, title_Menu('Menu Scope'))
		if t_modeScope ~= nil then
			int_ScpMode = t_modeScope ~= 5
			t_modeScope_State = t_modeScope
			aim_ScopeMode = scope_Aim_mode[select_Mode_Scp][t_modeScope]
			if t_modeScope == 5 then
				check_FunctionInGame[9] = true
				menu_InGameSelect_state[9] = false
			end
			feature_AimScope(t_modeScope)
		end
	until t_modeScope
end
function Medikit_ModeLoad()
	select_Mode_Medkit = int_Mekit_Mode and 1 or 2
	repeat
		t_modeMedikit = gg.choice(fast_Medikit_mode[select_Mode_Medkit], t_fast_Medikit_mode or 0, title_Menu('Menu Medikit'))
		if t_modeMedikit ~= nil then
			int_Mekit_Mode = t_modeMedikit ~= 3
			t_fast_Medikit_mode = t_modeMedikit
			medikit_Mode = fast_Medikit_mode[select_Mode_Medkit][t_modeMedikit]
			if t_modeMedikit == 3 then
				check_FunctionInGame[20] = true
				menu_InGameSelect_state[20] = false
			end
			feature_FastMedikit(t_modeMedikit)
		end
	until t_modeMedikit
end
function color_Body_Seclect()
	select_Mode_Colors = int_Color_Mode and 1 or 2
	repeat
		color_Selecti = gg.choice(super_ColorBody[select_Mode_Colors], t_super_ColorBody or 0, title_Menu('Menu Color'))
		if color_Selecti ~= nil then
			int_Color_Mode = color_Selecti ~= 12
			t_super_ColorBody = color_Selecti
			color_Mode_a = super_ColorBody[select_Mode_Colors][color_Selecti]
			if color_Selecti == 12 then
				check_FunctionInGame[5] = true
				menu_InGameSelect_state[5] = false
			end
			feature_colorBody(color_Selecti)
		end
	until color_Selecti
end
function menu_Select_Lobby()
	menu_SeclectLogin = gg.multiChoice({
		'Antenna',
		'Aim Awm',
		'Camera Left',
		'Location Sniper',
		'Location Sniper Ammo',
		'Aim Head',
		'Back'
	}, state_menu_SeclectLogin or nil, title_Menu('LOBBY'))
	if menu_SeclectLogin then
		state_menu_SeclectLogin = menu_SeclectLogin
		if menu_SeclectLogin[1] then
			antenna_Enable = true
		else
			antenna_Enable = false
		end
		if menu_SeclectLogin[2] then
			aimAwm_Enable = true 
		else
			aimAwm_Enable = false 
		end
		if menu_SeclectLogin[3] then
			cameraLeft_Enable = true
		else
			cameraLeft_Enable = false
		end
		if menu_SeclectLogin[4] then
			localtionSniper_Enable = true 
		else
			localtionSniper_Enable = false 
		end
		if menu_SeclectLogin[5] then
			localtionSniperAmmo_Enable = true
		else
			localtionSniperAmmo_Enable = false
		end
		if menu_SeclectLogin[6] then
			heashothips_Enable = true
		else
			heashothips_Enable = false
		end
		if menu_SeclectLogin[7] then
			state_menu_SeclectLogin[7] = false
			int_Menu = 'login'
			menu_Login()
		end
	end
end
function menu_Login()
	t_open_ = gg.choice({
		'Open Menu Lobby',
		'Open Game',
	}, 0, title_Menu('Script By Tam Px'))
	if t_open_ == 1 then
		int_Menu = 'seclectlobby'
		menu_Select_Lobby()
	elseif t_open_ == 2 then
		--start_Game()
		int_Menu = 'main'
		menu_Activity()
	end
end
function menu_Activity()
	menu_ActivitySelect = gg.choice({
		'Menu Lobby',
		'Menu In Game',
		'Menu Safe',
		'Menu Other',
		'Information',
		'Check For Update',
	}, Statemenu_ActivitySelect or 0, title_Menu('Main Menu'))
	if menu_ActivitySelect == 1 then
		int_Menu = 'lobby'
		menu_Lobby()
	elseif menu_ActivitySelect == 2 then
		int_Menu = 'ingame'
		menuImGame()
	elseif menu_ActivitySelect == 3 then
		int_Menu = 'safe'
		menuSafe()
	elseif menu_ActivitySelect == 4 then
		int_Menu = 'memory'
		menuMemory()
	elseif menu_ActivitySelect == 5 then
		int_Menu = 'information'
		information_Script()
	elseif menu_ActivitySelect == 6 then
		check_Update()
	end
end

function menu_Lobby()
	menu_LobbySelect = gg.multiChoice({
		'Antenna '..(tostring(antenna_Enable and '🗼' or '!-Unusable-!')),
		'Aim Head 100% '..(tostring(heashothips_Enable and '💀' or '!-Unusable-!')),
		'White Body',
		'Black Body',
		'Black + White',
		'Change Scope',
		'Location Sniper '..(tostring(localtionSniper_Enable and '' or '!-Unusable-!')),
		'Location Ammo Sniper '..(tostring(localtionSniperAmmo_Enable and '' or '!-Unusable-!')),
		'Back',
	}, menu_LobbySelect_State or nil, title_Menu('Menu Lobby'))
	if menu_LobbySelect then
		menu_LobbySelect_State = menu_LobbySelect
		if menu_LobbySelect[1] then
			if check_FunctionLobby[1] == 1 then
				if antenna_Enable then
					feature_Antenna(true)
					check_FunctionLobby[1] = 2
				else
					gg.toast('Error !')
					menu_LobbySelect_State[1] = false
				end
			end
		else
			if check_FunctionLobby[1] == 2 then
				feature_Antenna(false)
				check_FunctionLobby[1] = 1
			end
		end
		--
		if menu_LobbySelect[2] then
			if check_FunctionLobby[2] == 1 then
				if heashothips_Enable then
					feature_Aimhead(true)
					check_FunctionLobby[2] = 2
				else
					gg.toast('Error !')
					menu_LobbySelect_State[2] = false
				end
			end
		else
			if check_FunctionLobby[2] == 2 then
				feature_Aimhead(false)
				check_FunctionLobby[2] = 1
			end
		end
		--
		if menu_LobbySelect[3] then
			if check_FunctionLobby[3] == 1 then
				feature_White(true)
				check_FunctionLobby[3] = 2
			end
		else
			if check_FunctionLobby[3] == 2 then
				feature_White(false)
				check_FunctionLobby[3] = 1
			end
		end
		--
		if menu_LobbySelect[4] then
			if check_FunctionLobby[4] == 1 then
				feature_Black(true)
				check_FunctionLobby[4] = 2
			end
		else
			if check_FunctionLobby[4] == 2 then
				feature_Black(false)
				check_FunctionLobby[4] = 1
			end
		end
		--
		if menu_LobbySelect[5] then
			if check_FunctionLobby[5] == 1 then
				feature_WhiteBlack(true)
				check_FunctionLobby[5] = 2
			end
		else
			if check_FunctionLobby[5] == 2 then
				feature_WhiteBlack(false)
				check_FunctionLobby[5] = 1
			end
		end
		--
		if menu_LobbySelect[6] then
			if check_FunctionLobby[6] == 1 then
				feature_ChangeScope(true)
				check_FunctionLobby[6] = 2
			end
		else
			if check_FunctionLobby[6] == 2 then
				feature_ChangeScope(false)
				check_FunctionLobby[6] = 1
			end
		end
		--
		if menu_LobbySelect[7] then
			if check_FunctionLobby[7] == 1 then
				if localtionSniper_Enable then
					feature_LoactionSniper(true)
					check_FunctionLobby[7] = 2
				else
					menu_LobbySelect_State[7] = false
					gg.toast('Error !')
				end
			end
		else
			if check_FunctionLobby[7] == 2 then
				feature_LoactionSniper(false)
				check_FunctionLobby[7] = 1
			end
		end
		--
		if menu_LobbySelect[8] then
			if check_FunctionLobby[8] == 1 then
				if localtionSniperAmmo_Enable then
					feature_LocationAmmo(true)
					check_FunctionLobby[8] = 2
				else
					menu_LobbySelect_State[8] = false
					gg.toast('Error !')
				end
			end
		else
			if check_FunctionLobby[8] == 2 then
				feature_LocationAmmo(false)
				check_FunctionLobby[8] = 1
			end
		end
		--
		if menu_LobbySelect[9] then
			menu_LobbySelect_State[9] = false
			int_Menu = 'main'
			menu_Activity()
		end
	end
end
function menuImGame()
	menu_InGameSelect = gg.prompt({
		title_Menu('Menu In Game')..
		'\nSensitivity: [0;200]',
		'Camera Fov: [0;150]',
		'Camera Left: '..(tostring(cameraLeft_Enable and '' or '!-Unusable-!'))..'[0;20]',
		'Speed Game: [0;5]',
		'Color Body Edit ('.. (color_Mode_a or 'Normal')..') 50% Work',
		'Aim Fov 180°',
		'Aimbot Cross Awm',
		'Aim Scope Sniper'..(tostring(aimAwm_Enable and '' or ' !-Unusable-!')),
		'Aim Scope ('.. (aim_ScopeMode or 'Normal 10')..')',
		'Aim Semi',
		'Aim Lock',
		'Scope Zoom 15x',
		'Speed Run Joystick',
		'Jump Height',
		'No Delay Fire',
		'No Recoil',
		'No Parachute',
		'Fast Reload',
		'Fast Revive',
		'Fast Medikit ('.. (medikit_Mode or 'Normal')..')',
		'Player Zombie',
		'Through Character',
		'Back',
	}, menu_InGameSelect_state or nil, {
		'number',
		'number',
		'number',
		'number',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
		'checkbox',
	})
	if menu_InGameSelect then
		menu_InGameSelect_state = menu_InGameSelect
		if tonumber(menu_InGameSelect[1]) ~= value_Sensitivity then
			value_Sensitivity = tonumber(menu_InGameSelect[1])
			feature_Sensi(value_Sensitivity)
		end
		if tonumber(menu_InGameSelect[2]) ~= value_CameraFov then
			value_CameraFov = tonumber(menu_InGameSelect[2])
			feature_CamFov(value_CameraFov)
		end
		if tonumber(menu_InGameSelect[3]) ~= value_CameraLetf then
			value_CameraLetf = tonumber(menu_InGameSelect[3])
			if cameraLeft_Enable then
				feature_CamLetf(value_CameraLetf)
			else
				gg.toast('Error !')
			end
		end
		if tonumber(menu_InGameSelect[4]) ~= value_SpeedGame then
			value_SpeedGame = tonumber(menu_InGameSelect[4])
			feature_Speed(value_SpeedGame)
		end
		--
		if menu_InGameSelect[5] then
			if check_FunctionInGame[5] then
				color_Body_Seclect()
				check_FunctionInGame[5] = false
			end
		else
			if not check_FunctionInGame[5] then
				menu_InGameSelect_state[5] = true
				color_Body_Seclect()
			end
		end
		--
		if menu_InGameSelect[6] then
			if check_FunctionInGame[6] then
				feature_AimFov(true)
				check_FunctionInGame[6] = not check_FunctionInGame[6]
			end
		else
			if not check_FunctionInGame[6] then
				feature_AimFov(false)
				check_FunctionInGame[6] = not check_FunctionInGame[6]
			end
		end
		--
		if menu_InGameSelect[7] then
			if check_FunctionInGame[7] then
				feature_Aimbotsniper(true)
				check_FunctionInGame[7] = not check_FunctionInGame[7]
			end
		else
			if not check_FunctionInGame[7] then
				feature_Aimbotsniper(false)
				check_FunctionInGame[7] = not check_FunctionInGame[7]
			end
		end
		--
		if menu_InGameSelect[8] then
			if check_FunctionInGame[8] then
				if aimAwm_Enable then
					feature_AimSniper(true)
				else
					gg.toast('Error !')
				end
				check_FunctionInGame[8] = not check_FunctionInGame[8]
			end
		else
			if not check_FunctionInGame[8] then
				feature_AimSniper(false)
				check_FunctionInGame[8] = not check_FunctionInGame[8]
			end
		end
		--
		if menu_InGameSelect[9] then
			if check_FunctionInGame[9] then
				scope_ModeLoad()
				check_FunctionInGame[9] = false
			end
		else
			if not check_FunctionInGame[9] then
				menu_InGameSelect_state[9] = true
				scope_ModeLoad()
			end
		end
		--
		if menu_InGameSelect[10] then
			if check_FunctionInGame[10] then
				feature_AimSemi(true)
				check_FunctionInGame[10] = not check_FunctionInGame[10]
			end
		else
			if not check_FunctionInGame[10] then
				feature_AimSemi(false)
				check_FunctionInGame[10] = not check_FunctionInGame[10]
			end
		end
		--
		if menu_InGameSelect[11] then
			if check_FunctionInGame[11] then
				feature_AimLock(true)
				check_FunctionInGame[11] = not check_FunctionInGame[11]
			end
		else
			if not check_FunctionInGame[11] then
				feature_AimLock(false)
				check_FunctionInGame[11] = not check_FunctionInGame[11]
			end
		end
		--
		if menu_InGameSelect[12] then
			if check_FunctionInGame[12] then
				feature_SuperZoom(true)
				check_FunctionInGame[12] = not check_FunctionInGame[12]
			end
		else
			if not check_FunctionInGame[12] then
				feature_SuperZoom(false)
				check_FunctionInGame[12] = not check_FunctionInGame[12]
			end
		end
		--
		if menu_InGameSelect[13] then
			if check_FunctionInGame[13] then
				feature_SpeedRun(true)
				check_FunctionInGame[13] = not check_FunctionInGame[13]
			end
		else
			if not check_FunctionInGame[13] then
				feature_SpeedRun(false)
				check_FunctionInGame[13] = not check_FunctionInGame[13]
			end
		end
		--
		if menu_InGameSelect[14] then
			if check_FunctionInGame[14] then
				feature_JumpHeight(true)
				check_FunctionInGame[14] = not check_FunctionInGame[14]
			end
		else
			if not check_FunctionInGame[14] then
				feature_JumpHeight(false)
				check_FunctionInGame[14] = not check_FunctionInGame[14]
			end
		end
		--
		if menu_InGameSelect[15] then
			if check_FunctionInGame[15] then
				feature_DelayFire(true)
				check_FunctionInGame[15] = not check_FunctionInGame[15]
			end
		else
			if not check_FunctionInGame[15] then
				feature_DelayFire(false)
				check_FunctionInGame[15] = not check_FunctionInGame[15]
			end
		end
		--
		if menu_InGameSelect[16] then
			if check_FunctionInGame[16] then
				feature_NoRecoil(true)
				check_FunctionInGame[16] = not check_FunctionInGame[16]
			end
		else
			if not check_FunctionInGame[16] then
				feature_NoRecoil(false)
				check_FunctionInGame[16] = not check_FunctionInGame[16]
			end
		end
		--
		if menu_InGameSelect[17] then
			if check_FunctionInGame[17] then
				feature_NoParachute(true)
				check_FunctionInGame[17] = not check_FunctionInGame[17]
			end
		else
			if not check_FunctionInGame[17] then
				feature_NoParachute(false)
				check_FunctionInGame[17] = not check_FunctionInGame[17]
			end
		end
		--
		if menu_InGameSelect[18] then
			if check_FunctionInGame[18] then
				feature_FastReload(true)
				check_FunctionInGame[18] = not check_FunctionInGame[18]
			end
		else
			if not check_FunctionInGame[18] then
				feature_FastReload(false)
				check_FunctionInGame[18] = not check_FunctionInGame[18]
			end
		end
		--
		if menu_InGameSelect[19] then
			if check_FunctionInGame[19] then
				feature_FastRevive(true)
				check_FunctionInGame[19] = not check_FunctionInGame[19]
			end
		else
			if not check_FunctionInGame[19] then
				feature_FastRevive(false)
				check_FunctionInGame[19] = not check_FunctionInGame[19]
			end
		end
		--
		if menu_InGameSelect[20] then
			if check_FunctionInGame[20] then
				check_FunctionInGame[20] = not check_FunctionInGame[20]
				Medikit_ModeLoad()
			end
		else
			if not check_FunctionInGame[20] then
				menu_InGameSelect_state[20] = true
				Medikit_ModeLoad()
			end
		end
		--
		if menu_InGameSelect[21] then
			if check_FunctionInGame[21] then
				feature_PlayerZombie(true)
				check_FunctionInGame[21] = not check_FunctionInGame[21]
			end
		else
			if not check_FunctionInGame[21] then
				feature_PlayerZombie(false)
				check_FunctionInGame[21] = not check_FunctionInGame[21]
			end
		end
		--
		if menu_InGameSelect[22] then
			if check_FunctionInGame[22] then
				feature_ThroughCharacter(true)
				check_FunctionInGame[22] = not check_FunctionInGame[22]
			end
		else
			if not check_FunctionInGame[22] then
				feature_ThroughCharacter(false)
				check_FunctionInGame[22] = not check_FunctionInGame[22]
			end
		end
		--
		if menu_InGameSelect[23] then
			menu_InGameSelect_state[23] = false
			int_Menu = 'main'
			menu_Activity()
		end
	end
end 
function menuSafe()
	menu_SafeSelect = gg.multiChoice({
		'Antenna',
		'Aim Semi',
		'Aim Fov',
		'Aim Scope',
		'Aim Lock',
		'No Recoil',
		'No Delay',
		'No Reload',
		'0000',
		'0000',
		'0000',
		'0000',
		'0000',
		'0000',
		'0000',
		'0000',
	}, menu_InGameSelect_state or nil, title_Menu('Menu Safe'))
end
function menuMemory()
	menu_MemorySelect = gg.choice({
		'Set Delay Menu',
		'Remove Game Data',
		'Remove Data + Out Game',
		'Exit Game Guardian',
		'Exit Script',
		'Back',
	}, 0, title_Menu('Menu Other'))
	if menu_MemorySelect == 0 then
	elseif menu_MemorySelect == 1 then
		t_timedelay = gg.prompt({
			'Set Time: [0;2500]'
		}, (t_timedelay_Value or {100}), {'number'})
		if t_timedelay then
			t_timedelay_Value = t_timedelay
			time_delay = t_timedelay[1]
			gg.toast('set time '..t_timedelay[1]..'ms')
		end
	elseif menu_MemorySelect == 2 then
		Remove_Data()
	elseif menu_MemorySelect == 3 then
		Remove_Data()
		gg.TamPxShell("su -c 'am force-stop com.dts.freefireth'")
		os.exit()
	elseif menu_MemorySelect == 4 then
		gg.exit()
	elseif menu_MemorySelect == 5 then
		os.exit()
	elseif menu_MemorySelect == 6 then
		int_Menu = 'main'
		menu_Activity()
	end
end
function feature_Aimbotsniper(a)
	if a then
		for i = 1, #get_AddressSniper.return_Data do
			get_AddressSniper.return_Data[i].value = 0
		end
	else
		for i = 1, #get_AddressSniper.return_Data do
			get_AddressSniper.return_Data[i].value = 1
		end
	end
end
function feature_AimScope(a)
	--OFF All
	if a == 1 then
		gg.toast('1')
	elseif a == 2 then
		gg.toast('2')
	elseif a == 3 then
		gg.toast('3')
	elseif a == 4 then
		gg.toast('4')
	elseif a == 4 then
		return false
	end
end
function feature_FastMedikit(a)
	--OFF All
	if a == 1 then
		gg.toast('1')
	elseif a == 2 then
		gg.toast('2')
	elseif a == 3 then
		return false
	end
end
function feature_colorBody(a)
	local hex_Colors = {
		{A = "h 1F 85 6B 3E", R = "h 00 00 00 00", G = "h 00 00 00 00", B = "h 00 00 00 00"},
	    {A = "h A1 45 C6 BF", R = "h 00 00 00 00", G = "h 03 00 05 00", B = "h 00 00 04 00"},
		{A = "h A1 45 C6 BF", R = "h 02 00 07 00", G = "h 00 00 00 00", B = "h 00 00 04 00"},
		{A = "h A1 45 C6 BF", R = "h 02 00 07 00", G = "h 03 00 05 00", B = "h 00 00 00 00"},
		{A = "h A1 45 C6 BF", R = "h 00 00 00 00", G = "h 00 00 00 00", B = "h 00 00 04 00"},
		{A = "h A1 45 C6 BF", R = "h 00 00 00 00", G = "h 03 00 05 00", B = "h 00 00 00 00"},
		{A = "h A1 45 C6 BF", R = "h 02 00 07 00", G = "h 00 00 00 00", B = "h 00 00 00 00"},
		{A = "h 1F 85 6B 3E", R = "h 00 00 00 00", G = "h 00 00 C6 42", B = "h 00 00 04 00"},
		{A = "h 1F 85 6B 3E", R = "h 02 00 07 00", G = "h 00 00 C6 42", B = "h 00 00 00 00"},
		{A = "h 1F 85 6B 3E", R = "h 00 C0 79 44", G = "h 00 00 C6 42", B = "h 00 00 00 00"},
		{A = "h 1F 85 6B 3E", R = "h 00 3C 1C 46", G = "h 00 00 C6 42", B = "h 80 4F C3 47"},
	}
	if bool_LoadColor then
		handleColorValues(nil, nil, 0)
	else
		repeat
			Tam_Color = gg.alert('Only Activate This Feature While In Battle !', 'Is In Game', 'Return')
			if Tam_Color == 2 then
				return
			end
		until Tam_Color ~= 0
		LoadColorValues()
		bool_LoadColor = true
	end
	if a == 12 then
		bool_LoadColor = false
	else
		TamPxScriptRun(ColorAddress, 16, hex_Colors[a].A)
		TamPxScriptRun(AddressRed, 16, hex_Colors[a].R)
		TamPxScriptRun(AddressGreen, 16, hex_Colors[a].G)
		TamPxScriptRun(AddressBlue, 16, hex_Colors[a].B)
	end
end
function feature_Antenna(a)
	if a then
		TamPxScriptRun(address_Antenna11, 16, 120)
		TamPxScriptRun(address_Antenna12, 16, 120)
	else
		TamPxScriptRun(address_Antenna11, 16, 1)
		TamPxScriptRun(address_Antenna12, 16, 1)
	end
end
function feature_Aimhead(a)
	if a then
		::begin_RefineValueHs::
		if not refine_ValueAimHead then
			body_Male = Refinenumber(body_Male, {'h  F4 FF FF BE 06 00 00 3F F4 FF FF 3E 06 00 00 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F', 1})
			head_Male =  Refinenumber(head_Male, {'h C2 C3 36 BD 66 8E 81 BB 14 FE CC B1 CF 28 B8 AA 15 EB A8 B4 23 53 E8 3D F5 58 7E 3F FE FF 7F 3F FE FF 7F 3F 00 00 80 3F', 1})
			head_Female = Refinenumber(head_Female, {'h A4 FC 1E BD 66 8E 81 BB B8 FE CC B1 56 31 38 AA AC 5D 6A B4 89 2B A1 3D C0 34 7F 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F', 1})
			chest_Female = Refinenumber(chest_Female, {'h 75 C3 DF BD F5 48 CD B8 D7 43 95 AF 21 0A 19 AA 8B CE 33 B4 8A 4C 77 3D 72 88 7F 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F', 1})
			body_Female = Refinenumber(body_Female, {'h F4 FF FF BE 06 00 00 3F F4 FF FF 3E 06 00 00 3F 00 00 80 3F FF FF 7F 3F FF FF 7F 3F', 1})
			refine_ValueAimHead = true
			goto begin_RefineValueHs
		else
			ReadWrite({body_Male, 'h F4 FF FF BE 06 00 00 3F F4 FF FF 3E 06 00 00 3F C3 F5 68 3F C3 F5 68 3F C3 F5 68 3F', 1})
			ReadWrite({head_Male, 'h 85 D2 98 BD 66 8E 81 BB 14 FE CC B1 CF 28 B8 AA 15 EB A8 B4 23 53 E8 3D F5 58 7E 3F 9A 99 99 BF 9A 99 99 3F 9A 99 99 3F', 1})
			ReadWrite({head_Female, 'h 79 77 7D BD A4 69 8E BD B8 FE CC B1 56 31 38 AA AC 5D 6A B4 89 2B A1 3D 0A AA 20 3E CC CC CC BF CC CC CC 3F CC CC CC 3F', 1})
			ReadWrite({chest_Female, 'h 75 C3 DF BD F5 48 CD B8 D7 43 95 AF 21 0A 19 AA 8B CE 33 B4 8A 4C 77 3D 72 88 7F 3F 14 AE 47 3F 14 AE 47 3F 14 AE 47 3F', 1})
			ReadWrite({body_Female, 'h F4 FF FF BE 06 00 00 3F F4 FF FF 3E 06 00 00 3F C3 F5 68 3F C3 F5 68 3F C3 F5 68 3F', 1})
			ReadWrite({boneLeftAll, ';bone_Lefr', 2})
			ReadWrite({boneRightAll, ';bone_Righr', 2})
			ReadWrite({boneSpineAll, ';bone_Spini', 2})
			ReadWrite({boneHipsAll, ';bone_Hipr', 2})
			ReadWrite({boneNeckAll, ';bone_Hips', 2})
		end
	else
		ReadWrite({body_Female, 'h F4 FF FF BE 06 00 00 3F F4 FF FF 3E 06 00 00 3F 00 00 80 3F FF FF 7F 3F FF FF 7F 3F', 1})
		ReadWrite({body_Male, 'h  F4 FF FF BE 06 00 00 3F F4 FF FF 3E 06 00 00 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F', 1})
		ReadWrite({head_Male, 'h C2 C3 36 BD 66 8E 81 BB 14 FE CC B1 CF 28 B8 AA 15 EB A8 B4 23 53 E8 3D F5 58 7E 3F FE FF 7F 3F FE FF 7F 3F 00 00 80 3F', 1})
		ReadWrite({head_Female, 'h A4 FC 1E BD 66 8E 81 BB B8 FE CC B1 56 31 38 AA AC 5D 6A B4 89 2B A1 3D C0 34 7F 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F', 1})
		ReadWrite({chest_Female, 'h 75 C3 DF BD F5 48 CD B8 D7 43 95 AF 21 0A 19 AA 8B CE 33 B4 8A 4C 77 3D 72 88 7F 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F', 1})
		ReadWrite({allbone_Left, ';bone_Left', 2})
		ReadWrite({allbone_Right, ';bone_Right', 2})
		ReadWrite({boneSpine_All, ';bone_Spine', 2})
		ReadWrite({boneHips_All, ';bone_Hips', 2})
		ReadWrite({boneNeck_All, ';bone_Neck', 2})
	end
end
function feature_White(a)
	if a then
		
	else
		
	end
end
function feature_Black(a)
	if a then
		
	else
		
	end
end
function feature_WhiteBlack(a)
	if a then
		
	else
		
	end
end
function feature_ChangeScope(a)
	if a then
		
	else
		
	end
end
function feature_LoactionSniper(a)
	if a then
		ReadWrite({weapon_AwmGoldgun, ';effects/vfx_inagme_laser_shop', 2})
		ReadWrite({weapon_Kar98kGoldgun, ';effects/vfx_inagme_laser_shop', 2})
		ReadWrite({weapon_Awm, ';effects/vfx_ingame_laser', 2})
		ReadWrite({weapon_kar98k, ';effects/vfx_ingame_laser', 2})
		ReadWrite({weapon_M82B, ';effects/vfx_ingame_laser', 2})
		ReadWrite({weapon_M24, ';effects/vfx_ingame_laser', 2})
		ReadWrite({weapon_Vsk94, ';effects/vfx_ingame_laser', 2})
	else
		RestoreValue(weapon_AwmGoldgun)
		RestoreValue(weapon_Kar98kGoldgun)
		RestoreValue(weapon_Awm)
		RestoreValue(weapon_kar98k)
		RestoreValue(weapon_M82B)
		RestoreValue(weapon_M24)
		RestoreValue(weapon_Vsk94)
	end
end
function feature_LocationAmmo(a)
	if a then
		ReadWrite({ammo_SniperWeapon, ';effects/br_airdroplightlevel1', 2})
	else
		RestoreValue(ammo_SniperWeapon)
	end
end
function feature_Sensi(a)
	local int_Sensi = 300 - a
	--set value (value int_Sensi)
end
function feature_CamFov(a)
	local int_CameraFov = 360 - a
	--set value (value int_CameraFov)
end
function feature_CamLetf(a)
	local int_CameraLetf = (a*0.5) + 1
	--set value (value int_CameraLetf)
	TamPxScriptRun(address_CameraRight, 16, int_CameraLetf)
end
function feature_Speed(a)
	if a == 0 then
		hex_ReplaceSpeedGame = '0000'
	elseif a == 1 then
		hex_ReplaceSpeedGame = '0000'
	elseif a == 2 then
		hex_ReplaceSpeedGame = '0000'
	elseif a == 3 then
		hex_ReplaceSpeedGame = '0000'
	elseif a == 4 then
		hex_ReplaceSpeedGame = '0000'
	elseif a == 5 then
		hex_ReplaceSpeedGame = '0000'
	end
	--set value (value hex_ReplaceSpeedGame)
end
function feature_AimFov(a)
	if a then
		
	else
		
	end
end
function feature_AimSniper(a)
	if a then
		
	else
		
	end
end

function feature_AimSemi(a)
	if a then
		
	else
		
	end
end
function feature_AimLock(a)
	if a then
		
	else
		
	end
end
function feature_SuperZoom(a)
	if a then
		
	else
		
	end
end
function feature_SpeedRun(a)
	if a then
		
	else
		
	end
end
function feature_JumpHeight(a)
	if a then
		
	else
		
	end
end 

function feature_DelayFire(a)
	if a then
		
	else
		
	end
end
function feature_NoRecoil(a)
	if a then
		
	else
		
	end
end
function feature_NoParachute(a)
	if a then
		
	else
		
	end
end
function feature_FastReload(a)
	if a then
		
	else
		
	end
end
function feature_FastRevive(a)
	if a then
		
	else
		
	end
end

function feature_PlayerZombie(a)
	if a then
		
	else
		
	end
end
function feature_ThroughCharacter(a)
	if a then
		
	else
		
	end
end
function address_Xa()
end



function start_CheckGame()
	gg.TamPxShell("su -c 'am force-stop com.dts.freefireth'")
	gg.sleep(1000)
	if string.find(gg.TamPxShell("su -c 'am start -n com.dts.freefireth/.FFMainActivity 2>&1'", true), "Error") then
		gg.alert(
		"Khởi chạy thất bại: Activity không tồn tại\n\n"..
		"Launch failed: Activity does not exist"
		)
		check_GameInstall = gg.isPackageInstalled('com.dts.freefireth')
		gg.alert('Không Thể Khởi Chạy Game "Free Fire"\nLí do:\n'..(check_GameInstall and 'Lỗi Script, Có Thể Do Đang Chạy Trong Không Gian Ảo\n\nScript Error, Possibly Running In Virtual Space' or '"Free Fire" Chưa Được Tải Xuống\n\n"Free Fire" Has Not Been Downloaded Yet'))
		os.exit(print('Error Please Restart Script !!!!'))
		return false
	else
		repeat
			gg.setProcess('com.dts.freefireth')
			gg.sleep(100)
		until gg.getTargetInfo().packageName == 'com.dts.freefireth'
		return true
	end
end
function start_Game()
	if not start_CheckGame() then os.exit(print(1)) end
	if cameraLeft_Enable then
		repeat until #Searchvalue(32, 1, 'h0000803F0000000000000000000080BF00000000000080BF', true) ~= 0
		address_CameraRight = getAddresses(Refinenumber(Refinenumber(Searchvalue(32, 1, 'h0000803F0000000000000000000080BF00000000000080BF', true), {'h0000803F0000000000000000000080BF00000000000', 1, true}), {'h0000803F', 1, true}))[1]
		gg.toast('Camera Left ON')
	end
	if antenna_Enable then
		repeat until #Searchvalue(32, 1, 'hF08C99330000803FEFB51EB6', true) ~= 0
		process_State(false)
		address_Antenna01 = Refinenumber(Refinenumber(Searchvalue(32, 1, 'hF08C99330000803FEFB51EB6', true), {'hF08C99330000803F', 1, true}), {'h0000803F', 1, true})
		address_Antenna02 = Refinenumber(Refinenumber(Searchvalue(32, 1, 'hEC40D3340000803F00000000', true), {'hEC40D3340000803F', 1, true}), {'h0000803F', 1, true})
		process_State(true)
		if #address_Antenna01 == 4 then
			tab_AddressAntenna1 = getAddresses(address_Antenna01)[1]
			antenna_Enable01 = true
		else
			table.insert(tab_AddressAntenna1, getAddresses(address_Antenna01)[1])
			table.insert(tab_AddressAntenna1, getAddresses(address_Antenna01)[5])
			antenna_Enable01 = true
		end
		if #address_Antenna02 == 4 then
			tab_AddressAntenna2 = getAddresses(address_Antenna02)[1]
			antenna_Enable02 = true
		else
			table.insert(tab_AddressAntenna2, getAddresses(address_Antenna02)[1])
			table.insert(tab_AddressAntenna2, getAddresses(address_Antenna02)[5])
			antenna_Enable02 = true
		end
		address_Antenna11 = tab_AddressAntenna1
		address_Antenna12 = tab_AddressAntenna2
	end
	if aimAwm_Enable then
		
		gg.toast('Aim Awm ON')
	end
	if localtionSniper_Enable then
		weapon_AwmGoldgun = Searchvalue(32, 2, ';ingame/pickup/pickup_awm_goldgun', true)
		weapon_Kar98kGoldgun = Searchvalue(32, 2, ';ingame/pickup/pickup_kar98k_goldgun', true)
		weapon_Awm = Searchvalue(32, 2, ';ingame/pickup/pickup_awm', true)
		weapon_kar98k = Searchvalue(32, 2, ';ingame/pickup/pickup_kar98k', true)
		weapon_M82B = Searchvalue(32, 2, ';ingame/pickup/pickup_bm94', true)
		weapon_M24 = Searchvalue(32, 2, ';ingame/pickup/pickup_m24', true)
		weapon_Vsk94 = Searchvalue(32, 2, ';ingame/pickup/pickup_vsk94', true)
		gg.toast('Location Sniper ON')
	end
	if localtionSniperAmmo_Enable then
		ammo_SniperWeapon = Searchvalue(32, 2, ';ingame/pickup/ammo/pickup_ammo_sng', true)
	end
	if heashothips_Enable then
		repeat
			body_Male = Searchvalue(32, 1, 'h  F4 FF FF BE 06 00 00 3F F4 FF FF 3E 06 00 00 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F', true)
		until #body_Male > 1
		TamPxScriptRun(gg.getRangesList('libil2cpp.so')[1].start + 0x3c67fac, 32, "h 00 00 A0 E3 1E FF 2F E1")--Auto Login
		body_Female = Searchvalue(32, 1, 'h F4 FF FF BE 06 00 00 3F F4 FF FF 3E 06 00 00 3F 00 00 80 3F FF FF 7F 3F FF FF 7F 3F', true)
		body_Male = Searchvalue(32, 1, 'h  F4 FF FF BE 06 00 00 3F F4 FF FF 3E 06 00 00 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F', true)
		head_Male = Searchvalue(32, 1, 'h C2 C3 36 BD 66 8E 81 BB 14 FE CC B1 CF 28 B8 AA 15 EB A8 B4 23 53 E8 3D F5 58 7E 3F FE FF 7F 3F FE FF 7F 3F 00 00 80 3F', true)
		head_Female = Searchvalue(32, 1, 'h A4 FC 1E BD 66 8E 81 BB B8 FE CC B1 56 31 38 AA AC 5D 6A B4 89 2B A1 3D C0 34 7F 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F', true)
		chest_Female = Searchvalue(32, 1, 'h 75 C3 DF BD F5 48 CD B8 D7 43 95 AF 21 0A 19 AA 8B CE 33 B4 8A 4C 77 3D 72 88 7F 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F', true)
		bone_Left_ = ReadWrite({Searchvalue(32, 2, ';bone_Left_', true), ';bone_Lift_', 2})
		bone_Right_ = ReadWrite({Searchvalue(32, 2, ';bone_Right_', true), ';bone_Reght_', 2})
		allbone_Left = Searchvalue(32, 2, ';bone_Left', true)
		allbone_Right = Searchvalue(32, 2, ';bone_Right', true)
		RestoreValue(bone_Left_)
		RestoreValue(bone_Right_)
		boneSpine_All = Searchvalue(32, 2, ';bone_Spine', true)
		boneHips_All = Searchvalue(32, 2, ';bone_Hips', true)
		boneNeck_All = Searchvalue(32, 2, ';bone_Neck', true)
	end
	--get_AddressSniper= fieldsSearch('OOIPMACFIFL', '32', 0xC, nil, 4)
end
gg.setVisible(true)
while true do
	if gg.isVisible(true) then
		gg.setVisible(false)
		if int_Menu == 'login' then
			menu_Login()
		elseif int_Menu == 'seclectlobby' then
			menu_Select_Lobby()
		elseif int_Menu == 'main' then
			menu_Activity()
		elseif int_Menu == 'lobby' then
			menu_Lobby()
		elseif int_Menu == 'ingame' then
			menuImGame()
		elseif int_Menu == 'safe' then
			menuSafe()
		elseif int_Menu == 'memory' then
			menuMemory()
		elseif int_Menu == 'information' then
			information_Script()
		end
	end
	gg.sleep((time_delay or 100))
end
