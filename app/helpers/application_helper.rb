module ApplicationHelper
  def categories_names_ids
    [['Food', 1], ['Beauty', 2], ['Cinema', 3],['Gifts', 4]]
  end

  def category_id_to_name(id)
    categories_names_ids.find do |category|
      category[1] == id
    end[0]
  end
end
