#!/usr/bin/env ruby

cmd = 'rubocop'
files_to_lint = `git status`.split("\n").select {|l| l.match(/new file:(.*)|modified:(.*)|새 파일:(.*)|수정함:(.*)/)}.map {|s| s.sub(/new file:|modified:|새 파일:|수정함:/, '').strip}
puts files_to_lint
return if files_to_lint.size == 0
system(cmd, *files_to_lint)
