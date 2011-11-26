module OptionsHelper  
  def start_options_helper_for(the_node)
    Array.new.tap { |options|
      if the_node[:tilestream][:host].nil? && the_node[:tilestream][:cloud]
        options << "--host #{ the_node[:cloud][:public_hostname] }"
      else 
        options << "--host #{ the_node[:tilestream][:host] }"
      end
    
      unless the_node[:tilestream][:ui_port].nil?
        options << "--uiPort #{ the_node[:tilestream][:ui_port] }"
      end
    
      unless the_node[:tilestream][:tile_port].nil?
        options << "--tilePort #{ the_node[:tilestream][:tile_port] }"
      end
    
      unless the_node[:tilestream][:subdomains].nil?
        options << "--subdomains #{ the_node[:tilestream][:subdomains].join(',') }"
      end
    
      unless the_node[:tilestream][:tiles].nil?
        options << "--tiles #{ the_node[:tilestream][:tiles] }"
      end
    
      unless the_node[:tilestream][:accesslog].nil?
        options << "--accesslog #{ the_node[:tilestream][:accesslog] }"
      end
    }.join(" ")
  end
end

class Chef::Resource::Service
  include OptionsHelper
end