module ApplicationHelper
  def priority_level(num)
    names = ['Baixa', 'Media', 'Alta']
    names[num - 1]
  end

  def status_name(num)
    names = ['Aberto', 'Em andamento', 'Concluído']
    names[num - 1]
  end
end
