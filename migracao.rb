arquivo = File.open("/home/udes/ruby.rb",'w')
l = Local.where(:escola=>true).pluck(:id)
Funcionario.where(:ambiente=>/Escolar/).each do |f|
	f.ambiente = f.ambiente_nao_docente = "Secretaria Escolar"
	f.save
end
Funcionario.where(:cargo=>"Secretarário").each do |f|
	f.cargo = "Secretário Escolar"
	f.save
end
Funcionario.all.each do |f|
arquivo.puts("f = Funcionario.new(:nome=>'#{f.nome.gsub('\'','')}',:cpf=>'#{f.cpf}',:cadastro=>'#{f.cadastro.gsub('\'','')}',:carga_horaria=>Administracao::CargaHoraria.where(:carga_horaria=>#{(f.carga_horaria.split.first).to_i}).first,:classe=>Administracao::Classe.where(:nome=>'#{f.classe}').first,:quadro=>Administracao::Quadro.where(:nome=>'#{f.quadro}').first,:cargo=>Administracao::Cargo.where(:nome=>'#{f.cargo}').first,:lotacao=>Administracao::Local.where(:nome=>'#{helper.objeto_valor(f.local)}').first,:concurso=>Administracao::Concurso.where(:nome=>'#{f.concurso}').first,:municipio_opcao=>Municipio.where(:nome=>'#{helper.objeto_valor(f.municipio_concurso)}').first,:situacao=>Administracao::Situacao.where(:nome=>'#{f.situacao}').first,:disciplina_concurso=>Administracao::Disciplina.where(:nome=>'#{helper.objeto_valor(f.disciplina_concurso)}').first,:disciplina_atuacao=>Administracao::Disciplina.where(:nome=>'#{helper.objeto_valor(f.disciplina_atuacao)}').first,:ambiente=>Administracao::Ambiente.where(:nome=>'#{f.ambiente}').first)")
arquivo.puts("f.save!")
end
arquivo.close