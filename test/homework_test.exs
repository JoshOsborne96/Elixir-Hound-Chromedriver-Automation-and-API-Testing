defmodule HomeworkTest do
  use Hound.Helpers
  use ExUnit.Case

  describe "Simple tables tests" do

    hound_session()

    test "2x2 table present" do
      navigate_to("https://qa-homework.divvy.co/")

        page_title = page_title()

        simple_table_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[2]/a")
        click(simple_table_link)

        two_by_two_table_btn = find_element(:css, "[data-testid=\"ShowText--Button-1\"]")
        click(two_by_two_table_btn)

        table_element = find_element(:css, "[data-testid=\"TableBody\"]")
        table_display = element_displayed?(table_element)

        row_check = find_all_within_element(table_element, :tag, "tr")
        row_num = length(row_check)

        row_element = find_element(:css, "[data-testid=\"TableRow-1\"]")
        col_check = find_all_within_element(row_element, :tag, "td")
        col_num = length(col_check)

        table_values = visible_page_text()

        two_by_two_values = String.ends_with?(table_values, "TABLE\n1 2\n3 4")

        assert "BILL SDET Homework" == page_title
        assert table_display
        assert 2 == row_num
        assert 2 == col_num
        assert two_by_two_values

    end

    hound_session()

    test "3x3 table present" do
      navigate_to("https://qa-homework.divvy.co/")

        page_title = page_title()

        simple_table_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[2]/a")
        click(simple_table_link)

        three_by_three_table_btn = find_element(:css, "[data-testid=\"ShowText--Button-2\"]")
        click(three_by_three_table_btn)

        table_element = find_element(:css, "[data-testid=\"TableBody\"]")
        table_display = element_displayed?(table_element)

        row_check = find_all_within_element(table_element, :tag, "tr")
        row_num = length(row_check)

        row_element = find_element(:css, "[data-testid=\"TableRow-1\"]")
        col_check = find_all_within_element(row_element, :tag, "td")
        col_num = length(col_check)

        table_values = visible_page_text()

        three_by_three_values = String.ends_with?(table_values, "TABLE\n1 2 3\n4 5 6\n7 8 9")


        assert "BILL SDET Homework" == page_title
        assert table_display
        assert 3 == row_num
        assert 3 == col_num
        assert three_by_three_values

    end

    hound_session()

    test "4x4 table present" do
      navigate_to("https://qa-homework.divvy.co/")

        page_title = page_title()

        simple_table_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[2]/a")
        click(simple_table_link)

        four_by_four_table_btn = find_element(:css, "[data-testid=\"ShowText--Button-3\"]")
        click(four_by_four_table_btn)

        table_element = find_element(:css, "[data-testid=\"TableBody\"]")
        table_display = element_displayed?(table_element)

        row_check = find_all_within_element(table_element, :tag, "tr")
        row_num = length(row_check)

        row_element = find_element(:css, "[data-testid=\"TableRow-1\"]")
        col_check = find_all_within_element(row_element, :tag, "td")
        col_num = length(col_check)

        table_values = visible_page_text()

        four_by_four_values = String.ends_with?(table_values, "TABLE\n1 2 3 4\n5 6 7 8\n9 10 11 12\n13 14 15 16")


        assert "BILL SDET Homework" == page_title
        assert table_display
        assert 4 == row_num
        assert 4 == col_num
        assert four_by_four_values

    end

    hound_session()

    test "5x5 table present" do
      navigate_to("https://qa-homework.divvy.co/")

        page_title = page_title()

        simple_table_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[2]/a")
        click(simple_table_link)

        five_by_five_table_btn = find_element(:css, "[data-testid=\"ShowText--Button-4\"]")
        click(five_by_five_table_btn)

        table_element = find_element(:css, "[data-testid=\"TableBody\"]")
        table_display = element_displayed?(table_element)

        row_check = find_all_within_element(table_element, :tag, "tr")
        row_num = length(row_check)

        row_element = find_element(:css, "[data-testid=\"TableRow-1\"]")
        col_check = find_all_within_element(row_element, :tag, "td")
        col_num = length(col_check)

        table_values = visible_page_text()

        five_by_five_values = String.ends_with?(table_values,
        "TABLE\n1 2 3 4 5\n6 7 8 9 10\n11 12 13 14 15\n16 17 18 19 20\n21 22 23 24 25")


        assert "BILL SDET Homework" == page_title
        assert table_display
        assert 5 == row_num
        assert 5 == col_num
        assert five_by_five_values

    end

    hound_session()

    test "table test - hide table" do
      navigate_to("https://qa-homework.divvy.co/")

        page_title = page_title()

        simple_table_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[2]/a")
        click(simple_table_link)

        two_by_two_table_btn = find_element(:css, "[data-testid=\"ShowText--Button-1\"]")
        click(two_by_two_table_btn)

        hide_btn = find_element(:css, "[data-testid=\"ShowText--Button-0\"]")
        click(hide_btn)

        table_element = find_element(:css, "[data-testid=\"TableBody\"]")
        table_display = element_displayed?(table_element)

        assert "BILL SDET Homework" == page_title
        assert false == table_display

    end
  end

  describe "File upload tests" do

    hound_session()

    test "file upload - happy path" do
      navigate_to("https://qa-homework.divvy.co/")

      page_title = page_title()

      file_upload_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[3]/a")
      click(file_upload_link)

      file_upload_field = find_element(:css, "[data-testid=\"FileUploadSelector--Button\"]")
      input_into_field(file_upload_field, "/Users/joshosborne/Desktop/QA-homework-file.pdf")

      upload_btn = find_element(:css, "[data-testid=\"FileUpload--Button\"]")
      click(upload_btn)

      alert_prompt = find_element(:id, "alert-dialog")
      alert_message = inner_html(alert_prompt)

      assert "BILL SDET Homework" == page_title
      assert "File Was Successfully Uploaded!" == alert_message

    end

    hound_session()

    test "file upload - sad path" do
      navigate_to("https://qa-homework.divvy.co/")

      page_title = page_title()

      file_upload_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[3]/a")
      click(file_upload_link)

      upload_btn = find_element(:css, "[data-testid=\"FileUpload--Button\"]")
      click(upload_btn)

      alert_display = element?(:id, "alert-dialog")

    assert "BILL SDET Homework" == page_title
    assert false == alert_display

    end
  end

  describe "download file tests" do

    hound_session()

    test "File download - verified contents - happy path" do
      navigate_to("https://qa-homework.divvy.co/")

        page_title = page_title()

        download_file_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[4]/a")
        click(download_file_link)

        download_btn = find_element(:css, "[data-testid=\"DownloadFile--Button\"]")
        click(download_btn)

        #5 second sleep put in too allow adequate time for file download
        Process.sleep(5000)

        file_path = "/Users/joshosborne/Downloads/downloaded_file.txt"

        #Ideally, it would be nice to put in a system here to verify that the correct file was downloaded.
        #For example, if this a file with this name already existed, this test would pass even if the download didn't
        #actually complete. Maybe changing the file name to a UUID so it is assert that the correct file was downloaded
        #each time.

        downloaded_file = File.exists?(file_path)
        file_contents = File.read(file_path)

        assert "BILL SDET Homework" == page_title
        assert downloaded_file
        assert {:ok, "Congratulations for downloading this file!"} == file_contents

    end
  end

  describe "dynamic loading tests" do

      # Original method below, using loops to monitor loading completion. This was done before discovering
      # "retries" argument with find_element function.

      # def do_loop(60) do
      #   {:error, "Timeout - Too many loops"}
      #   #60 loops or 30 seconds were chosen to ensure sufficent loading time

      # end

      # def do_loop(count) do

      #   complete_prompt = find_element(:xpath, "/html/body/div/div[2]/div[2]")
      #   # find_element(:css, "data-testid=['DynamicLoaderMessage--Info']"

      #   if visible_text(complete_prompt) == "Complete!" do
      #     {:ok, "Loading completed"}

      #   else
      #     Process.sleep(500)
      #     do_loop(count + 1)

      #   end
      # end

      hound_session()

      test "Dynamic loading - happy path" do
        navigate_to("https://qa-homework.divvy.co/")

        page_title = page_title()

        dynamic_load_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[5]/a")
        click(dynamic_load_link)

        status_prompt = find_element(:css, "[data-testid=\"DynamicLoaderMessage--Info\"]", 100)
        complete_text = visible_text(status_prompt)



        assert "BILL SDET Homework" == page_title
        assert "Complete!" == complete_text
        # assert {:ok, "Loading completed"} == do_loop(0)

    end

      hound_session()

      test "Dynamic loading - sad path" do
        navigate_to("https://qa-homework.divvy.co/")

        page_title = page_title()

        dynamic_load_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[5]/a")
        click(dynamic_load_link)

        status_prompt = find_element(:xpath, "/html/body/div/div[2]/div[2]/div[2]", 2)
        loading_text = inner_html(status_prompt)

        refresh_page()
        # To simulate error example. For instance, if a user refreshes the page before allowing loading to complete.

        assert "BILL SDET Homework" == page_title
        assert "Loading . . ." == loading_text

      end
  end

  describe "Complex form tests" do

    hound_session()

    test "Complex form filled out - Pepperoni happy path" do
      navigate_to("https://qa-homework.divvy.co/")

      page_title = page_title()

      complex_form_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[6]/a")
      click(complex_form_link)

      input_into_field({:name, "firstName"}, "Michael")
      input_into_field({:name, "lastName"}, "Scott")
      input_into_field({:name, "email"}, "M.Scott@DunderMifflin.com")
      input_into_field({:name, "phone"}, "8018565555")
      input_into_field({:name, "addressLine1"}, "1725 Slough Avenue")
      input_into_field({:name, "addressLine2"}, "200")
      input_into_field({:name, "city"}, "Scanton")
      click({:xpath, "/html/body/div/div[2]/div/div/div/div[2]/div/form/div/div[10]/div/div/div"})
      click({:css, "[data-value=\"PA\"]"})
      input_into_field({:name, "deliveryDate"}, "03262000")
      input_into_field({:name, "deliveryTime"}, "415PM")

      click({:xpath, "/html/body/div/div[2]/div/div/div/div[2]/div/form/div/div[14]/button"})
      page_1_alert = dialog_text()
      page_1_info = "Successfully submitted these values: Michael,Scott,M.Scott@DunderMifflin.com,8018565555,1725 Slough Avenue,200,Scanton,PA,2000-03-26,16:15! Please proceed to the next step."
      accept_dialog()

      click({:xpath, "/html/body/div/div[2]/div/div/div/div[3]/div/button[2]"})

      click({:css, "[value=\"large\"]"})
      click({:css, "[value=\"thin\"]"})
      click({:xpath, "/html/body/div/div[2]/div/div/div/div[2]/div/form/div/div[6]/div/div/div"})
      click({:css, "[data-value=\"average\"]"})
      click({:css, "[value=\"marinara\"]"})
      click({:xpath, "/html/body/div/div[2]/div/div/div/div[2]/div/form/div/div[10]/div/div/div"})
      click({:css, "[data-value=\"light\"]"})
      click({:name, "pepperoni"})

      click({:xpath, "/html/body/div/div[2]/div/div/div/div[2]/div/form/div/div[16]/button"})
      page_2_alert = dialog_text()
      page_2_info = "Successfully submitted these values: size,large,crust,thin,cheese,true,cheeseAmount,average,sauce,true,sauceType,marinara,sauceAmount,light,toppings,true,meats,ham,false,beef,false,salami,false,pepperoni,true,sausage,false,chicken,false,bacon,false,steak,false,nonMeats,jalapenos,false,onions,false,tomatoes,false,olives,false,mushrooms,false,pineapple,false,parmesan,false,spinach,false! Please proceed to the next step."
      accept_dialog()

      click({:xpath, "/html/body/div/div[2]/div/div/div/div[3]/div/button[2]"})
      input_into_field({:name, "specialInstructions"}, "Please bring into the conference room. Sorry we kidnapped your delivery guy.")
      click({:xpath, "/html/body/div/div[2]/div/div/div/div[2]/div/form/div/div[2]/button"})
      page_3_alert = dialog_text()
      page_3_info = "Success Please bring into the conference room. Sorry we kidnapped your delivery guy.! Thank you for your order."
      accept_dialog()


      assert "BILL SDET Homework" == page_title
      assert page_1_info == page_1_alert
      assert page_2_info == page_2_alert
      assert page_3_info == page_3_alert

    end

    hound_session()

    test "form w/ invalid phone number and required fields - Sad path" do
      navigate_to("https://qa-homework.divvy.co/")

      page_title = page_title()

      complex_form_link = find_element(:xpath, "/html/body/div/div[1]/nav/ul/li[6]/a")
      click(complex_form_link)

      click({:xpath, "/html/body/div/div[2]/div/div/div/div[2]/div/form/div/div[14]/button"})

      input_into_field({:name, "phone"}, "123")
      invalid_number_text = inner_html({:xpath, "/html/body/div/div[2]/div/div/div/div[2]/div/form/div/div[5]/div/p"})
      fname_required_text = inner_html({:xpath, "/html/body/div/div[2]/div/div/div/div[2]/div/form/div/div[2]/div/p"})
      address_required_text = inner_html({:xpath, "/html/body/div/div[2]/div/div/div/div[2]/div/form/div/div[7]/div/p"})
      delivery_date_required_text = inner_html({:xpath, "/html/body/div/div[2]/div/div/div/div[2]/div/form/div/div[12]/div/p"})

      #Only three random fields were selected to test "required" text was present but in practice assertions for
      #each field could be written


      assert "BILL SDET Homework" == page_title
      assert "Invalid phone number" == invalid_number_text
      assert "Required" == fname_required_text
      assert "Required" == address_required_text
      assert "Required" == delivery_date_required_text

    end
  end
end
