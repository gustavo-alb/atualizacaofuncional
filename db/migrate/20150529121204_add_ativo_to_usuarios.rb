class AddAtivoToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :ativo, :boolean,:default=>false
  end
end
