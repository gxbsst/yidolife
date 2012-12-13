# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Photos" do
    describe "Admin" do
      describe "photos" do
        login_refinery_user

        describe "photos list" do
          before do
            FactoryGirl.create(:photo, :title => "UniqueTitleOne")
            FactoryGirl.create(:photo, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.photos_admin_photos_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.photos_admin_photos_path

            click_link "Add New Photo"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Photos::Photo.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Photos::Photo.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:photo, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.photos_admin_photos_path

              click_link "Add New Photo"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Photos::Photo.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:photo, :title => "A title") }

          it "should succeed" do
            visit refinery.photos_admin_photos_path

            within ".actions" do
              click_link "Edit this photo"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:photo, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.photos_admin_photos_path

            click_link "Remove this photo forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Photos::Photo.count.should == 0
          end
        end

      end
    end
  end
end
