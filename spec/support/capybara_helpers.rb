module CapybaraHelpers
  def table_at(td, tr)
    page.find(:css, "table tr:nth-child(#{tr+1}) td:nth-child(#{td+1})")
  end

  def send_command(text)
    fill_in "Comando", with: text
    click_button "Enviar"
  end
end
