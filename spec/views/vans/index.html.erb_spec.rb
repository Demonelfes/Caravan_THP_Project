require 'rails_helper'

RSpec.describe "vans/index", type: :view do

  context 'it has a "voir plus de vans" link ' do
    it "displays the link" do
      assign(:visible_vans, Van.all.where(is_hidden:false))
      render
      expect(rendered).to have_link('Voir plus de vans')
    end
  end

  context 'it has a banner' do
    it "displays the banner" do
      assign(:visible_vans, Van.all.where(is_hidden:false))
      render
      expect(rendered).to render_template(partial: '_banner')
    end
  end
end
