module SunspotHelper
  
  def category_count(category_id)
    @search.facet(:category_ids).rows.find{|e| e.value == category_id }.try(:count) || 0 if @search
  end
  
  
end