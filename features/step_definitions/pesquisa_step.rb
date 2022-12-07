Dado("que acesso o blog do Agi") do
  pesquisa.main
end

Quando("eu faço pesquisa com o {string} utilizando a {string}") do |termo, acao|
  pesquisa.botao_lupa
  pesquisa.busca(termo)
  if acao.eql?("clicar")
    pesquisa.envia_texto
  else
    pesquisa.campo_busca.send_keys :enter
  end
end

Então("devo ver o {string} e o {string} exibidos na tela") do |resultado, termo|
  if resultado.eql?("Nenhum resultado")
    expect(find(".entry-title").text).to eql "#{resultado}"
  else
    expect(find(".archive-title").text).to eql "#{resultado}#{termo}"
  end
end

Quando("eu copio o termo da pesquisa e depois colo na barra o {string} pesquisado") do |termo|
  Clipboard.copy(termo)
  pesquisa.botao_lupa
  pesquisa.busca(Clipboard.paste.encode("UTF-8"))
  pesquisa.envia_texto
end
