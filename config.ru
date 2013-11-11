require 'rack'

class Info
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["REQUEST_METHOD"] = "GET"
      response = case env["REQUEST_PATH"]
      when "/"
        "Memory info: " + `free -m` + "</br>" + "Disk usage info: " + `df -h`
        when "/memory"
        "Memory info: " + `free -m`
        when "/disk"
        "Disk usage info: " + `df -h`
        when "/help"
        ' "Available paths are: " </br>
          "/" - memory and disk info </br>
          "/memory" - memory info </br>
          "/disk" - disk usage info </br> '
          else
          "No such path. 404"
      end
      [200, {"Content-Type" => "text/html"}, [response]] 
    end
  end
end

run Info.new(@app)
