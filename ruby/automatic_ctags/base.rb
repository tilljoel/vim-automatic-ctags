module AutomaticCtags
  module CtagsSettings

    DEFAULT_CTAGS_FILES = ".git,Gemfile"
    DEFAULT_CTAGS_CMD ="ctags -R"
    DEFAULT_CTAGS_FILENAME = "tags"

    def vim_exists? str
      ::VIM::evaluate(%{exists("#{str}")}).to_i != 0
    end

    def vim_get_var(var_name, default)
      value = case vim_exists?(var_name)
              when true  then ::VIM::evaluate(var_name)
              when false then default
              end
    end

    def files_that_indicates_a_project
      files = vim_get_var("g:automatic_ctags_files", DEFAULT_CTAGS_FILES)
      files.split(",")
    end

    def ctags_cmd
      cmd = vim_get_var("g:automatic_ctags_cmd", DEFAULT_CTAGS_CMD)
      cmd
    end

    def ctags_filename
      filename = vim_get_var("g:automatic_ctags_filename", DEFAULT_CTAGS_FILENAME)
      filename
    end
  end
end
