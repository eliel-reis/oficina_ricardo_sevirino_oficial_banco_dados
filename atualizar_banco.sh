#!/bin/bash

echo "🔄 Gerando backup do banco..."
mysqldump -u root -p88797351@zZ oficina_sevirino > oficina_sevirino_backup.sql

if [ $? -eq 0 ]; then
  echo "✅ Backup gerado com sucesso."
  echo "📦 Commitando alterações no Git..."
  git add oficina_sevirino_backup.sql
  git commit -m "atualizando o banco de dados..."
  git push --force -u origin master
else
  echo "❌ Erro ao gerar o backup. Verifique a senha ou conexão com o MySQL."
fi