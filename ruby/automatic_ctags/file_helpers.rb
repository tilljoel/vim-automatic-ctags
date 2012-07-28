module AutomaticCtags
  module FileHelpers
    def find_project_root(files)
      dirs = get_search_directories
      Find.find(*dirs) do |path|
          basename = File.basename(path)
          files.each do |file|
            return File.dirname(path) if basename == file
          end
      end
    end

    def get_current_depth(file = __FILE__)
      home_path = File.expand_path('~')
      home_depth = split_path(home_path).length
      cwd_path = File.expand_path(file)
      cwd_path.split("/").length - home_depth
    end

    def get_search_directories
      depth = get_current_depth
      dirs = (0...depth).to_a.map do |i|
        File.expand_path(File.join(".", [".."] * i))
      end
    end

    def split_path(path)
      head, tail = File.split(path)
      return [tail] if head == '.' || tail == File::SEPARATOR
      return [head, tail] if head == File::SEPARATOR
      return split_path(head) + [tail]
    end

  end
end

