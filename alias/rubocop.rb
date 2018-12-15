module Alias
  class Rubocop
    class << self
      CMD = 'rubocop'
      INTERESTING_PATTERN = /new file:|modified:|새 파일:|수정함:/

      def lint
        puts files_to_lint
        return if files_to_lint.size == 0
        system(CMD, *files_to_lint)
      end

      private

      def files_to_lint
        `git status`.split("\n").map do |line|
          next unless line.match(INTERESTING_PATTERN)
          line[INTERESTING_PATTERN] = ''
          line.strip
        end.compact.uniq
      end
    end
  end
end
