class MenuItem < ActiveRecord::Base
  attr_accessible :name, :link, :linked_to_page, :page, :page_id, :parent_id, :children

  belongs_to :page

  belongs_to :menu

  has_ancestry



  # if self.has_children?
  #   accepts_nested_attributes_for :children
  #   attr_accessible :children_attributes
  # end

  translates :name, :link
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes, :translations

  class Translation
    attr_accessible :locale, :name, :link
  end

  def parent_enum
    MenuItem.where.not(id: id).map { |c| [ c.name, c.id ] }
  end

  def get_link
    if linked_to_page == true
      page.path
    else
      link
    end
  end


  rails_admin do
    edit do
      field :parent_id, :enum do
        enum_method do
          :parent_enum
        end
      end

      field :name
      field :link
      field :linked_to_page
      field :page

      field :translations, :globalize_tabs

      # field :children
    end

    nested do
      field :parent_id, :hidden

      # field :ancestry, :enum do
      #   enum do
      #     except = bindings[:object].id
      #     Article.where("id != ?", except).map { |c| [ c.title, c.id ] }
      #   end
      # end
    end
  end
end
