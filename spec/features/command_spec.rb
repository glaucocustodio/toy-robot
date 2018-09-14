RSpec.feature "Command", type: :feature, js: true do
  before do
    visit commands_path
    expect(page).to have_text("Comando")
  end

  scenario "first command is valid" do
    send_command("place 0,0,east")
    expect(table_at(0, 0).text).to eq('>')

    send_command("place 4,4,south")
    expect(table_at(0, 0).text).to eq('')
    expect(table_at(4, 4).text).to eq('>')

    send_command("move")
    expect(page).to have_text("comando inválido")

    send_command("place 1,1,east")
    expect(table_at(1, 1).text).to eq('>')

    send_command("move")
    expect(table_at(2, 1).text).to eq('>')

    send_command("move")
    expect(table_at(3, 1).text).to eq('>')

    send_command("move")
    expect(table_at(4, 1).text).to eq('>')

    send_command("right")
    send_command("move")
    expect(table_at(4, 2).text).to eq('>')

    send_command("right")
    send_command("move")
    expect(table_at(3, 2).text).to eq('>')

    send_command("left")
    send_command("move")
    expect(table_at(3, 3).text).to eq('>')
    # page.all('table tr').each do |tr|
    #   tr.all('td').each do |td|
    #     ap td.text
    #   end
    # end
  end

  scenario "first command is invalid" do
    send_command("move")
    expect(page).to have_text("comando inválido")

    send_command("left")
    expect(page).to have_text("comando inválido")

    send_command("right")
    expect(page).to have_text("comando inválido")

    send_command("place 20,20,west")
    expect(page).to have_text("comando inválido")
  end
end
