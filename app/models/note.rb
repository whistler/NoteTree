class Note < ActiveRecord::Base
  has_many :children, :class_name => "Note", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Note", :foreign_key => "parent_id"
  
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
    html = "<div id='node-#{id}'>" + "<a onclick='show_note(#{id});'>" + name + "</a>"
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
