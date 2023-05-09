# README

O projeto simula o fluxo de um sistema de coleta em campo, essa coleta engloba basicamente
as entidades:

• Usuário: que identifica e autentica a pessoa no sistema para que ela saiba quais visitas
existem direcionadas a ela.

• Visita: que consiste numa tarefa com uma data agendada, e possui informações como,
data de checkin e checkout e usuário responsável por aquela visita.

• Formulários: são questionários que englobam várias perguntas específicas de algum
assunto.

• Perguntas: é autoexplicativo, são as perguntas de um formulário.

• Respostas: são as respostas das perguntas.


#General Problems

O projeto contém toda a implementação dos models e seus respectivos controllers, que garantem todos o métodos métodos index, create, update e delete.

#SOFT DELETE

O projeto possui SOFT DELETE em todos os models, sendo usado Paranoia.

#Validations

O projeto dispõe de validações para os modelos apresentados.

#JWT

O projeto aprensenta autenticação por token ao usuário.

#Spec/requests

O projeto apresenta testes feitos com Rspec, sendo os que testam os requests:

• user_spec.rb

• visit_spec.rb

• formulary_spec.rb

• question_spec.rb

• asnwer_spec.rb





