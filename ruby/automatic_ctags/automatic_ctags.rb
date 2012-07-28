require 'find'
require 'automatic_ctags/base'
require 'automatic_ctags/file_helpers'

module AutomaticCtags

  extend FileHelpers
  extend CtagsSettings

  module VIM

    def VIM.exists? str
      ::VIM::evaluate(%{exists("#{str}")}).to_i != 0
    end

    def VIM.get_var(var_name, default)
      case VIM::exists?(var_name)
        when true  then VIM::evaluate(var_name)
        when false then default
      end
    end

  end

  def AutomaticCtags.generate
    files = files_that_indicates_a_project
    dir = find_project_root(files)
    generate_tagsfile_for(dir)
  end

  def AutomaticCtags.generate_tagsfile_for(dir)
    return unless File.directory?(dir)
    tagsfile = File.join(dir, ctags_filename)
    if !File.exist?(tagsfile) or File.writable?(tagsfile)
      cmd = "#{ctags_cmd} -f #{tagsfile} #{dir}"
      system(cmd)
    end
  end

end
