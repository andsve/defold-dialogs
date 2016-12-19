local ffi = package.preload.ffi()
local qd = ffi.load("native_libs/nfd")
ffi.cdef[[
enum {
	NFD_ERROR,
	NFD_OKAY,
	NFD_CANCEL
};
unsigned int NFD_SaveDialog(const char * filterList, const char *defaultPath, char **outPath);
unsigned int NFD_OpenDialog(const char * filterList, const char *defaultPath, char **outPath);
const char *NFD_GetError(void);
]]
	
local dialog = {}
dialog.save = function(filters, default_path)

	local out_path = ffi.new 'char*[1]'
	local r = qd.NFD_SaveDialog(filters, default_path, out_path)
	if r == qd.NFD_OKAY then
		return ffi.string(out_path[0])
	elseif r == qd.NFD_CANCEL then
		print("User canceled dialog.")
	else
		print("Dialog error: " .. tostring(ffi.string(qd.NFD_GetError())))
	end
	
	return nil
end
dialog.load = function(filters, default_path)

	local out_path = ffi.new 'char*[1]'
	local r = qd.NFD_OpenDialog(filters, default_path, out_path)
	if r == qd.NFD_OKAY then
		return ffi.string(out_path[0])
	elseif r == qd.NFD_CANCEL then
		print("User canceled dialog.")
	else
		print("Dialog error: " .. tostring(ffi.string(qd.NFD_GetError())))
	end
	
	return nil
end


return dialog
