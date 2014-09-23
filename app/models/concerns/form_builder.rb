#encoding: utf-8
#place the common methods
module FormBuilder
  extend ActiveSupport::Concern
  
  def generate_form
    #  <%= value_for(@site, 'name', '标题', typo: 'string', default: true, required: true) %>
    #  a =  "{typo: 'string', default: true, required: true}"
    #  > eval a
    # => {:typo=>"string", :default=>true, :required=>true} 
    form_html = {}
    #reg1 = /value_for\(@site,\s*'([^'']+)',\s*'([^'']+)'(?:,\s*(.*))?\)/
    reg2 = /value_for\(@site,\s*'([^'']+)',\s*'([^'']+)'(?:,\s*(.*))?\)/
    self.html.scan(reg2).each do |match|
      next if form_html.include?(match[0])
      #parse a string into hash
      opt = {}
      opt = eval('{' + match[2] + '}') if match[2]
      form_html[match[0]] = get_input(match[0], match[1], opt)
    end
    self.form = form_html.values.join
  end

  #<%= value_for(@site, 'name', 'title', typo: 'string', default: true, required: true) %>
  #<%= value_for(@site, 'weding_date', 'title', typo: 'date', title: '婚礼日期', required: true)  %>
  #value_for(@site, 'content', 'title', typo: 'select', options: ['a', 'b', 'c'], title: 'title', default: true) 
  def get_input(name, title, opt)
    raise "input not assign name and title" if name.blank? || title.blank?
    opt[:typo] = opt[:type] if opt[:typo].blank? #alias
    opt[:typo] = 'string' if opt[:typo].blank? #default 

    arr = [%{<!-- #{name}-->}]
    arr << %{\n<div class="control-group">}
    arr << %{\n   <label class="}
    arr << 'required ' if opt[:required] == true
    arr << opt[:typo]
    arr << %{ control-label">}
    arr << %{<abbr title="必填项">*</abbr>} if opt[:required] == true
    arr << title

    if opt[:typo].downcase == 'dialog' && name == 'music'
      arr << %{<a data-target="#musicModal" data-toggle="modal" href="#{opt[:url]}">(选择背景音乐)</a>}
    end
    if opt[:typo].downcase == 'dialog' && name == 'banner'
      arr << %{<a data-target="#bannerModal" data-toggle="modal" href="#{opt[:url]}">(选择封面图片)</a>}
    end

    arr << %{</label>}
    arr << %{\n    <div class="controls">\n }
    case opt[:typo].downcase
    when 'string', 'dialog'
      arr << %{<input class="#{opt[:typo]} #{if opt[:required] then 'required' end}" id="site_#{name}" name="site[#{name}]" typo="#{opt[:typo]}"}
      arr << %{ placeholder="#{opt[:placeholder]}"}
      arr << %{ value="<%= value_for(@site, '#{name}') %>">}
    when 'int', 'integer', 'numeric'
      arr << %{<input class="numeric integer #{if opt[:required] then 'required' end}" id="site_#{name}" name="site[#{name}]" step="1" type="number"}
      arr << %{ value="<%= value_for(@site, '#{name}') %>">}
    when 'text', 'textarea'
      arr << %{<textarea class="text" id="site_#{name}" name="site[#{name}]">}
      arr << %{<%= value_for(@site, '#{name}') %>}
      arr << %{</textarea>}
    when 'select', 'radio'
      arr << %{<select id="site_#{name}" name="site_pag_#{name}" class="input-xlarge">}
      opt[:options].each do |option|
        arr << %{<option value="#{option}">#{option}</option>}
      end
      arr << %{</select>}
    when 'image', 'img'
      arr << %{<a class="btn btn-active" data-remote="true" data-target="#meituModal" data-toggle="modal" href="#{opt[:url]}">+ 点击这里添加图片</a>}
    else
      raise "bad input typo: #{opt[:typo]}"
    end
    arr << %{\n<p class="help-block">*提示：#{opt[:hint]}</p>} if opt[:hint]
    arr << %{\n    </div>}
    arr << %{\n</div>\n\n}
    arr.join
  end
end