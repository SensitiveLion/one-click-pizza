require "pry"
require "mechanize"

agent = Mechanize.new
pizza_login = agent.get("https://eat24hours.com/login")
pizza_form =  pizza_login.form()
pizza_form.login = "email@email.com"
pizza_form.password = "password"
pizza_login = agent.submit(pizza_form)

pizza = agent.get("http://west-roxbury.eat24hours.com/christo-s-pizzeria/6218")
more_pizza = pizza.link_with(text: "\n                         Pizza Menu\n                    ").click
calzone = more_pizza.link_with(text: "Buffalo Chicken Calzone").click
pp calzone
binding.pry

