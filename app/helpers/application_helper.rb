module ApplicationHelper
  # it does nothing but helps us add tailwind class autocomplete.
  # in order to make use of it, add the following regex in tailwind editor config, `experimental.classRegex` array
  # "\\btw(?:\\s*|\\()[\"']([^'\"]*)['\"]"
  # use this when you cannot trigger autocomplete for tailwind class. mark the string with this function first
  def tw(class_string)
    class_string
  end

  def nav_links
    [
      {
        name: "Dish",
        controller: :dishes,
        submenu: [
          { name: "Browse dishes", controller: :dishes, action: :index },
          { name: "Submit dishes", controller: :dishes, action: :new }
        ]
      },
      {
        name: "Restaurants",
        controller: :restaurants,
        submenu: [
          {
            name: "Browse restaurants",
            controller: :restaurants,
            action: :index
          },
          { name: "Submit restaurants", controller: :restaurants, action: :new }
        ]
      }
    ]
  end
end
