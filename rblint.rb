#!/usr/bin/env ruby

cmd = 'rubocop'
interesting_pattern = /new file:|modified:|새 파일:|수정함:/
files_to_lint = `git status`.split("\n").map do |line|
  next unless line.match(interesting_pattern)
  line[interesting_pattern] = ''
  line.strip
end.compact
puts files_to_lint
return if files_to_lint.size == 0
system(cmd, *files_to_lint)
