require 'rails_helper'

RSpec.describe "vans/index", type: :view do

  context 'it has a "voir plus de vans" button ' do
    it "displays the button" do
      assign(:visible_vans, Van.all.where(is_hidden:false))
      render
      expect(rendered).to have_link('Voir plus de vans')
    end
  end

end
