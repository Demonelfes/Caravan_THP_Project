RSpec.describe "users/show", type: :view do
  let(:user) { FactoryBot.create(:user) }

  before do
    allow(view).to receive(:current_user).and_return(user)
    assign(:visible_vans, Van.all.where(is_hidden: false))
    render
  end

  it "displays the user's email" do
    expect(rendered).to have_content(user.email)
  end
end
