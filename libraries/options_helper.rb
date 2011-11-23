module OptionsHelper  
  def start_options_helper_for(tilestream_node)
    Array.new.tap { |options|
      unless tilestream_node[:host].nil?
        options << "--host #{ tilestream_node[:host] }"
      end
    
      unless tilestream_node[:ui_port].nil?
        options << "--uiPort #{ tilestream_node[:ui_port] }"
      end
    
      unless tilestream_node[:tile_port].nil?
        options << "--tilePort #{ tilestream_node[:tile_port] }"
      end
    
      unless tilestream_node[:subdomains].nil?
        options << "--subdomains #{ tilestream_node[:subdomains].join(',') }"
      end
    
      unless tilestream_node[:tiles].nil?
        options << "--tiles #{ tilestream_node[:tiles] }"
      end
    
      unless tilestream_node[:accesslog].nil?
        options << "--accesslog #{ tilestream_node[:accesslog] }"
      end
    }.join(" ")
  end
end

class Chef::Resource::Service
  include OptionsHelper
end