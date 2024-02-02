class ApplicationController < ActionController::Base

   # def gen_json(url, uri, key_name, file)
   #    url = url.to_s
   #    uri = uri.to_s
   #    key_name = key_name.to_s.upcase
   #    file = file.to_s
      
   #    conn = Faraday.new(url: url) do |faraday|
   #      faraday.headers["X-API-KEY"] = ENV[key_name]
   #    end
   #    response = conn.get(uri & ".json")

   #    data = JSON.parse(response.body)

   #    file_path = Rails.root.join("spec", "fixtures", file & ".json")
    
   #    File.open(file_path, 'a') do |file|
   #      file.write(JSON.pretty_generate(data))
   #    end
   # end

   private

   def error_message(errors)
      errors.full_messages.join(', ')
   end
end
