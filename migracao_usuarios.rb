arquivo = File.open("#{Rails.root}/usuarios.rb",'w')
Usuario.all.each do |u|
if u.local and u.local.escola?
arquivo.puts "u = Usuario.create(:email=>'#{u.local.codigo}#{u.cpf[0..2]}@seed.ap.gov.br',:lotacao=>Administracao::Local.where(:nome=>'#{u.local.nome}').first,:cpf=>'#{u.cpf}',:login=>'#{u.local.codigo}',:password=>'#{u.local.codigo}',:password_confirmation=>'#{u.local.codigo}',:nome=>'#{u.nome}',:grupo=>:diretor,:ativo=>true)"
elsif u.local and !u.local.escola?
arquivo.puts "u = Usuario.create(:email=>'#{u.local.codigo}#{u.cpf[0..2]}@seed.ap.gov.br',:lotacao=>Administracao::Local.where(:nome=>'#{u.local.nome}').first,:cpf=>'#{u.cpf}',:login=>'#{u.cpf}',:password=>'#{u.cpf}',:password_confirmation=>'#{u.cpf}',:nome=>'#{u.nome}',:grupo=>:gestor_setorial,:ativo=>true)"
else
puts u.nome
end
end
arquivo