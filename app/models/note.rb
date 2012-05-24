require 'github/markup'

class Note < ActiveRecord::Base
  SUPPORTED_MARKUPS = ["markdown","textile"]
  has_many :children, :class_name => "Note", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Note", :foreign_key => "parent_id"
  
  def to_html(markup = "markdown")
    raise UnsupportedMarkup unless SUPPORTED_MARKUPS.include?(markup)
    GitHub::Markup.render(".#{markup}", self.content)
  end
    
  
  def self.print_tree
    notes = where(:parent_id => 0)
    notes.each do |note|
      note.print_tree(0)
    end
  end
  
  def print_tree(depth)
    p leader(depth) + name
    children.each do |child|
      child.print_tree(depth+1)
    end
  end
  
  def self.print_html_tree
    notes = where(:parent_id => 0)
    html = ""
    notes.each do |note|
      html += note.print_html_tree
    end
    html
  end
  
  def print_html_tree
    html = "<div id='node-#{id}'>" + "<img src='images/minus.png' onclick='toggle_tree(#{id})' height=20 width=20>" + "<a onclick='show_note(#{id});'>" + name + "</a>"
    children.each do |child|
      html += child.print_html_tree
    end
    html += "</div>"
  end
  
  def leader(depth)
    leader = ""
    depth.times {leader=leader+'-'}
    leader = leader + '>' 
  end
end
