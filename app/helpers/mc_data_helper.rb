module McDataHelper
  def estados_civil
    ["Solteiro - sem parceiro regular", "Solteiro - parcero regular, nao coabitando", "Casado ou coabitando", "Poligamo"]
  end
  def referenciados
    ["Proprio", "Parente/guardia", "SAAJ", "Servico de ATS", "Consultas externas", "Outro"]
  end
  def motivos
    ["Social/religioso", "Higiene", "Aparencia/estetica", "Proteccao parcial contra HIV", "Prazer sexual", "Medica", "Outro"]
  end
  def results
    ["HIV negativo", "HIV positivo", "Indetermino"]
  end
  def treatments
    ["Hemofilia ou doenacas hemorragicas", "Diabetes", "HIV/SIDA", "Outra"]
  end
  def manifestations
    ["Corrimento uretal", "Ulcera genita", "Dor na ereccao", "Inflamacao do escroto", "Dor ao urinar", "Dificuldade em retrair o prepucio", "Hipertensao", "Diabetes", "Outra"]
  end
  def types
    ["local", "regional","geral"]
  end
end 
