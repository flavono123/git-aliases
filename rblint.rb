#!/usr/bin/env ruby

cmd = 'rubocop'
interesting_pattern = /new file:|modified:|새 파일:|수정함:/
files_to_lint = `git status`.split("\n").select {|l| l.match(interesting_pattern)}.map {|s| s.sub(interesting_pattern, '').strip}
puts files_to_lint
return if files_to_lint.size == 0
system(cmd, *files_to_lint)
