# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Googlemaps" do
    describe "Admin" do
      describe "googlemaps" do
        login_refinery_user

        describe "googlemaps list" do
          before do
            FactoryGirl.create(:googlemap, :address => "UniqueTitleOne")
            FactoryGirl.create(:googlemap, :address => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.googlemaps_admin_googlemaps_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.googlemaps_admin_googlemaps_path

            click_link "Add New Googlemap"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Address", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Googlemaps::Googlemap.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Address can't be blank")
              Refinery::Googlemaps::Googlemap.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:googlemap, :address => "UniqueTitle") }

            it "should fail" do
              visit refinery.googlemaps_admin_googlemaps_path

              click_link "Add New Googlemap"

              fill_in "Address", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Googlemaps::Googlemap.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:googlemap, :address => "A address") }

          it "should succeed" do
            visit refinery.googlemaps_admin_googlemaps_path

            within ".actions" do
              click_link "Edit this googlemap"
            end

            fill_in "Address", :with => "A different address"
            click_button "Save"

            page.should have_content("'A different address' was successfully updated.")
            page.should have_no_content("A address")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:googlemap, :address => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.googlemaps_admin_googlemaps_path

            click_link "Remove this googlemap forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Googlemaps::Googlemap.count.should == 0
          end
        end

      end
    end
  end
end
