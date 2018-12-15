module Alias
  class Rubocop
    class << self
      CMD = 'rubocop'
      INTERESTING_PATTERN_PREFIXES = %w[
        new\ file:
        modified:
        새\ 파일:
        수정함:
      ]

      def lint
        puts files_to_lint
        return if files_to_lint.size == 0
        system(CMD, *files_to_lint)
      end

      private

      def files_to_lint
        `git status`.split("\n").map do |line|
          next unless line.match?(interesting_pattern)
          line[interesting_prefix_pattern] = ''
          line.strip
        end.compact.uniq
      end

      def interesting_pattern
        oring_regexp_from(INTERESTING_PATTERN_PREFIXES.map {|p| p + '.*\.rb'})
      end

      def interesting_prefix_pattern
        oring_regexp_from(INTERESTING_PATTERN_PREFIXES)
      end

      def oring_regexp_from(string_array)
        Regexp.new string_array.join('|')
      end
    end
  end
end
