class PesquisaTexto < SitePrism::Page
  element :lupa, "#search-open"
  element :campo_busca, ".desktop-search .search-field"
  element :pesquisar, ".desktop-search .search-submit"
  element :resultado, ".archive-title"

  def main #Método acessa a página inicial
    visit "/"
  end

  def botao_lupa
    lupa.click
  end

  def busca(termo)
    campo_busca.set termo
  end

  def envia_texto
    pesquisar.click
  end
end
