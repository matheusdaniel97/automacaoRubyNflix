class SweetAlert
  include Capybara::DSL

  def cancel
    find(".swal2-cancel").click #Clique no botão cancel para cancelar a remoção do filme
  end

  def confirm
    find(".swal2-confirm").click #Clique no botão confirm para confirmar a remoção do filme
  end
end
