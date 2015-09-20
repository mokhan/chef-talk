class Chef
  class Recipe
    def rbenv(command)
      chef_talk_rbenv(command)
    end

    def gem(command)
      chef_talk_gem(command)
    end
  end
end
