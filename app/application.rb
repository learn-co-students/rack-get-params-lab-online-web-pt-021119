class Application

  @@item = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end

    elsif req.path.match(/cart/)
      @@cart.each do |list|
        resp.write "#{list}\n"
      end

      if @@cart.empty?
        resp.write "Your cart is empty"
      end

    elsif req.path.match(/search/)

      search_term = req.params["q"]

      if @@cart.include?(search_term)
        resp.write "#{search_term}"
      elsif
        resp.write "Path not found"
      end


    elsif req.path.match(/add/)

      item = req.param["q"]

      if @@cart.include?(item)
        @@cart << item
        resp.write "added #{item}"
      else
        resp.write "We don't have that item"
      end
    else
      resp.write "Path not found"
    end
  end





    # elsif req.path.match(/search/)
    #   search_term = req.params["q"]
    #   resp.write handle_search(search_term)
    # else
    #   resp.write "Path Not Found"
    # end


  # def handle_search(search_term)
  #   if @@items.include?(search_term)
  #     return "#{search_term} is one of our items"
  #   else
  #     return "Couldn't find #{search_term}"
 end
