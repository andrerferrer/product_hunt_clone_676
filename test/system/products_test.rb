require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the home page finds the correct h1" do
    # setup -
    
    # exercise
    visit root_url
    # verify
    assert_selector "h1", text: "Awesome Products"
    
    # teardown - make it so that nothing persists
  end

  test "visiting the home page finds the correct number of cards" do
    # setup -
    
    # exercise
    visit root_url
    # verify
    assert_selector ".card-product", count: Product.count
    # teardown - make it so that nothing persists
  end

  test "visiting the home page finds the card Product One" do
    # setup -
    
    # exercise
    visit root_url
    # verify
    assert_selector ".card-product h2", text: "First Product"
    # teardown - make it so that nothing persists
  end

  test "lets a signed in user create a new product" do
    login_as users(:player_one)
    visit "/products/new"
    # save_and_open_screenshot

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # save_and_open_screenshot

    click_on 'Create Product'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal page.current_path, root_path
    assert_text "Change your life: Learn to code"
  end

end
