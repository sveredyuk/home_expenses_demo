module RequestsHelper
  def body
    JSON.parse(response.body)
  end
end
