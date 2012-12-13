module ApplicationHelper #modules give us a way to package together related methods; because this is a helper module, Rails automagically includes the methods defined: they are available in all views.

  # Returns the full title on a per-page basis.
  def full_title(page_title) #define new method full_title
    base_title = "Jasper's App" #assigning the variable
    if page_title.empty? #if page_title is empty (no specific naming), then the full_title is defined as the base title
      base_title #this is the implicit return if previous boolen is true
    else #if the page_title is not empty, then the full_title is defined as the base_title and page_title
      "#{base_title} | #{page_title}"  #string interpolation!
    end
  end
end