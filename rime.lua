function date_translator(input, seg)
	if (input == "date") then
		--- Candidate(type, start, end, text, comment)
		local weakTab = {'日', '一', '二', '三', '四', '五', '六'}
		yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日 星期"..weakTab[tonumber(os.date("%w")+1)]), ""))
		yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
		yield(Candidate("date", seg.start, seg._end, os.date("%m-%d"), ""))
		yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
	end
	if (input == "time") then
		--- Candidate(type, start, end, text, comment)
		yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), ""))
		yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
	end
end

