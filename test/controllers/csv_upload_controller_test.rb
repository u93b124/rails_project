require "test_helper"

class CsvUploadControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get csv_upload_index_url
    assert_response :success
  end
end
