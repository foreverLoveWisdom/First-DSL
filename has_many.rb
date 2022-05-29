# frozen_string_literal: true

module HasMany
  def has_many(name)
    name_to_module = name.to_s
                         .split('_')
                         .map(&:capitalize)
                         .join
    mod_name = "HasMany#{name_to_module}"
    begin
      method_module = const_get(mod_name)
    rescue NameError
      method_module = Module.new
      const_get(mod_name, method_module)
    end

    include method_module
    method_module.module_eval <<CODE, __FILE__, __LINE__ + 1
    def #{name}
      driver.find_element(:css, "#{name}")
    end

    def #{name}_texts
      name.map(&:text)
    end
CODE
  end
end
